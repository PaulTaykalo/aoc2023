import Foundation

// Set buffet to immediately flush output
setbuf(stdout, nil)

let inputTest = """
...........
......##.#.
.###..#..#.
..#.#...#..
....#.#....
.....S.....
.##......#.
.......##..
.##.#.####.
.##...#.##.
...........
"""

let input = loadFile("inputs/input21.txt")

/// ----------------------------------------------------------------------------------------------------

// MARK: - Solution ======================================================================================

/// ----------------------------------------------------------------------------------------------------

let result = solve(input: inputTest, stepsCount: 1)
// let result = solve(input: input, stepsCount: 11)
// let result = solve(input: input)
print("Result: \(result)")

// let result2 = solve2(input: inputTest, stepsCount: 1)
// let result2 = solve2(input: input, stepsCount: 26501365)
// let result = solve(input: input)
// print("Result: \(result2)")

/// ----------------------------------------------------------------------------------------------------

// MARK: - Solution ======================================================================================

/// ----------------------------------------------------------------------------------------------------

func solve(input: String, stepsCount: Int = 100) -> Int {

    var map = CM<Character>(input)

    var start = Coord(x: 0, y: 0)
    for y in 0..<map.height {
        for x in 0..<map.width {
            if map[y, x] == "S" {
                start = Coord(x: x, y: y)
                map[y, x] = "O"
            }
        }
    }

    var steps = 0

    var mapSet = [Coord: Character]()

    for y in 0..<map.height {
        for x in 0..<map.width {
            mapSet[Coord(x: x, y: y)] = map[y, x]
        }
    }

    print("Start: \(mapSet)")

    func mapValue(_ coord: Coord) -> Character {
        if mapSet[coord] == nil {
            let actualCoordX = (coord.x + map.width * 10000) % map.width
            let actualCoordY = (coord.y + map.height * 10000) % map.height
            mapSet[coord] = map[actualCoordY, actualCoordX]
            return mapSet[coord]!
        }

        return mapSet[coord]!
    }

    func mapValue(_ y: Int, _ x: Int) -> Character {
        mapValue(Coord(x: x, y: y))
    }

    func setMapValue(_ coord: Coord, _ value: Character) {
        mapSet[coord] = value
    }

    func setMapValue(_ y: Int, _ x: Int, _ value: Character) {
        setMapValue(Coord(x: x, y: y), value)
    }

    func runOnce() {
        var initialPositions: Set<Coord> = Set()

        for m in mapSet {
            if m.value == "O" || m.value == "S" {
                initialPositions.insert(m.key)
            }
        }

        var nextPos = Set<Coord>()

        for m in initialPositions {
            let directions: [Direction] = [.up, .down, .left, .right]
            for d in directions {
                var pos = m
                pos.move(d)
                // guard pos.x >= 0 && pos.x < map.width && pos.y >= 0 && pos.y < map.height else { continue }
                guard !initialPositions.contains(pos) else { continue }
                guard mapValue(pos.y, pos.x) == "." else { continue }
                nextPos.insert(pos)
            }
        }

        for m in initialPositions {
            setMapValue(m.y, m.x, ".")
        }

        for m in nextPos {
            setMapValue(m.y, m.x, "O")
        }
    }

    var prev = 0
    (1...stepsCount).forEach { _ in
        runOnce()
        steps += 1

        var sum = 0
        for mapSet in mapSet {
            if mapSet.value == "O" {
                sum += 1
            }
        }
        prev = sum
    }

        func drawFullMap(_ dx: Int = 1) {
        for row in (0 - dx)...(0 + dx) {
            var lines: [String] = Array(repeating: "", count: map.height)
            for column in (0 - dx)...(0 + dx) {
                var inmap = map
                inmap[start.y, start.x] = "."
                var updatedMap = inmap

                for item in mapSet {
                    var x = item.key.x - column * map.width
                    var y: Int = item.key.y - row * map.height
                    guard x >= 0 && x < map.width && y >= 0 && y < map.height else { continue }
                    updatedMap[y, x] = item.value
                }

                lines = zip(lines, updatedMap.lines()).map { $0 + "|" + $1 }
            }

            print(lines.joined(separator: "\n"))
            print("======================================")
        }
    }



    // count O's

    var sum = 0

    for mapSet in mapSet {
        if mapSet.value == "O" {
            sum += 1
        }
    }
    drawFullMap(1)
    return sum
}

