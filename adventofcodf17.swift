import Foundation

// Set buffet to immediately flush output
setbuf(stdout, nil)

let inputTest = """
2413432311323
3215453535623
3255245654254
3446585845452
4546657867536
1438598798454
4457876987766
3637877979653
4654967986887
4564679986453
1224686865563
2546548887735
4322674655533
"""

let input = loadFile("inputs/input17.txt")

let inputTest2 = """
11211
11111
11111
11222
"""

/// ----------------------------------------------------------------------------------------------------

// MARK: - Solution ======================================================================================

/// ----------------------------------------------------------------------------------------------------

// var result = solve(input: inputTest)
var result = solve(input: input)
print("Result: \(result)")

/// ----------------------------------------------------------------------------------------------------

// MARK: - Solution ======================================================================================

/// ----------------------------------------------------------------------------------------------------

struct Beam: CustomStringConvertible {
    var direction: Direction
    var coord: Coord
    var movedCount: Int
    var currHeat = 0
    var processed = false

    public var description: String {
        return "\(processed ? "✅" : "❌") ,[\(coord)], \(direction), \(movedCount), \(currHeat))"
    }

    func moved() -> Beam {
        var new = self
        new.coord.move(new.direction)
        new.movedCount += 1
        return new
    }

    func rotatedCW() -> Beam {
        var new = self
        new.direction = new.direction.cw()
        new.coord.move(new.direction)
        new.movedCount = 1
        return new
    }

    func rotatedCCW() -> Beam {
        var new = self
        new.direction = new.direction.ccw()
        new.coord.move(new.direction)
        new.movedCount = 1
        return new
    }

    func tryRotatedCW() -> Beam? {
        guard movedCount > 3 else {
            return nil
        }
        return rotatedCW()
    }

    func tryRotatedCCW() -> Beam? {
        guard movedCount > 3 else {
            return nil
        }
        return rotatedCCW()
    }
}

struct State: CustomStringConvertible {
    var coord: Coord
    var beams: [Direction: [Int: Beam]] = [:]
    var allBeams: [Beam] {
        return beams.values.flatMap { $0.values }
    }

    mutating func update(_ beam: Beam) {
        var directionBeams = beams[beam.direction, default: [:]]
        if let existingBeam = directionBeams[beam.movedCount] {
            if existingBeam.currHeat > beam.currHeat {
                directionBeams[beam.movedCount] = beam
            }
        } else {
            directionBeams[beam.movedCount] = beam
        }
        beams[beam.direction] = directionBeams
    }

    public var description: String {
        return "(\(coord), \(beams))"
    }
}

