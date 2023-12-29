import Foundation

// Set buffet to immediately flush output
setbuf(stdout, nil)

let inputTest = """
...#......
.......#..
#.........
..........
......#...
.#........
.........#
..........
.......#..
#...#.....
"""

let input = """
.#......................#........................#.........................#................#...............................................
...........................................................................................................#...........#....................
........#...................#.......#............................................#....................#.................................#...
.........................................#............#.........................................#...........................................
....................................................................................................................................#.......
#...........................................................................................................................................
................#......................................................#.............#......................................................
......#..............#.........#......#........................#............................................................................
............#.....................................#......................................#...........................#......................
.....................................................................................................#....................#.................
.....................................................................#.......#............................#......#..............#...........
#...........................................................................................................................................
...................................#.....................................#..................................................................
.........#................#................................#...........................#......#.......................#..................#..
...............#....................................#..........................................................#............................
...........................................#..................................................................................#.............
...............................#...........................................#.......#.................#......................................
#..............................................................#..........................................#.................................
...........#.........................................................#.............................................#........................
......................#...........#...........................................#..........#.....#............................................
........................................................#...............................................................#......#............
...#..........#.........................#................................#..................................................................
............................................................................................................................................
..................#..................................#..............#..................................................................#....
...............................#...........................#...................#.............................#..............................
....................................#....................................................#.............#...............#...................#
................................................................................................#...........................................
.#............#............#........................................................#......................................#................
.......#...................................#........#.......................................................................................
..........................................................#.................................................................................
..............................................................................#..............#.......#................................#.....
.................................#..........................................................................#.........#.....................
....................#....................................................................#......................................#...........
........#...................................#.....................................................................#.........................
#........................#.........................#.............................................#..........................................
.................#.........................................#.........................#......................................................
..............................#.................................#.......................................................................#...
......#...............................#..............................................................................#.............#........
......................................................#..................#.................#............#.......#...........................
..............#...........#......................................................#..........................................................
............................................................#...............................................................................
.....................................................................#......................................................................
.#..................#........................................................................#................................#.............
.........................................#..........................................................................#.......................
.........#.....#..............#..............................................#.........#..............#..............................#.....#
...............................................................................................................#............................
...................................................#...................#...................................................#................
.......................#...........#..............................#......................................#..............................#...
...........#................#...............................................................................................................
...........................................................................#.................................#..............................
................#......................................................................#...........#........................................
.....................................................................................................................#........#......#......
..................................................#.............#..............................#............................................
......#.....#...........#..................#..............................................................#.................................
............................................................................................................................................
...................#...................#..................#....................................................#........................#...
............................................................................................................................................
.........................................................................#..................#...............................................
.....................................................................................................................................#.....#
...................................#...........#....................#.......................................................................
..#.....#.....................................................................#.........................#...................................
...........................#.........................#..................................#..........#..................#.....................
..................................................................................#............................................#............
..............#................#...............................#............................................................................
............................................................................................................................................
.....................................#.........#......................................#..............#........#..........#..................
.....#............#...............................................#........................................................................#
..........................................................................................................#.................................
..........#.............#.....#...........................#.....................#...........................................................
...............................................................#.................................#....................................#.....
....................................#..................................#....................................................................
#......................................................................................................#..........#..........#..............
..........................................#.............................................#...................................................
.................#.............................#........#......................................#.........................#...............#..
......................................#..........................................#..........................................................
............#...............................................#...............................................................................
...........................................................................................#..........................................#.....
.....#................#...............................................................................#.....................................
............................#......................#................#.............................................................#.........
...................................#.........................................................................................#..............
.#.......................................................................#.........#........................#...............................
.........................................#.................#.....................................#...............#..........................
..............................#.............................................................................................................
.................#...............................#.............................#.......#.....#.......#......................................
.......................................................................#....................................................................
............................................................................................................................................
......................................#...........................#.........................................................................
.................................................................................#..........................................................
..................................#.......................#.................................................................................
......................#..............................................#...........................#..........................#.....#.....#...
...........................#............#................................................................#.....#............................
...........................................................................................#................................................
............................................................................................................................................
.........#.........#..........................................................#.............................#.........#.............#.......
...........................................#.............#..................................................................................
............................#..........................................................#..........................#.........................
.......................#.........#..........................................................................................................
......#...........................................#....................#.......................#..........#.................................
...............#.................................................................#..........................................#...............
..........................................................#......#....................................................#............#......#.
......................................................................................................#.....................................
...............................................................................................................#............................
...............................#.....#................#.............................#.......................................................
..#............................................................................#...............#..........................#.................
.......#...................................#........................................................#.......................................
..............................................................#........#.....................................#..............................
...........................#.......#..............#......................................................................................#..
......................#......................................................................................................#......#.......
..............#...........................................................................................#.............#...................
..........................................................#.........#.........................#.............................................
.......................................#.......#...............................#..............................#.............................
................................#...................................................#.......................................................
#..........................................#........#..........#............................................................................
...........................................................................#............#.........................#..................#......
............#...........................................................................................#...................................
...................................#........................................................#...............................................
........................#.................................#......#.......................................................#..................
........#................................................................#..................................................................
...................#..............................#.................................#..............#.........#.....#.............#..........
..........................................#...................#........................................................................#....
.........................................................................................................#..................................
..............................#.........................................................#...................................................
.#..............#...........................................................................................................................
...................................#...........#........................................................................#...................
.........#...............................#........................................................................................#.........
....................#........................................................................#.....................#.........#............#.
..............................................................................#.......................#.......#.............................
.................................#.......................#...............#...............#..................................................
............................................................................................................................................
............................#........#......................................................................................................
......................#........................................#................#...........#..............#........................#.......
.....#.......#........................................................................#..........#........................................#.
..................................................#.........................................................................................
...............................................................................................................#.........#..................
.........................#........#........................#.............#..........................#.......................................
..........#..............................#......................#..........................#................................................
#..................................................................................#........................................................
...............................#................................................................................................#...........
.....................................................#.......#.............................................#................................
......#...............#..............#.........#..................#...............................................#......#...............#..
"""

