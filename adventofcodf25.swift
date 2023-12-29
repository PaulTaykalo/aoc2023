import Foundation

// Set buffet to immediately flush output
setbuf(stdout, nil)

let inputTest = """
jqt: rhn xhk nvd
rsh: frs pzl lsr
xhk: hfx
cmg: qnr nvd lhk bvb
rhn: xhk bvb hfx
bvb: xhk hfx
pzl: lsr hfx nvd
qnr: nvd
ntq: jqt hfx bvb xhk
nvd: lhk
lsr: lhk
rzs: qnr cmg lsr rsh
frs: qnr lhk lsr
"""

let input = loadFile("inputs/input25.txt")

let input3 = """

"""

/// ----------------------------------------------------------------------------------------------------
/// MARK: - Solution ===================================================================================
/// ----------------------------------------------------------------------------------------------------

let result = solve(input: input)
print("Result: \(result)")

/// ----------------------------------------------------------------------------------------------------
/// MARK: - Solution ===================================================================================
/// ----------------------------------------------------------------------------------------------------

private struct Rule {
    var from: String
    var to: [String]
}

private struct Wire: CustomStringConvertible {
    var from: String
    var to: String
    var usage = 0

    var description: String {
        return "\(from) -> \(to)"
    }
}

func solve(input: String) -> Int {

    var connections: [String: [String]] = [:]

    var rules: [Rule] = []
    var wires: [Wire] = []

    for line in input.split(separator: "\n") {
        let parts = line.split(separator: ":")
        let key = String(parts[0])
        let values = parts[1].split(separator: " ").map { String($0) }
        for value in values {
            connections[value, default: []].append(key)
            connections[key, default: []].append(value)
            wires.append(Wire(from: key, to: value))
        }
        rules.append(Rule(from: key, to: values))
    }

    // print(connections)

    // Check disconnections

    func canReach(from: String, to: String, without: [Wire]) -> Bool {
        var visited: Set<String> = []
        var queue: [String] = [from]
        while !queue.isEmpty {
            let current = queue.removeFirst()
            if visited.contains(current) { continue }
            visited.insert(current)
            for next in connections[current, default: []] {
                if without.contains(where: { $0.from == current && $0.to == next ||
                        $0.from == next && $0.to == current
                }) { continue }
                queue.append(next)
            }
            if visited.contains(to) { break }
        }
        return visited.contains(to)
    }

    func canReachEveryhing(from: String) -> Bool {
        var visited: Set<String> = []
        var queue: [String] = [from]
        while !queue.isEmpty {
            let current = queue.removeFirst()
            if visited.contains(current) { continue }
            visited.insert(current)
            for next in connections[current, default: []] {
                queue.append(next)
            }
        }
        return visited.count == connections.count
    }

    func canReachEveryhing(from: String, without: [Wire]) -> (Bool, Int) {
        var visited: Set<String> = []
        var queue: [String] = [from]
        while !queue.isEmpty {
            let current = queue.removeFirst()
            if visited.contains(current) { continue }
            visited.insert(current)
            for next in connections[current, default: []] {
                if without.contains(where: { $0.from == current && $0.to == next ||
                        $0.from == next && $0.to == current
                }) { continue }
                queue.append(next)
            }
        }
        return (visited.count == connections.count, visited.count)
    }

    func canReachEveryhing(removing: [Wire]) -> Bool {
        let canBeReached = removing.allSatisfy { wire in
            canReach(from: wire.from, to: wire.to, without: removing)
        }
        return canBeReached
    }

    var wireIdxBySourceDest: [String: [String: Int]] = [:]

    for w in wires.enumerated() {
        let wire = w.element
        let idx = w.offset
        wireIdxBySourceDest[wire.from, default: [:]][wire.to] = idx
        wireIdxBySourceDest[wire.to, default: [:]][wire.from] = idx
    }

    func reachByHeatingUp(from: String, to: String, wires: inout [Wire]) -> Bool {
        struct Node {
            var point: String
            var wireIndexes: Set<Int>
        }
        var visited: Set<String> = []
        var queue: [Node] = [Node(point: from, wireIndexes: [])]
        while !queue.isEmpty {
            let current = queue.removeFirst()
            if visited.contains(current.point) { continue }
            visited.insert(current.point)
            for next in connections[current.point, default: []] {
                // Find the index of wire
                var idx = wireIdxBySourceDest[current.point]![next]!

                var nextNode = Node(point: next, wireIndexes: current.wireIndexes.union([idx]))

                if next == to {
                    // print("Found \(current) -> \(next) \(idx)")
                    for i in nextNode.wireIndexes {
                        wires[i].usage += 1
                    }
                }
                queue.append(nextNode)
            }
            if visited.contains(to) { break }
        }
        return visited.contains(to)
    }

    // Heat up the wires

    var heatupWires = wires

    func heatupWires() {
        print("Heating up wires")
        for i in 0..<rules.count {
            let rule = rules[i]
            print("Processing \(rule.from) \(i)/\(rules.count)")

            for j in i + 1..<rules.count {
                let rule2 = rules[j]

                let from = rule.from
                let to = rule2.from

                reachByHeatingUp(from: from, to: to, wires: &heatupWires)
            }
        }

        print("Wires after heating up: \(heatupWires)")
    }

    heatupWires()

    print("Rules: \(rules.count)")
    print("Wires: \(wires.count)")

    var oldWires = wires

    // Try to use the most used wires first
    wires = heatupWires.sorted { $0.usage > $1.usage }

    // rando

    for i in 0..<wires.count {
        let wire = wires[i]

        for j in i + 1..<wires.count {
            let wire2 = wires[j]
            print("Processing [] \(wire2) \(i)/\(j)/\(wires.count)")

            for k in j + 1..<wires.count {
                let wire3 = wires[k]

                let source = rules.first(where: {
                    $0.from != wire.from && $0.from != wire.to &&
                        $0.from != wire2.from && $0.from != wire2.to &&
                        $0.from != wire3.from && $0.from != wire3.to
                })!.from

                let canBeReachedFast = canReachEveryhing(removing: [wire, wire2, wire3])

                if canBeReachedFast { continue }
                let canReach = canReachEveryhing(from: source, without: [wire, wire2, wire3])

                if !canReach.0 {
                    print("Cannot reach everything without \(wire), \(wire2), \(wire3)")
                    print("Groups sizes \(canReach.1) \(connections.count - canReach.1)")
                    let result = canReach.1 * (connections.count - canReach.1)
                    print("Result: \(result)")
                    exit(0)
                }
            }
        }
    }

    // let r = canReachEveryhing(from: "jqt")

    // print("Can reach everything: \(r)")

    var sum = 0

    print("Input: \(input)")

    print("Sum: \(sum)")
    return sum
}