func solve(input: String) -> Int {

    var minHeat = Int.max

    var charMap = CM(input)

    var beamMap: CM<State> = CM(map: charMap.map.enumerated().map { y, row in
        row.enumerated().map { x, _ in
            State(coord: Coord(x: x, y: y), beams: [:])
        }
    })

    var heatMap: CM<Int> = CM(map: charMap.map.enumerated().map { _, row in
        row.enumerated().map { _, char in
            Int("\(char)")!
        }
    })

    func explodeBeam(_ beam: Beam) -> [Beam] {
        var beams = [beam.moved(), beam.tryRotatedCW(), beam.tryRotatedCCW()].compactMap { $0 }
        beams = beams.filter { $0.coord.x >= 0 && $0.coord.x < charMap.width && $0.coord.y >= 0 && $0.coord.y < charMap.height }
        // beams = beams.filter { $0.movedCount < 4 }
        beams = beams.filter { $0.movedCount < 11 }

        // Apply heat
        beams = beams.map { beam in
            var new = beam
            new.currHeat += heatMap[beam.coord.y, beam.coord.x]
            return new
        }
        beams = beams.filter { $0.currHeat < minHeat }

        // if !beams.isEmpty {
            // print("Beam \(beam) => Beams: \(beams)")
        // }
        return beams
    }

    // Initialize beam map
    beamMap[0, 0].beams[.right] = [0: Beam(direction: .right, coord: Coord(x: 0, y: 0), movedCount: 0)]

    var processedCount = 0

    var iteration = 0

    while iteration < 100 {

        processedCount = 0

        for y in 0..<charMap.height {
            for x in 0..<charMap.width {
                let state = beamMap[y, x]
                var stateBeams = state.beams

                // Find all unprocessed beams
                let unprocessedBeams = state.allBeams.filter { !$0.processed }
                if unprocessedBeams.isEmpty {
                    continue
                }

                // print("Unprocessed beams at \(x),\(y): \(unprocessedBeams.count) -> \(unprocessedBeams)")

                // Process all unprocessed beams
                for beam in unprocessedBeams {
                    let explodedBeams = explodeBeam(beam)
                    for explodedBeam in explodedBeams {
                        beamMap[explodedBeam.coord.y, explodedBeam.coord.x].update(explodedBeam)

                        // print("Updated beam: \(explodedBeam) -> \(beamMap[explodedBeam.coord.y, explodedBeam.coord.x])")

                        if explodedBeam.coord.y == charMap.height - 1 && explodedBeam.coord.x == charMap.width - 1 && explodedBeam
                            .currHeat < minHeat {
                            // print("Updated minHeat: \(minHeat) -> \(explodedBeam.currHeat)")
                            minHeat = min(minHeat, explodedBeam.currHeat)
                        }
                    }
                    processedCount += 1
                    beamMap[y, x].beams[beam.direction, default: [:]][beam.movedCount]?.processed = true
                }
            }
        }

        
        if processedCount == 0 {
            break
        }

        print("Iteration: \(iteration), processed: \(processedCount), minHeat: \(minHeat)")
        iteration += 1
    }

    // beamMap.printMap()

    func rollupPath() -> [Beam] {
        let minBeam = beamMap[beamMap.height - 1, beamMap.width - 1].allBeams.min { $0.currHeat < $1.currHeat }!
        var path = [minBeam]
        var currBeam = minBeam
        while currBeam.coord.x != 0 || currBeam.coord.y != 0 {
            let nextCoord = currBeam.coord.moveBack(currBeam.direction)
            let prevBeam = beamMap[nextCoord.y, nextCoord.x].allBeams.min { $0.currHeat < $1.currHeat }!
            path.append(prevBeam)
            currBeam = prevBeam
        }
        return path.reversed()
    }

    print("Rollup path: \(rollupPath())")

    let rolledPath = rollupPath()

    for beam in rolledPath {
        charMap[beam.coord.y, beam.coord.x] = "X"
    }

    charMap.printMap()

    var sum = 0

    print("Input: \(input)")

    print("Sum: \(sum)")
    return sum
}

/// ----------------------------------------------------------------------------------------------------

// MARK: - Private ======================================================================================

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
        case .left:"left"
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

    func top() -> Coord {
        return Coord(x: x, y: y - 1)
    }

    func bottom() -> Coord {
        return Coord(x: x, y: y + 1)
    }

    func left() -> Coord {
        return Coord(x: x - 1, y: y)
    }

    func right() -> Coord {
        return Coord(x: x + 1, y: y)
    }

    mutating func move(_ direction: Direction) {
        switch direction {
        case .up:
            y -= 1
        case .down:
            y += 1
        case .left:
            x -= 1
        case .right:
            x += 1
        }
    }

    func moved(_ direction: Direction) -> Coord {
        var new = self
        new.move(direction)
        return new
    }

    func moveBack(_ direction: Direction) -> Coord {
        switch direction {
        case .up:
            return moved(.down)
        case .down:
            return moved(.up)
        case .left:
            return moved(.right)
        case .right:
            return moved(.left)
        }
    }

    var description: String {
        return "(\(x), \(y))"
    }
}