let input3 = """
"""

let input4 = """
"""

var map = inputTest.split(separator: "\n").map { String($0).map { $0 } }
// map = input3.split(separator: "\n").map { String($0).map { $0 } }
map = input.split(separator: "\n").map { String($0).map { $0 } }
// map = input4.split(separator: "\n").map { String($0).map { $0 } }


var updatedMap = map

var expandedYs = [Int]()
var expandedXs = [Int]()


for line in map.enumerated().reversed() {
    if line.element.allSatisfy({ $0 == "." }) {
        expandedYs.append(line.offset)
    }
}
let width = updatedMap[0].count
for x in 0..<map[0].count {
    let idx = map[0].count - x - 1
    if map.allSatisfy({ $0[idx] == "." }) {
            expandedXs.append(idx)
    }
}

print("Expanded Ys: \(expandedYs)")
print("Expanded Xs: \(expandedXs)")

var galaxies: Set<Coord> = Set()

for y in 0..<updatedMap.count {
    for x in 0..<updatedMap[y].count {
        if updatedMap[y][x] == "#" {
            galaxies.insert(Coord(x: x, y: y))
        }
    }
}

print("Galaxies: \(galaxies)")

let expanded_distance_count = 1_000_000

var galaxiesArray = Array(galaxies)

var totalSum = 0
for i in 0..<galaxiesArray.count {
    for j in i+1..<galaxiesArray.count {
        let galaxy1 = galaxiesArray[i]
        let galaxy2 = galaxiesArray[j]
        totalSum += galaxy1.manhattanDistance(to: galaxy2)

        // Add expanded galaxies if thery're between the two galaxies
        let minx = min(galaxy1.x, galaxy2.x)
        let maxx = max(galaxy1.x, galaxy2.x)
        for x in minx..<maxx {
            if expandedXs.contains(x) {
                // -1 since we already calculated the distance between the two galaxies as 1
                totalSum += (expanded_distance_count - 1)
            }
        }

        let miny = min(galaxy1.y, galaxy2.y)
        let maxy = max(galaxy1.y, galaxy2.y)
        for y in miny..<maxy {
            if expandedYs.contains(y) {
                // -1 since we already calculated the distance between the two galaxies as 1
                totalSum += (expanded_distance_count - 1)
            }
        }
    }
}

print("Total sum: \(totalSum)")


// print("startCoord: \(startCoord)")

// print("map: \(map)")


// print("Total sum: \(totalSum)")
// print("Total start sum: \(totalStartSum)")

// MARK: - Helpers

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

extension Coord {
    func manhattanDistance(to other: Coord) -> Int {
        return abs(x - other.x) + abs(y - other.y)
    }
    
}

extension String {
    func components(withMaxLength length: Int) -> [String] {
        return stride(from: 0, to: self.count, by: length).map {
            let start = self.index(self.startIndex, offsetBy: $0)
            let end = self.index(start, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            return String(self[start..<end])
        }
    }
}