/// ----------------------------------------------------------------------------------------------------
/// MARK: - Private ====================================================================================
/// ----------------------------------------------------------------------------------------------------

func loadFile(_ filename: String) -> String {
    let fileURL = URL(fileURLWithPath: filename)
    let contents = try! String(contentsOf: fileURL)
    return contents
}

struct CM<Element> {
    var map: [[Element]]
    var width: Int { map[0].count }
    var height: Int { map.count }

    subscript(_ y: Int, _ x: Int) -> Element {
        get { map[y][x] }
        set { map[y][x] = newValue }
    }

    func printMap() {
        for row in map {
            print(row.map { "\($0)" }.joined(separator: ""))
        }
    }
}

extension CM where Element: Equatable {
    static func == (lhs: CM, rhs: CM) -> Bool {
        lhs.map == rhs.map
    }
}

extension CM where Element: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(map)
    }
}

extension CM where Element == Character {
    init(_ input: String) {
        self.map = input.split(separator: "\n").map { Array($0) }
    }
}

enum Direction: CustomStringConvertible {
    case up
    case down
    case left
    case right

    var description: String {
        switch self {
        case .up: "up"
        case .down: "down"
        case .left: "left"
        case .right: "right"
        }
    }

    func cw() -> Direction {
        switch self {
        case .up:.right
        case .down:.left
        case .left:.up
        case .right:.down
        }
    }

    func ccw() -> Direction {
        switch self {
        case .up: .left
        case .down: .right
        case .left: .down
        case .right: .up
        }
    }
}

struct Coord: Hashable, Equatable, CustomStringConvertible {
    var x: Int
    var y: Int
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    func top() -> Coord { Coord(x: x, y: y - 1) }
    func bottom() -> Coord { Coord(x: x, y: y + 1) }
    func left() -> Coord { Coord(x: x - 1, y: y) }
    func right() -> Coord { Coord(x: x + 1, y: y) }

    mutating func move(_ direction: Direction) {
        switch direction {
        case .up: y -= 1
        case .down: y += 1
        case .left: x -= 1
        case .right: x += 1
        }
    }

    var description: String {
        return "(\(x), \(y))"
    }
}
