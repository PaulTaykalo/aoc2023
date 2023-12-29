import Foundation

// Set buffet to immediately flush output
setbuf(stdout, nil)

let inputTest = """
.|...\\....
|.-.\\.....
.....|-...
........|.
..........
.........\\
..../.\\\\..
.-.-/..|..
.|....-|.\\
..//.|....
"""

let input = loadFile("inputs/input16.txt")

let input3 = """

"""

/// ----------------------------------------------------------------------------------------------------

// MARK: - Solution ======================================================================================

/// ----------------------------------------------------------------------------------------------------

    struct Beam: Hashable, Equatable {
        var coord: Coord
        var direction: Direction
    }

func solve(input: String, initial: Beam ) -> Int {

    var cm = CM(input)

    var energized = CM(input)


    var beams = [initial]

    var visited = Set<Beam>()

    var wave = beams

var step = 0
    while !wave.isEmpty {
        step += 1

        var nextWave = [Beam]()
        for b in wave {
            visited.insert(b)
            if (b.coord.x >= 0 && b.coord.x < cm.width) && (b.coord.y >= 0 && b.coord.y < cm.height) {
                energized[b.coord.y, b.coord.x] = "#"
            }
            // energized[b.coord.y, b.coord.x] = "#"
        }

        func addToNextWave(_ beam: Beam) {
            if !visited.contains(beam) {
                nextWave.append(beam)
            }
        }

        for beam in wave {
            var nextBeam = beam
            var cc = nextBeam.coord
            cc.move(nextBeam.direction)
            var nextcoord = cc

            if nextcoord.x < 0 || nextcoord.x >= cm.width || nextcoord.y < 0 || nextcoord.y >= cm.height {
                continue
            }

            let nextChar = cm[nextcoord.y, nextcoord.x]
            switch nextChar {
            case ".":
                nextBeam.coord = nextcoord
                addToNextWave(nextBeam)
            case "/":
                switch nextBeam.direction {
                case .up:
                    nextBeam.direction = .right
                case .down:
                    nextBeam.direction = .left
                case .left:
                    nextBeam.direction = .down
                case .right:
                    nextBeam.direction = .up
                }
                nextBeam.coord = nextcoord
                addToNextWave(nextBeam)
            case "\\":
                switch nextBeam.direction {
                case .up:
                    nextBeam.direction = .left
                case .down:
                    nextBeam.direction = .right
                case .left:
                    nextBeam.direction = .up
                case .right:
                    nextBeam.direction = .down
                }
                nextBeam.coord = nextcoord
                addToNextWave(nextBeam)
            case "-":
                switch nextBeam.direction {
                case .up:
                    nextBeam.direction = .left
                    var secondBeam = nextBeam
                    secondBeam.direction = .right
                    secondBeam.coord = nextcoord
                    addToNextWave(secondBeam)
                case .down:
                    nextBeam.direction = .left
                    var secondBeam = nextBeam
                    secondBeam.direction = .right
                    secondBeam.coord = nextcoord
                    addToNextWave(secondBeam)
                case .left:
                    nextBeam.direction = .left
                case .right:
                    nextBeam.direction = .right
                }
                nextBeam.coord = nextcoord
                addToNextWave(nextBeam)

             case "|":
                switch nextBeam.direction {
                case .up:
                    nextBeam.direction = .up
                case .down:
                    nextBeam.direction = .down
                case .left:
                    nextBeam.direction = .up
                    var secondBeam = nextBeam
                    secondBeam.direction = .down
                    secondBeam.coord = nextcoord
                    addToNextWave(secondBeam)
                case .right:
                    nextBeam.direction = .up
                    var secondBeam = nextBeam
                    secondBeam.direction = .down
                    secondBeam.coord = nextcoord
                    addToNextWave(secondBeam)
                }
                nextBeam.coord = nextcoord
                addToNextWave(nextBeam) 
            default:
                break
            }    
        }
    //   print("============================")
    //     print("After setp \(step): ")
    //     energized.printMap()

        wave = nextWave
    }

    var sum = 0

    // Count of # in energized
    for row in energized.map {
        for c in row {
            if c == "#" {
                sum += 1
            }
        }
    }



    var strings = input.split(separator: "\n")

    print("Input: \(input)")

    print("Sum: \(sum)")
    return sum
}

var max = 0

var testCM = CM(input)
for i in 0..<testCM.width {

    var topBeam = Beam(coord: Coord(x: i, y: -1), direction: .down)
    var bottomBeam = Beam(coord: Coord(x: i, y: testCM.height), direction: .up)

    var top = solve(input: input, initial: topBeam)
    var bottom = solve(input: input, initial: bottomBeam)

    max = Swift.max(max, top, bottom)
}

for j in 0..<testCM.height {
    var leftBeam = Beam(coord: Coord(x: -1, y: j), direction: .right)
    var rightBeam = Beam(coord: Coord(x: testCM.width, y: j), direction: .left)

    var left = solve(input: input, initial: leftBeam)
    var right = solve(input: input, initial: rightBeam)
    max = Swift.max(max, left, right)
}

print("Result: \(max)")

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
