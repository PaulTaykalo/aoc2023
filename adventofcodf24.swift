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

let result = solve(input: inputTest)
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
    
    func intestectsByXY(_ hail: Hail) -> Bool {
         let x1 = x
         let x2 = x + vx * 100000
         let y1 = y
         let y2 = y + vy * 100000

         let xx1 = hail.x
         let xx2 = hail.x + hail.vx * 100000
         let yy1 = hail.y
         let yy2 = hail.y + hail.vy * 100000



         // Check if lines are parallel
         if (x1 - x2) * (yy1 - yy2) == (y1 - y2) * (xx1 - xx2) {
             print("\(self) and \(hail) are parallel")
             return false
         }

         // Check if lines intersect

         let x1d = Double(x1)
         let x2d = Double(x2)
         let y1d = Double(y1)
         let y2d = Double(y2)
         let xx1d = Double(xx1)
         let xx2d = Double(xx2)
         let yy1d = Double(yy1)
         let yy2d = Double(yy2)


         // Find intersection point
         let x = ((x1d * y2d - y1d * x2d) * (xx1d - xx2d) - (x1d - x2d) * (xx1d * yy2d - yy1d * xx2d)) / ((x1d - x2d) * (yy1d - yy2d) - (y1d - y2d) * (xx1d - xx2d))
         let y = ((x1d * y2d - y1d * x2d) * (yy1d - yy2d) - (y1d - y2d) * (xx1d * yy2d - yy1d * xx2d)) / ((x1d - x2d) * (yy1d - yy2d) - (y1d - y2d) * (xx1d - xx2d))

         // Check if rays actually intersect depending on direction
         if (x1d < x2d && x < x1d) || (x1d > x2d && x > x1d) {
             print("\(self) and \(hail) do not intersect on x")
             return false
         }

         if (y1d < y2d && y < y1d) || (y1d > y2d && y > y1d) {
             print("\(self) and \(hail) do not intersect on y")
             return false
         }

         if (xx1d < xx2d && x < xx1d) || (xx1d > xx2d && x > xx1d) {
             print("\(self) and \(hail) do not intersect on xx")
             return false
         }

         if (yy1d < yy2d && y < yy1d) || (yy1d > yy2d && y > yy1d) {
             print("\(self) and \(hail) do not intersect on yy")
             return false
         }

         let minValue = 200000000000000.0
         let maxValue = 400000000000000.0

         let allowedMinx = Double(minValue)
         let allowedMaxx = Double(maxValue)
         let allowedMiny = Double(minValue)
         let allowedMaxy = Double(maxValue)

         print("For \(self) and \(hail) intersection is at (\(x), \(y))")

         if x < allowedMinx || x > allowedMaxx || y < allowedMiny || y > allowedMaxy {
             return false
         }

         return true
     }

        func findIntersection(
            p1: (x: Double, y: Double, z: Double), v1: (x: Double, y: Double, z: Double),
            p2: (x: Double, y: Double, z: Double), v2: (x: Double, y: Double, z: Double)
        ) -> (x: Double, y: Double, z: Double)? {
            
            let x1d = v1.x, y1d = v1.y, z1d = v1.z
            let x2d = v2.x, y2d = v2.y, z2d = v2.z
            
            let det = x1d * (y2d * z2d) - y1d * (x2d * z2d) + z1d * (x2d * y2d)
            
            if det == 0 {
                // This means direction vectors are coplanar, they could be parallel or collinear.
                // Additional checks needed to confirm intersection.
                return nil
            }
            
            // t and s are the parameter values for lines 1 and 2 where they intersect
            let t = (p2.x * (y2d * z2d) - p2.y * (x2d * z2d) + p2.z * (x2d * y2d) +
                    p1.y * (x2d * z2d) - p1.x * (y2d * z2d)) / det
            let s = (p2.x * (y2d * z1d) - p2.y * (x2d * z1d) + p2.z * (x2d * y1d) +
                    p1.y * (x2d * z2d) - p1.z * (x2d * y2d)) / det
            
            // This is the intersection point
            let x = p1.x + v1.x * t
            let y = p1.y + v1.y * t
            let z = p1.z + v1.z * t
            
            return (x, y, z)
        }

     func intestectsByXYZ(_ hail: Hail) -> Bool {
         let x1 = x
         let x2 = x + vx * 100000
         let y1 = y
         let y2 = y + vy * 100000
         let z1 = z
         let z2 = z + vz * 100000

         let xx1 = hail.x
         let xx2 = hail.x + hail.vx * 100000
         let yy1 = hail.y
         let yy2 = hail.y + hail.vy * 100000
         let zz1 = hail.z
         let zz2 = hail.z + hail.vz * 100000

         // Check if lines intersect

         let x1d = Double(x1)
         let x2d = Double(x2)
         let y1d = Double(y1)
         let y2d = Double(y2)
         let z1d = Double(z1)
         let z2d = Double(z2)
         let xx1d = Double(xx1)
         let xx2d = Double(xx2)
         let yy1d = Double(yy1)
         let yy2d = Double(yy2)
         let zz1d = Double(zz1)
         let zz2d = Double(zz2)

         guard let (x, y, z) = findIntersection(
                p1: (x1d, y1d, z1d),
                 v1: (x1d + Double(vx * 10000), y1d + Double(vy * 10000), z1d + Double(vz * 10000)),
                p2: (xx1d, yy1d, zz1d), 
                v2: (xx1d + Double(hail.vx * 10000), yy1d + Double(hail.vy * 10000), zz1d + Double(hail.vz * 10000))
            ) else {
                print("\(self) and \(hail) are parallel"
         )
             return false
         }

         print("For \(self) and \(hail) intersection is at (\(x), \(y), \(z))")

         // Check if rays actually intersect depending on direction
         if (x1d < x2d && x < x1d) || (x1d > x2d && x > x1d) {
             print("\(self) and \(hail) do not intersect on x")
             return false
         }

         if (y1d < y2d && y < y1d) || (y1d > y2d && y > y1d) {
             print("\(self) and \(hail) do not intersect on y")
             return false
         }

         if (z1d < z2d && z < z1d) || (z1d > z2d && z > z1d) {
             print("\(self) and \(hail) do not intersect on z")
             return false
         }

         if (xx1d < xx2d && x < xx1d) || (xx1d > xx2d && x > xx1d) {
             print("\(self) and \(hail) do not intersect on xx")
             return false
         }

         if (yy1d < yy2d && y < yy1d) || (yy1d > yy2d && y > yy1d) {
             print("\(self) and \(hail) do not intersect on yy")
             return false
         }

         if (zz1d < zz2d && z < zz1d) || (zz1d > zz2d && z > zz1d) {
             print("\(self) and \(hail) do not intersect on zz")
             return false
         }

        //  let minValue = 200000000000000.0
        //  let maxValue = 400000000000000.0

        //  let allowedMinx = Double(minValue)
        //  let allowedMaxx = Double(maxValue)
        //  let allowedMiny = Double(minValue)
        //  let allowedMaxy = Double(maxValue)
        //  let allowedMinz = Double(minValue)
        //  let allowedMaxz = Double(maxValue)

        //  print("For \(self) and \(hail) intersection is at (\(x), \(y), \(z))")

        //  if x < allowedMinx || x > allowedMaxx || y < allowedMiny || y > allowedMaxy || z < allowedMinz || z > allowedMaxz {
        //      return false
        //  }

         return true
     }
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

    for i in 0..<hails.count {
        if hailStone.intestectsByXYZ(hails[i]) {
            sum += 1
        }
    }


    print(hails)

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
