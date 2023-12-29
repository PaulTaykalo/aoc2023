import Foundation

// Set buffet to immediately flush output
setbuf(stdout, nil)

let input = loadFile("inputs/input14.txt")

let inputTest = """
O....#....
O.OO#....#
.....##...
OO.#O....O
.O.....O#.
O.#..O.#.#
..O..#O..O
.......O..
#....###..
#OO..#....
"""

let input3 = """

"""

/// ----------------------------------------------------------------------------------------------------

// MARK: - Solution ======================================================================================

/// ----------------------------------------------------------------------------------------------------

var sum = 0

var map = CM(input)
// map = CM(inputTest)

func rollNorth() {
    for y in 0..<map.height {
        for x in 0..<map.width {

            // Check if we can roll to the north
            let coord = Coord(x: x, y: y)

            guard map[coord.y, coord.x] == "O" else { continue }

            var north = coord
            while north.top().y >= 0, map[north.top().y, north.top().x] == "." {
                north = north.top()
            }

            if north != coord {
                // print("Rolling from \(coord) to \(north)")
                map[coord.y, coord.x] = "."
                map[north.y, north.x] = "O"
            }
        }
    }
}

func rollWest() {
        for x in 0..<map.width {

    for y in 0..<map.height {

            // Check if we can roll to the north
            let coord = Coord(x: x, y: y)

            guard map[coord.y, coord.x] == "O" else { continue }

            var west = coord
            while west.left().x >= 0, map[west.left().y, west.left().x] == "." {
                west = west.left()
            }

            if west != coord {
                // print("Rolling from \(coord) to \(west)")
                map[coord.y, coord.x] = "."
                map[west.y, west.x] = "O"
            }
        }
    }
}

func rollEast() {
    for x in (0..<map.width).reversed() {

        for y in 0..<map.height {

            // Check if we can roll to the north
            let coord = Coord(x: x, y: y)

            guard map[coord.y, coord.x] == "O" else { continue }

            var east = coord
            while east.right().x < map.width, map[east.right().y, east.right().x] == "." {
                east = east.right()
            }

            if east != coord {
                // print("Rolling from \(coord) to \(east)")
                map[coord.y, coord.x] = "."
                map[east.y, east.x] = "O"
            }
        }
    }
}

func rollSouth() {
    for y in (0..<map.height).reversed() {
        for x in 0..<map.width {

            // Check if we can roll to the north
            let coord = Coord(x: x, y: y)

            guard map[coord.y, coord.x] == "O" else { continue }

            var south = coord
            while south.bottom().y < map.height, map[south.bottom().y, south.bottom().x] == "." {
                south = south.bottom()
            }

            if south != coord {
                // print("Rolling from \(coord) to \(south)")
                map[coord.y, coord.x] = "."
                map[south.y, south.x] = "O"
            }
        }
    }
}

var cache = [CM: CM]()
var cache10 = [CM: CM]()
var cache100 = [CM: CM]()
var cache1000 = [CM: CM]()
var cache10000 = [CM: CM]()

func roll() {
    let before = map
    if let cached = cache[map] {
        map = cached
        return
    }
    rollNorth()
    rollWest()
    rollSouth()
    rollEast()

    cache[before] = map

}

func roll10() {
    let before = map
    if let cached = cache10[map] {
        map = cached
        return
    }
    for _ in 0..<10 {
        roll()
    }

    cache10[before] = map

}

func roll100() {
    let before = map
    if let cached = cache100[map] {
        map = cached
        return
    }
    for _ in 0..<10 {
        roll10()
    }

    cache100[before] = map

}

func roll1000() {
    let before = map
    if let cached = cache1000[map] {
        map = cached
        return
    }
    for _ in 0..<10 {
        roll100()
    }

    cache1000[before] = map

}

func roll10000() {
    let before = map
    if let cached = cache10000[map] {
        map = cached
        return
    }
    for _ in 0..<10 {
        roll1000()
    }

    cache10000[before] = map

}

var i = 0 // 1_000_000_000
while i != 1_000_000_000 {
    if i >= 10000 {
        roll10000()
        i += 10000
    } else if i >= 1000 {
        roll1000()
        i += 1000
    } else if i >= 100  {
        roll100()
        i += 100
    } else if i >= 10 {
        roll10()
        i += 10
    } else {
        roll()
        i += 1
    }
    if i % 1_000_000 == 0 {
        print("Roll \(i)")
    }
}

map.printMap()

// count weigh

for y in 0..<map.height {
    for x in 0..<map.width {
        if map[y, x] == "O" {
            sum += map.height - y
        }
    }
}

print("Sum: \(sum)")

// var inp = input.split(separator: "\n")
// var inp = inputTest.split(separator: "\n")

// print("Sum: \(sum)")

/// ----------------------------------------------------------------------------------------------------

// MARK: - Private ======================================================================================

/// ----------------------------------------------------------------------------------------------------

func loadFile(_ filename: String) -> String {
    let fileURL = URL(fileURLWithPath: filename)
    let contents = try! String(contentsOf: fileURL)
    return contents
}

struct CM: Hashable, Equatable {
    var map: [[Character]]
    var width: Int { map[0].count }
    var height: Int { map.count }

    init(_ input: String) {
        self.map = input.split(separator: "\n").map { Array($0) }
    }

    subscript(_ y: Int, _ x: Int) -> Character {
        get { map[y][x] }
        set { map[y][x] = newValue }
    }

    func printMap() {
        for row in map {
            print(String(row))
        }
    }

    static func == (lhs: CM, rhs: CM) -> Bool {
        lhs.map == rhs.map
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(map)
    }
}

enum Direction {
    case up
    case down
    case left
    case right
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

    var description: String { "(\(x), \(y))" }
}
