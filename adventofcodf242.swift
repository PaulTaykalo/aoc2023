import Foundation

// Set buffet to immediately flush output
setbuf(stdout, nil)

let inputTest = """
19, 13, 30 @ -2,  1, -2
18, 19, 22 @ -1, -1, -2
20, 25, 34 @ -2, -2, -4
12, 31, 28 @ -1, -2, -1
20, 19, 15 @  1, -5, -3
"""

let input = loadFile("inputs/input24.txt")

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

struct Hail: CustomStringConvertible {
    var x: Int
    var y: Int
    var z: Int
    
    var vx: Int
    var vy: Int
    var vz: Int
    
    var description: String {
        return "\(x), \(y), \(z) @ \(vx), \(vy), \(vz)"
    }

    func intestectsByXYZ(_ other: Hail) -> Bool {
        // We need to find such T that
        // x + vx * T == other.x + other.vx * T
        // y + vy * T == other.y + other.vy * T
        // z + vz * T == other.z + other.vz * T

        if vx != other.vx {
            let t = (other.x - x) / (vx - other.vx)
            if t < 0 {
                return false
            }
            if y + vy * t == other.y + other.vy * t && z + vz * t == other.z + other.vz * t {
                return true
            }
            return false
        }

        if vy != other.vy {
            let t = (other.y - y) / (vy - other.vy)
            if t < 0 {
                return false
            }
            if x + vx * t == other.x + other.vx * t && z + vz * t == other.z + other.vz * t {
                return true
            }
            return false
        }

        if vz != other.vz {
            let t = (other.z - z) / (vz - other.vz)
            if t < 0 {
                return false
            }
            if x + vx * t == other.x + other.vx * t && y + vy * t == other.y + other.vy * t {
                return true
            }
            return false
        }
         
        // Just in case they are the same
        return x == other.x && y == other.y && z == other.z
    }
}


struct Solution {
    var xRange: ClosedRange<Int>
    var yRange: ClosedRange<Int>
    var zRange: ClosedRange<Int>

    var vxRange: ClosedRange<Int>
    var vyRange: ClosedRange<Int>
    var vzRange: ClosedRange<Int>

    var tRange: ClosedRange<Int>

    var xMin: Int { xRange.lowerBound }
    var xMax: Int { xRange.upperBound }
    var yMin: Int { yRange.lowerBound }
    var yMax: Int { yRange.upperBound }
    var zMin: Int { zRange.lowerBound }
    var zMax: Int { zRange.upperBound }

    var minX: Int { xRange.lowerBound }
    var maxX: Int { xRange.upperBound }
    var minY: Int { yRange.lowerBound }
    var maxY: Int { yRange.upperBound }
    var minZ: Int { zRange.lowerBound }
    var maxZ: Int { zRange.upperBound }

    var maxVX: Int { vxRange.upperBound }
    var minVX: Int { vxRange.lowerBound }
    var maxVY: Int { vyRange.upperBound }
    var minVY: Int { vyRange.lowerBound }
    var maxVZ: Int { vzRange.upperBound }
    var minVZ: Int { vzRange.lowerBound }
}

