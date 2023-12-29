
import Foundation

// Set buffet to immediately flush output
setbuf(stdout, nil)

let inputTest = """
broadcaster -> a, b, c
%a -> b
%b -> c
%c -> inv
&inv -> a
"""

let inputTest2 = """
broadcaster -> a
%a -> inv, con
&inv -> b
%b -> con
&con -> output
"""

let input = loadFile("inputs/input20.txt")

let input3 = """
"""

enum SignalType {
    case low
    case high
}

enum ModuleType {
    case broadcaster
    case conjuction
    case flipflop
}

/// ----------------------------------------------------------------------------------------------------
/// MARK: - Solution ======================================================================================
/// ----------------------------------------------------------------------------------------------------

//  let result = solve(input: inputTest)
let result = solve(input: input)

// print("Result: \(result)")

/// ----------------------------------------------------------------------------------------------------
/// MARK: - Solution ======================================================================================
/// ----------------------------------------------------------------------------------------------------

func solve(input: String) -> Int {

    final class Elemen: CustomStringConvertible {
        var elementsByName: [String: Elemen] = [:]

        var name: String
        var type: ModuleType

        var isOff = true // Only for flipflops

        var connections: [String] = []

        var lastInputsValues: [String: SignalType] = [:]

        init(name: String, type: ModuleType) {
            self.name = name
            self.type = type
        }

        var outPut: SignalType = .low

        var lastPulse: (SignalType, String) = (.low, "")

        var lowPulsesSent = 0
        var highPulsesSent = 0

//        func propagate(procesingQueue: inout [(String, SignalType)]) {
//            sendPulse(pulse: lastPulse.0, from: lastPulse.1, procesingQueue: &procesingQueue)
//        }

        func sendPulse(pulse: SignalType, from: String, procesingQueue: inout [(String, SignalType)]) {
            if pulse == .low {
                lowPulsesSent += 1
            } else {
                highPulsesSent += 1
            }
            lastInputsValues[from] = pulse

            switch type {
            case .broadcaster:
                propagatePulse(pulse, procesingQueue: &procesingQueue)
            case .flipflop:
                if pulse == .high {

                    // Nothing
                } else {
                    isOff = !isOff

                    if isOff {
                        propagatePulse(.low, procesingQueue: &procesingQueue)
                    } else {
                        propagatePulse(.high, procesingQueue: &procesingQueue)
                    }
                }
            case .conjuction:
                let allHigh = lastInputsValues.values.allSatisfy { $0 == .high }
                if allHigh {
                    propagatePulse(.low, procesingQueue: &procesingQueue)
                } else {
                    propagatePulse(.high, procesingQueue: &procesingQueue)
                }
            }
        }

        func propagatePulse(_ pulse: SignalType, procesingQueue: inout [(String, SignalType)]) {
            for c in connections {
                // print("\(name) -\(pulse)-> \(c)")
                elementsByName[c]?.lastPulse = (pulse, name)
                elementsByName[c]?.lastInputsValues[name] = pulse
                procesingQueue.append((c, pulse))
            }

            while !procesingQueue.isEmpty {
                let c = procesingQueue.removeFirst()
                elementsByName[c.0]?.sendPulse(pulse: c.1, from: c.0, procesingQueue: &procesingQueue)
            }
        }

        var description: String {
            return "\(name) \(type) \(connections)"
        }
    }

    var elements: [Elemen] = []

    var broadcaster: Elemen!
    var output: Elemen!

    var elementsByName = [String: Elemen]()

    for line in input.split(separator: "\n") {
        let parts = line.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let nameAndConnections = parts.split(separator: "->")
        var name = String(nameAndConnections[0]).trimmingCharacters(in: .whitespacesAndNewlines)
        let connections = nameAndConnections[1].split(separator: ",").map { String($0).trimmingCharacters(in: .whitespacesAndNewlines) }

        if name.first == "%" {
            name.removeFirst()
            let element = Elemen(name: name, type: .flipflop)
            element.connections = connections
            elements.append(element)
            elementsByName[name] = element

        } else if name.first == "&" {
            name.removeFirst()
            let element = Elemen(name: name, type: .conjuction)
            element.connections = connections
            elements.append(element)
            elementsByName[name] = element

        } else {
            let element = Elemen(name: name, type: .broadcaster)
            element.connections = connections
            elements.append(element)
            elementsByName[name] = element
            broadcaster = element
        }
    }

    // Grab all outputs that are not in the connections

    var addedelements = [Elemen]()

    for element in elements {
        for connection in element.connections {
            if elementsByName[connection] == nil {
                let el = Elemen(name: connection, type: .broadcaster)
                addedelements.append(el)
                elementsByName[connection] = el
            }
        }
    }

    elements.append(contentsOf: addedelements)

    let button = Elemen(name: "button", type: .broadcaster)
    elementsByName["button"] = button
    button.connections = ["broadcaster"]
    elements.append(button)

    for element in elements {
        element.elementsByName = elementsByName
    }

    // Initialize all inputs
    for element in elements {
        for connection in element.connections {
            elementsByName[connection]?.lastInputsValues[element.name] = .low
        }
    }

//    button -low-> broadcaster
//    broadcaster -low-> a
//    broadcaster -low-> b
//    broadcaster -low-> c
//    a -high-> b
//    b -high-> c
//    c -high-> inv
//    inv -low-> a
//    a -low-> b
//    b -low-> c
//    c -low-> inv
//    inv -high-> a

//    button -low-> broadcaster
//    broadcaster -low-> a
//    a -high-> inv
//    a -high-> con
//    inv -low-> b
//    con -high-> output
//    b -high-> con
//    con -low-> output

    var propagation: [(String, SignalType)] = []
//    var pressingCount = 1000
//    (1...pressingCount).forEach { i in
//        print("Pressing \(i)")
//        button.sendPulse(pulse: .low, from: "button", procesingQueue: &propagation)
//    }

    var pressingCount = 0
    var hasPressed = false
    while !hasPressed {
        pressingCount += 1
        if pressingCount % 10000 == 0 {
            print("Pressing \(pressingCount)")
        }
        button.sendPulse(pulse: .low, from: "button", procesingQueue: &propagation)

        hasPressed = elementsByName["mk"]!.lowPulsesSent > 0
    }

    print("Total number is \(pressingCount)")

//    var totalSumLow = 0
//    var totalSumHigh = 0
//
//    for element in elements {
//        totalSumLow += element.lowPulsesSent
//        totalSumHigh += element.highPulsesSent
//    }
//
//
//    totalSumLow -= pressingCount
//    print("Total low: \(totalSumLow)")
//    print("Total high: \(totalSumHigh)")
//
//    let mult = totalSumLow * totalSumHigh
//    print("Mult: \(mult)")

    print(elements)

    var sum = 0

    print("Input: \(input)")

    print("Sum: \(sum)")

    print(lcm(lcm(lcm(3767, 4007), 3923), 3931))
    return sum
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return abs(a * b) / gcd(a, b)
}

func gcd(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    while b != 0 {
        let t = b
        b = a % b
        a = t
    }
    return a
}

/// ----------------------------------------------------------------------------------------------------
/// MARK: - Private ======================================================================================
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
