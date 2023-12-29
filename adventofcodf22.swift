import Foundation
setbuf(stdout, nil)

let inputTest = """
1,0,1~1,2,1
0,0,2~2,0,2
0,2,3~2,2,3
0,0,4~0,2,4
2,0,5~2,2,5
0,1,6~2,1,6
1,1,8~1,1,9
"""

let input = loadFile("inputs/input22.txt")

let input3 = """

"""

struct Coord3D: CustomStringConvertible {
    var x: Int
    var y: Int
    var z: Int
    var description: String {
        return "(\(x), \(y), \(z))"
    }
}

struct Brick: CustomStringConvertible {
    var idx = 0
    var tl: Coord3D
    var br: Coord3D
    var description: String {
        return "\(idx): \(tl)~\(br)"
    }

    var minX: Int { min(tl.x, br.x) }
    var maxX: Int { max(tl.x, br.x) }
    var minY: Int { min(tl.y, br.y) }
    var maxY: Int { max(tl.y, br.y) }
    var minZ: Int { min(tl.z, br.z) }
    var maxZ: Int { max(tl.z, br.z) }

    func intersects(_ brick: Brick) -> Bool {
        if brick.minX > maxX { return false }
        if brick.maxX < minX { return false }
        if brick.minY > maxY { return false }
        if brick.maxY < minY { return false }
        if brick.minZ > maxZ { return false }
        if brick.maxZ < minZ { return false }
        return true
    }

    func moveDown() -> Brick {
        var brick = self
        brick.tl.z -= 1
        brick.br.z -= 1
        return brick
    }

    func moveUp() -> Brick {
        var brick = self
        brick.tl.z += 1
        brick.br.z += 1
        return brick
    }
}

/// ----------------------------------------------------------------------------------------------------
/// MARK: - Solution ===================================================================================
/// ----------------------------------------------------------------------------------------------------

// let result = solve(input: inputTest)
let result = solve(input: input)
print("Result: \(result)")

/// ----------------------------------------------------------------------------------------------------
/// MARK: - Solution ===================================================================================
/// ----------------------------------------------------------------------------------------------------

func solve(input: String) -> Int {

    var sum = 0
    var bricks = [Brick]()

    let lines = input.split(separator: "\n")
    let allLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var idx = -1
    for line in lines {
        idx += 1
        let name = allLetters[allLetters.index(allLetters.startIndex, offsetBy: idx % allLetters.count)]
        var brick = Brick(
            idx: idx,
            tl: Coord3D(x: 0, y: 0, z: 0), br: Coord3D(x: 0, y: 0, z: 0)
        )
        let parts = line.split(separator: "~")

        let tl = parts[0].split(separator: ",").map { Int($0)! }
        let br = parts[1].split(separator: ",").map { Int($0)! }

        brick.tl = Coord3D(x: tl[0], y: tl[1], z: tl[2])
        brick.br = Coord3D(x: br[0], y: br[1], z: br[2])

        if brick.br.z < brick.tl.z {
            brick.tl = Coord3D(x: br[0], y: br[1], z: br[2])
            brick.br = Coord3D(x: tl[0], y: tl[1], z: tl[2])
        }

        bricks.append(brick)
    }

    print(bricks)

    func intersects(_ brick1: Brick, _ brick2: Brick) -> Bool {
        brick1.intersects(brick2)
    }

    func updateBrocks(_ startFrom: Int = 0, _ bricks: inout [Brick]) -> Int? {

        for i in startFrom..<bricks.count {
            var brick = bricks[i]

            guard brick.tl.z > 1 else { continue }

            // Check if brick can be pushed down
            brick = brick.moveDown()

            // check if brick is not colliding with any other brick
            var collided = false
            for j in 0..<bricks.count {
                if i == j { continue }
                let otherBrick = bricks[j]
                if intersects(brick, otherBrick) {
                    collided = true
                    break
                }
            }

            if !collided {
                bricks[i] = brick
                return brick.idx
            }
        }
        return nil
    }

    var updates = 0
    var nexUpdateIdxFrom = 0
    while true {
        guard let updatedIdx = updateBrocks(0, &bricks) else { break }
        // nexUpdateIdxFrom = updatedIdx
        updates += 1

        if updates % 1000 == 0 {
            print("Updates: \(updates) : \(updatedIdx) out of \(bricks.count))")
        }
    }

    print("After updates\(updates) \(bricks)")


    func affectedBlocksCountAfterRemoval(_ brick: Brick) -> Int {
        var affectedBlocks = Set<Int>()

        var arr = bricks
        arr.removeAll { $0.idx == brick.idx }

        while true {
            guard let updatedIdx = updateBrocks(0, &arr) else { break }
            affectedBlocks.insert(updatedIdx)
        }
        return affectedBlocks.count
    }

    var totalAffectedBlocks = 0

    for brick in bricks {
        let affectedBlocks = affectedBlocksCountAfterRemoval(brick)
        print("AffectedBlocks: \(affectedBlocks) for \(brick.idx))")
        totalAffectedBlocks += affectedBlocks
    }


    print("TotalAffectedBlocks Count: \(totalAffectedBlocks)")

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
