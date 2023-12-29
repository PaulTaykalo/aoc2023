import Foundation

// Set buffet to immediately flush output
setbuf(stdout, nil)

let inputTest = """
R 6 (#70c710)
D 5 (#0dc571)
L 2 (#5713f0)
D 2 (#d2c081)
R 2 (#59c680)
D 2 (#411b91)
L 5 (#8ceee2)
U 2 (#caa173)
L 1 (#1b58a2)
U 2 (#caa171)
R 2 (#7807d2)
U 3 (#a77fa3)
L 2 (#015232)
U 2 (#7a21e3)
"""

let input = loadFile("inputs/input18.txt")

let input3 = """

"""
/// ----------------------------------------------------------------------------------------------------

// MARK: - Solution ======================================================================================

/// ----------------------------------------------------------------------------------------------------
// let result = solve(input: inputTest)
let result = solve(input: input)
print("Result: \(result)")

/// ----------------------------------------------------------------------------------------------------

// MARK: - Solution ======================================================================================

/// ----------------------------------------------------------------------------------------------------

func solve(input: String) -> Int {

    var sum = 0

    var lines = input.split(separator: "\n")

    var curr = Coord(x: 0, y: 0)
    struct Interval: CustomStringConvertible {
        var minValue: Int
        var maxValue: Int
        var description: String {
            return "(\(minValue), \(maxValue))"
        }
    }

    var horizontalIntervals = [Int: [Interval]]()
    var verticalIntervals = [Int: [Interval]]()

    var totalDistance = 0

    for line in lines {
        let parts = line.split(separator: " ")
        var direction = parts[0]
        var distance = Int(parts[1])!
        let color = parts[2].dropFirst().dropFirst().dropLast()
        let colorInt = Int(color.prefix(5), radix: 16)!

        direction = switch color.last! {
        case "0": "R"
        case "1": "D"
        case "2": "L"
        case "3": "U"
        default: fatalError()
        }
        distance = colorInt

        totalDistance += distance

        print("Direction: \(direction), distance: \(distance), color: \(color)")

        switch direction {
        case "R":
            let nextX = curr.x + distance
            let interval = Interval(minValue: curr.x, maxValue: nextX)
            horizontalIntervals[curr.y, default: []].append(interval)
            curr = Coord(x: nextX, y: curr.y)
        case "L":
            let nextX = curr.x - distance
            let interval = Interval(minValue: nextX, maxValue: curr.x)
            horizontalIntervals[curr.y, default: []].append(interval)
            curr = Coord(x: nextX, y: curr.y)
        case "U":
            let nextY = curr.y - distance
            let interval = Interval(minValue: nextY, maxValue: curr.y)
            verticalIntervals[curr.x, default: []].append(interval)
            curr = Coord(x: curr.x, y: nextY)
        case "D":
            let nextY = curr.y + distance
            let interval = Interval(minValue: curr.y, maxValue: nextY)
            verticalIntervals[curr.x, default: []].append(interval)
            curr = Coord(x: curr.x, y: nextY)
        default:
            fatalError()
        }
    }

    print("Horizontal intervals: \(horizontalIntervals)")
    print("Vertical intervals: \(verticalIntervals)")

    let sortedHorizontalIntervals = horizontalIntervals.keys.sorted()
    let sortedVerticalIntervals = verticalIntervals.keys.sorted()

    var totalArea = 0
    for xpairs in sortedVerticalIntervals.pairs() {
        var isInside = false
        let x1 = xpairs.0
        let x2 = xpairs.1

        print("============ x1: \(x1), x2: \(x2) ============")

        for ypairs in sortedHorizontalIntervals.pairs() {

            let y1 = ypairs.0
            let y2 = ypairs.1

            // print("x1: \(x1), x2: \(x2), y1: \(y1), y2: \(y2)")

            // if we have a (x1, x2) inside any intervals at y1
            let x1Intervals = horizontalIntervals[y1]!
            let passedThrough = x1Intervals.contains(where: {
                // Check that x1 is fully inside the interval
                ($0.minValue...$0.maxValue).contains(x1) && ($0.minValue...$0.maxValue).contains(x2)
            })
            // print("passedThrough: \(passedThrough)")

            if !isInside {
                if passedThrough {
                    isInside = true
                    totalArea += (x2 - x1) * (y2 - y1)

                    // print("INSIDE: \((x2 - x1) * (y2 - y1)): \(totalArea) ")
                } else {
                    continue
                }
            } else {
                if passedThrough {
                    isInside = false

                    // totalArea += (x2 - x1) * 1
                    // print("OUTSIDE: \(x2 - x1) \(totalArea) ")
                } else {
                    totalArea += (x2 - x1) * (y2 - y1)
                    // print("STILL INSIDE: \((x2 - x1) * (y2 - y1)): \(totalArea) ")
                }
            }
        }

        if isInside {
            // totalArea += (x2 - x1) * 1
            // print("[FINAL] OUTSIDE: \(x2 - x1) \(totalArea) ")
        }
    }

    var totalLenghtOfIntervals =
        horizontalIntervals.values.reduce(0) { $0 + $1.reduce(0) { $0 + $1.maxValue - $1.minValue } }
            + verticalIntervals.values.reduce(0) { $0 + $1.reduce(0) { $0 + $1.maxValue - $1.minValue } }

    print("totalDistance: \(totalDistance)")

    return totalArea + (totalDistance + 2) / 2
}

extension Array {
    func pairs() -> [(Element, Element)] {
        zip(self, dropFirst()).map { $0 }
    }
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

    var description: String {
        return "(\(x), \(y))"
    }
}
