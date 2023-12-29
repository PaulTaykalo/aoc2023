import Foundation

// Set buffet to immediately flush output
setbuf(stdout, nil)

let inputTest = """
#.#####################
#.......#########...###
#######.#########.#.###
###.....#.>.>.###.#.###
###v#####.#v#.###.#.###
###.>...#.#.#.....#...#
###v###.#.#.#########.#
###...#.#.#.......#...#
#####.#.#.#######.#.###
#.....#.#.#.......#...#
#.#####.#.#.#########v#
#.#...#...#...###...>.#
#.#.#v#######v###.###v#
#...#.>.#...>.>.#.###.#
#####v#.#.###v#.#.###.#
#.....#...#...#.#.#...#
#.#########.###.#.#.###
#...###...#...#...#.###
###.###.#.###v#####v###
#...#...#.#.>.>.#.>.###
#.###.###.#.###.#.#v###
#.....###...###...#...#
#####################.#
"""

let input = loadFile("inputs/input23.txt")

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

func solve(input: String) -> Int {

    var map = CM<Character>(input)

    // Find all points that have more than2 empty spaces around

    var splitPoints = [Coord]()

    for y in 0..<map.height {
        for x in 0..<map.width {
            if map[y, x] == "#" {
                continue
            }
            let coord = Coord(x: x, y: y)

            let moves = [
                coord.top(),
                coord.bottom(),
                coord.left(),
                coord.right()
            ]
            .filter { $0.y >= 0 && $0.y < map.height && $0.x >= 0 && $0.x < map.width }
            .filter { map[$0.y, $0.x] != "#" } 
            .count

            if moves >= 3 {
                splitPoints.append(Coord(x: x, y: y))
            }
        }
    }

    // first is start
    splitPoints.insert(Coord(x: 1, y: 0), at: 0)
    
    // Last one is end
    splitPoints.append(Coord(x: map.width - 2, y: map.height - 1))

    for point in splitPoints {
        map[point.y, point.x] = "O"
    }

    var distances: [[Int]] = Array(repeating: Array(repeating: -1, count: splitPoints.count), count: splitPoints.count)


    for s in splitPoints {
        var visited = Set<Coord>()
        var queue = [s]
        var distance = 0
        while !queue.isEmpty {
            var nextQueue = [Coord]()
            for coord in queue {
                if visited.contains(coord) {
                    continue
                }
                visited.insert(coord)

                if splitPoints.contains(coord) && coord != s {
                    let index = splitPoints.firstIndex(of: coord)!
                    distances[splitPoints.firstIndex(of: s)!][index] = distance
                    distances[index][splitPoints.firstIndex(of: s)!] = distance
                    continue
                }

                distance += 1

                let moves = [
                    coord.top(),
                    coord.bottom(),
                    coord.left(),
                    coord.right()
                ]
                .filter { $0.y >= 0 && $0.y < map.height && $0.x >= 0 && $0.x < map.width }
                .filter { map[$0.y, $0.x] != "#" } 

                nextQueue.append(contentsOf: moves)
            }
            queue = nextQueue
        }
    }

    print(distances)


    var worstDistance = 10890

    var indexedSplitPoints = [Int: Coord]()
    var indexedCoords = [Coord: Int]()
    for (index, point) in splitPoints.enumerated() {
        indexedSplitPoints[index] = point
        indexedCoords[point] = index
    }

    struct State: Hashable {
        var distance: Int
        var visited: Set<Int>

        func canReach(_ index: Int, from: Int, distances:[[Int]]) -> Bool {
            guard index != from else { return true }
            guard !visited.contains(index) else { return false }

            // try to reach using distance map

            var visited = Set<Int>([from])
            var queue = [from]
            while !queue.isEmpty {
                let currIndex = queue.removeFirst()
                if currIndex == index {
                    return true
                }
                visited.insert(currIndex)

                for (index, distance) in distances[currIndex].enumerated() where distance != -1 {
                    if !visited.contains(index) {
                        queue.append(index)
                    }
                }
            }
            return false
        }
    }

    var maxDinstsances = splitPoints.enumerated().map { (index, point) in
        distances[index].max()!
    }


    var worstDinstances = splitPoints.map { _ in State(distance: 0, visited: Set<Int>()) }

    var currWave = [splitPoints.count - 1]

    while !currWave.isEmpty {

        let worsIndexSoFar = currWave.firstIndex(where: { worstDinstances[$0].distance > 0 }) ?? currWave.count - 1

        let currIndex = currWave[worsIndexSoFar]
        currWave.remove(at: worsIndexSoFar)

        // Let's process this index

        let distancesFromCurr = 
            distances[currIndex].enumerated()
            .filter { $0.element != -1 }

        for d in distancesFromCurr {
            let index = d.offset
            let distance = d.element

            let newDistance = distance + worstDinstances[currIndex].distance

            guard newDistance > worstDinstances[index].distance else { continue }
            guard !worstDinstances[index].visited.contains(currIndex) else { continue }
            guard worstDinstances[index].canReach(0, from: currIndex, distances: distances) else { continue }

            worstDinstances[index].distance = newDistance
            worstDinstances[index].visited.insert(currIndex)
            currWave.append(index)


            if index == 0 {
                    if newDistance > worstDistance {
                        print("New worst distance: \(newDistance)")
                        worstDistance = max(worstDistance, newDistance)
                    }
                }
        }
    }

    return worstDistance
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

    func moved(_ direction: Direction)-> Coord {
        var copy = self
        copy.move(direction)
        return copy
    }

    var description: String {
        return "(\(x), \(y))"
    }
}