func solve2(input: String, stepsCount: Int?) -> Int {

    var map = CM<Character>(input)

    var start = Coord(x: 0, y: 0)
    for y in 0..<map.height {
        for x in 0..<map.width {
            if map[y, x] == "S" {
                start = Coord(x: x, y: y)
                map[y, x] = "O"
            }
        }
    }

    var steps = 0

    var mapSet = [Coord: Character]()

    for y in 0..<map.height {
        for x in 0..<map.width {
            mapSet[Coord(x: x, y: y)] = map[y, x]
        }
    }

    print("Start: \(mapSet)")

    func mapValue(_ coord: Coord) -> Character {
        if mapSet[coord] == nil {
            let actualCoordX = (coord.x + map.width * 10000) % map.width
            let actualCoordY = (coord.y + map.height * 10000) % map.height
            mapSet[coord] = map[actualCoordY, actualCoordX]
            return mapSet[coord]!
        }

        return mapSet[coord]!
    }

    func reset() {
        mapSet = [Coord: Character]()
        for y in 0..<map.height {
            for x in 0..<map.width {
                mapSet[Coord(x: x, y: y)] = map[y, x]
            }
        }
    }

    func mapValue(_ y: Int, _ x: Int) -> Character {
        mapValue(Coord(x: x, y: y))
    }

    func setMapValue(_ coord: Coord, _ value: Character) {
        mapSet[coord] = value
    }

    func setMapValue(_ y: Int, _ x: Int, _ value: Character) {
        setMapValue(Coord(x: x, y: y), value)
    }

    func runOnce() {
        var initialPositions: Set<Coord> = Set()

        for m in mapSet {
            if m.value == "O" || m.value == "S" {
                initialPositions.insert(m.key)
            }
        }

        var nextPos = Set<Coord>()

        for m in initialPositions {
            let directions: [Direction] = [.up, .down, .left, .right]
            for d in directions {
                var pos = m
                pos.move(d)
                // guard pos.x >= 0 && pos.x < map.width && pos.y >= 0 && pos.y < map.height else { continue }
                guard !initialPositions.contains(pos) else { continue }
                guard mapValue(pos.y, pos.x) == "." else { continue }
                nextPos.insert(pos)
            }
        }

        for m in initialPositions {
            setMapValue(m.y, m.x, ".")
        }

        for m in nextPos {
            setMapValue(m.y, m.x, "O")
        }
    }

    var cycleLength = map.width

    var expectedSteps = stepsCount ?? cycleLength

    func drawFullMap(_ dx: Int = 1) {
        for row in (0 - dx)...(0 + dx) {
            var lines: [String] = Array(repeating: "", count: map.height)
            for column in (0 - dx)...(0 + dx) {
                var inmap = map
                inmap[start.y, start.x] = "."
                var updatedMap = inmap

                for item in mapSet {
                    var x = item.key.x - column * map.width
                    var y: Int = item.key.y - row * map.height
                    guard x >= 0 && x < map.width && y >= 0 && y < map.height else { continue }
                    updatedMap[y, x] = item.value
                }

                lines = zip(lines, updatedMap.lines()).map { $0 + "|" + $1 }
            }

            print(lines.joined(separator: "\n"))
            print("======================================")
        }
    }

    func countAtMap(_ row: Int, _ column: Int, _ debug: Bool = false) -> Int {
        var sum = 0
        var inmap = map
        inmap[start.y, start.x] = "."
        var updatedMap = inmap

        for item in mapSet {
            var x = item.key.x - column * map.width
            var y: Int = item.key.y - row * map.height
            guard x >= 0 && x < map.width && y >= 0 && y < map.height else { continue }
            updatedMap[y, x] = item.value
            if item.value == "O" {
                if debug {
                    print("Found O at \(x), \(y)")
                }
                sum += 1
                updatedMap[y, x] = "*"
            }
        }
        if debug {
            updatedMap.printMap()
        }
        return sum
    }

    func countall() -> Int {
        mapSet.reduce(0) { $0 + ($1.value == "O" ? 1 : 0) }
    }

    // Run full cycle length and get center one
    print("CycleLength: \(cycleLength)")

    let fullCyclesCount = expectedSteps / cycleLength
    print("FullCyclesCount: \(fullCyclesCount)")

    let stepsLeft = expectedSteps % cycleLength

    let numberOfFullyFilledMapsSameAsCenter = (fullCyclesCount % 2 == 1) ? fullCyclesCount * fullCyclesCount : (fullCyclesCount - 1) * (fullCyclesCount - 1)
    let numberOfFullyFilledMaps = (fullCyclesCount % 2 == 1) ? (fullCyclesCount - 1) * (fullCyclesCount - 1) : fullCyclesCount * fullCyclesCount
    let numberOfDiagonals = (fullCyclesCount - 1)

    print("Same as center: \(numberOfFullyFilledMapsSameAsCenter)")
    print("Not same as center: \(numberOfFullyFilledMaps)")
    print("Diagonals: \(numberOfDiagonals)")


    reset()
    (1...cycleLength).forEach { _ in
        runOnce()
    }

    (1...cycleLength).forEach { _ in
        runOnce()
    }

    (0..<stepsLeft).forEach { _ in
        runOnce()
    }

    var sameAsCenterValue = countAtMap(0, 0)
    let pinPointLeft = countAtMap(0, -2)
    let pinPointRight = countAtMap(0, 2)
    let pinPointTop = countAtMap(-2, 0)
    let pinPointBottom = countAtMap(2, 0)
    let pinpoints = pinPointLeft + pinPointRight + pinPointTop + pinPointBottom


    var nonCenterValue = countAtMap(0, 1)

    if fullCyclesCount > 1 {
        if fullCyclesCount % 2 == 0 {
            sameAsCenterValue = countAtMap(0, 0)
            nonCenterValue = countAtMap(0, 1)
        } else {
            sameAsCenterValue = countAtMap(0, 1)
            nonCenterValue = countAtMap(0, 0)
        }
    }

    var diagonals = countAtMap(1, 1) + countAtMap(1, -1) + countAtMap(-1, 1) + countAtMap(-1, -1)
    var overDiagonals = countAtMap(2, 1) + countAtMap(2, -1) + countAtMap(-2, 1) + countAtMap(-2, -1)

    var overPoints = countAtMap(3, 0) + countAtMap(-3, 0) + countAtMap(0, 3) + countAtMap(0, -3)


    let total = numberOfFullyFilledMapsSameAsCenter * sameAsCenterValue + numberOfFullyFilledMaps * nonCenterValue +
        numberOfDiagonals * diagonals + pinpoints + overPoints + overDiagonals * (numberOfDiagonals + 1)

    drawFullMap(1)

    print("Left: \(pinPointLeft)")
    print("Right: \(pinPointRight)")
    print("Top: \(pinPointTop)")
    print("Bottom: \(pinPointBottom)")
    print("Final total is \(total)")

    
    return 0
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

    func lines() -> [String] {
        map.map { row in row.map { "\($0)" }.joined(separator: "") }
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