func solve(input: String) -> Int {

    var sum = 0

    print("Input: \(input)")

    var hails = input.split(separator: "\n").map { line -> Hail in
        let parts = line.replacing(" ", with: "").split(separator: "@")
        let pos = parts[0].split(separator: ",").map { Int($0)! }
        let vel = parts[1].split(separator: ",").map { Int($0)! }
        return Hail(x: pos[0], y: pos[1], z: pos[2], vx: vel[0], vy: vel[1], vz: vel[2])
    }

    let hailStone  = Hail(x: 24, y: 13, z: 10, vx: -3, vy: 1, vz: 2)

    // just to prevent overflow
    var minValue = Int.min / 4
    var maxValue = Int.max / 4

    var initialSolution = Solution(xRange: minValue...maxValue, yRange: minValue...maxValue, zRange: minValue...maxValue, vxRange: minValue...maxValue, vyRange: minValue...maxValue, vzRange: minValue...maxValue, tRange: 0...maxValue)

    func findSolution(_ solution: Solution, idx: Int) -> Solution? {
        if idx == hails.count {
            return solution
        }
        let hail = hails[idx]

        var xRangeSolutions: [Solution] = []

        // X should be less hail.x and vx should be bigger than hail.vx
        if solution.minX <= hail.x && solution.maxVX >= hail.vx {
            let xRange = solution.minX...min(hail.x, solution.maxX)
            let vxRange = max(solution.minVX, hail.vx)...solution.maxVX
            let newSolution = Solution(xRange: xRange, yRange: solution.yRange, zRange: solution.zRange, vxRange: vxRange, vyRange: solution.vyRange, vzRange: solution.vzRange, tRange: solution.tRange)
            xRangeSolutions.append(newSolution)
        }

        // X should be bigger hail.x and vx should be less than hail.vx
        if solution.maxX >= hail.x && solution.minVX <= hail.vx {
            let xRange = max(hail.x, solution.minX)...solution.maxX
            let vxRange = solution.minVX...min(hail.vx, solution.maxVX)
            let newSolution = Solution(xRange: xRange, yRange: solution.yRange, zRange: solution.zRange, vxRange: vxRange, vyRange: solution.vyRange, vzRange: solution.vzRange, tRange: solution.tRange)
            xRangeSolutions.append(newSolution)
        }

        guard !xRangeSolutions.isEmpty else {
            return nil
        }

        var yRangeSolutions: [Solution] = []
        // Y should be less hail.y and vy should be bigger than hail.vy
        if solution.minY <= hail.y && solution.maxVY >= hail.vy {
            let yRange = solution.minY...min(hail.y, solution.maxY)
            let vyRange = max(solution.minVY, hail.vy)...solution.maxVY
            let newSolution = Solution(xRange: solution.xRange, yRange: yRange, zRange: solution.zRange, vxRange: solution.vxRange, vyRange: vyRange, vzRange: solution.vzRange, tRange: solution.tRange)
            yRangeSolutions.append(newSolution)
        }

        // Y should be bigger hail.y and vy should be less than hail.vy
        if solution.maxY >= hail.y && solution.minVY <= hail.vy {
            let yRange = max(hail.y, solution.minY)...solution.maxY
            let vyRange = solution.minVY...min(hail.vy, solution.maxVY)
            let newSolution = Solution(xRange: solution.xRange, yRange: yRange, zRange: solution.zRange, vxRange: solution.vxRange, vyRange: vyRange, vzRange: solution.vzRange, tRange: solution.tRange)
            yRangeSolutions.append(newSolution)
        }

        guard !yRangeSolutions.isEmpty else {
            return nil
        }

        var zRangeSolutions: [Solution] = []
        // Z should be less hail.z and vz should be bigger than hail.vz
        if solution.minZ <= hail.z && solution.maxVZ >= hail.vz {
            let zRange = solution.minZ...min(hail.z, solution.maxZ)
            let vzRange = max(solution.minVZ, hail.vz)...solution.maxVZ
            let newSolution = Solution(xRange: solution.xRange, yRange: solution.yRange, zRange: zRange, vxRange: solution.vxRange, vyRange: solution.vyRange, vzRange: vzRange, tRange: solution.tRange)
            zRangeSolutions.append(newSolution)
        }

        // Z should be bigger hail.z and vz should be less than hail.vz
        if solution.maxZ >= hail.z && solution.minVZ <= hail.vz {
            let zRange = max(hail.z, solution.minZ)...solution.maxZ
            let vzRange = solution.minVZ...min(hail.vz, solution.maxVZ)
            let newSolution = Solution(xRange: solution.xRange, yRange: solution.yRange, zRange: zRange, vxRange: solution.vxRange, vyRange: solution.vyRange, vzRange: vzRange, tRange: solution.tRange)
            zRangeSolutions.append(newSolution)
        }

        guard !zRangeSolutions.isEmpty else {
            return nil
        }

        // Now we need to find intersection of all solutions
        var result: [Solution] = []
        for xSolution in xRangeSolutions {
            for ySolution in yRangeSolutions {
                for zSolution in zRangeSolutions {
                    let xRange = xSolution.xRange
                    let yRange = ySolution.yRange
                    let zRange = zSolution.zRange
                    let vxRange = xSolution.vxRange
                    let vyRange = ySolution.vyRange
                    let vzRange = zSolution.vzRange

                    /// Now we need to check available T's for each coordinate
                    let minTRangeByX = 


                    let sol = Solution(xRange: xRange, yRange: yRange, zRange: zRange, vxRange: vxRange, vyRange: vyRange, vzRange: vzRange, tRange: solution.tRange)
                    result.append(sol)
                }
            }
        }

        for sol in result {
                if let solution = findSolution(sol, idx: idx + 1) {
                    return solution
                }
            }
        return nil
    }
    
    let sol = findSolution(initialSolution, idx: 0)!

    print(sol)

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
