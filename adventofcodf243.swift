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

// public (bool intersects, (BigInteger X, BigInteger Y) pos, BigInteger time) TryIntersectPos(Hail one, Hail two, (int x, int y) offset)
// {
//     var a = (Pos: (one.Pos.X, one.Pos.Y), Vel: (X: one.Vel.X + offset.x, Y: one.Vel.Y + offset.y));
//     var c = (Pos: (two.Pos.X, two.Pos.Y), Vel: (X: two.Vel.X + offset.x, Y: two.Vel.Y + offset.y));
 
//     //Determinant
//     BigInteger D = (a.Vel.X * -1 * c.Vel.Y) - (a.Vel.Y * -1 * c.Vel.X);
 
//     if (D == 0) return (false, (-1, -1), -1);
 
//     var Qx = (-1 * c.Vel.Y * (c.Pos.X - a.Pos.X)) - (-1 * c.Vel.X * (c.Pos.Y - a.Pos.Y));
//     var Qy = (a.Vel.X * (c.Pos.Y - a.Pos.Y)) - (a.Vel.Y * (c.Pos.X - a.Pos.X));
 
//     var t = Qx / D;
//     var s = Qy / D;
 
//     var Px = (a.Pos.X + t * a.Vel.X);
//     var Py = (a.Pos.Y + t * a.Vel.Y);
 
//     // Returns the intersection point, as well as the timestamp at which "one" will reach it with the given velocity.
//     return (true, (Px, Py), t);
// }

func intersection(_ ax: Int, _ ay: Int, _ avx: Int, _ avy: Int,
_ cx: Int, _ cy: Int, _ cvx: Int, _ cvy: Int) -> Coord? {

    let d = (avx * -1 * cvy) - (avy * -1 * cvx)

    if d == 0 {
        return nil
    }

    var Qx = (-1 * cvy * (cx - ax)) - (-1 * cvx * (cy - ay))
    var Qy = (avx * (cy - ay)) - (avy * (cx - ax))

    let t = Qx / d
    let s = Qy / d

    let Px = (ax + t * avx)
    let Py = (ay + t * avy)

    return Coord(x: Int(Px), y: Int(Py))
}


// func intersection(_ ax1: Int, _ ay1: Int, _ avx1: Int, _ avy1: Int,
// _ ax2: Int, _ ay2: Int, _ avx2: Int, _ avy2: Int) -> Coord? {
//         let x1 = ax1
//          let x2 = ax1 + avx1 * 1000000
//          let y1 = ay1
//          let y2 = ay1 + avy1 * 1000000

//          let xx1 = ax2
//          let xx2 = ax2 + avx2 * 1000000
//          let yy1 = ay2
//          let yy2 = ay2 + avy2 * 1000000



//          // Check if lines are parallel
//          if (x1 - x2) * (yy1 - yy2) == (y1 - y2) * (xx1 - xx2) {
//              return nil
//          }

//          // Check if lines intersect

//          let x1d = Double(x1)
//          let x2d = Double(x2)
//          let y1d = Double(y1)
//          let y2d = Double(y2)
//          let xx1d = Double(xx1)
//          let xx2d = Double(xx2)
//          let yy1d = Double(yy1)
//          let yy2d = Double(yy2)


//          // Find intersection point
//          let x = ((x1d * y2d - y1d * x2d) * (xx1d - xx2d) - (x1d - x2d) * (xx1d * yy2d - yy1d * xx2d)) / ((x1d - x2d) * (yy1d - yy2d) - (y1d - y2d) * (xx1d - xx2d))
//          let y = ((x1d * y2d - y1d * x2d) * (yy1d - yy2d) - (y1d - y2d) * (xx1d * yy2d - yy1d * xx2d)) / ((x1d - x2d) * (yy1d - yy2d) - (y1d - y2d) * (xx1d - xx2d))

//          // Check if rays actually intersect depending on direction
//          if (x1d < x2d && x < x1d) || (x1d > x2d && x > x1d) {
//              return nil
//          }

//          if (y1d < y2d && y < y1d) || (y1d > y2d && y > y1d) {
//             //  print("\(self) and \(hail) do not intersect on y")
//              return nil
//          }

//          if (xx1d < xx2d && x < xx1d) || (xx1d > xx2d && x > xx1d) {
//             //  print("\(self) and \(hail) do not intersect on xx")
//              return nil
//          }

//          if (yy1d < yy2d && y < yy1d) || (yy1d > yy2d && y > yy1d) {
//             //  print("\(self) and \(hail) do not intersect on yy")
//              return nil
//          }

//          return Coord(x: Int(x), y: Int(y))
// }


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


    func intestectsByXY(_ hail: Hail) -> Coord? {
        intersection(x, y, vx, vy, hail.x, hail.y, hail.vx, hail.vy)
     }

    func intestectsByYZ(_ hail: Hail) -> Coord? {
        intersection(y, z, vy, vz, hail.y, hail.z, hail.vy, hail.vz)
     }


    func intestectsByXYZ(_ other: Hail) -> Int? {
        // We need to find such T that
        // x + vx * T == other.x + other.vx * T
        // y + vy * T == other.y + other.vy * T
        // z + vz * T == other.z + other.vz * T

        if vx != other.vx {
            let t = (other.x - x) / (vx - other.vx)
            if t < 0 {
                return nil
            }
            if y + vy * t == other.y + other.vy * t && z + vz * t == other.z + other.vz * t {
                return t
            }
            return nil
        }

        if vy != other.vy {
            let t = (other.y - y) / (vy - other.vy)
            if t < 0 {
                return nil
            }
            if x + vx * t == other.x + other.vx * t && z + vz * t == other.z + other.vz * t {
                return t
            }
            return nil
        }

        if vz != other.vz {
            let t = (other.z - z) / (vz - other.vz)
            if t < 0 {
                return nil
            }
            if x + vx * t == other.x + other.vx * t && y + vy * t == other.y + other.vy * t {
                return t
            }
            return nil
        }
         
        // Just in case they are the same
        return x == other.x && y == other.y && z == other.z ? 0 : nil
    }
}




func solve(input: String) -> Int {

    var sum = 0

    // print("Input: \(input)")

    var hails = input.split(separator: "\n").map { line -> Hail in
        let parts = line.replacing(" ", with: "").split(separator: "@")
        let pos = parts[0].split(separator: ",").map { Int($0)! }
        let vel = parts[1].split(separator: ",").map { Int($0)! }
        return Hail(x: pos[0], y: pos[1], z: pos[2], vx: vel[0], vy: vel[1], vz: vel[2])
    }

    let speedRange = 500
    var xRange = -3
    for vx in -speedRange...speedRange {
        for vy in -speedRange...speedRange {
                var h1 = hails[0]
                var h2 = hails[1]
                var h3 = hails[2]
                var h4 = hails[3]

                h1.vx -= vx
                h1.vy -= vy

                h2.vx -= vx
                h2.vy -= vy

                h3.vx -= vx
                h3.vy -= vy

                h4.vx -= vx
                h4.vy -= vy

                guard let i1 = h1.intestectsByXY(h2),
                let i2 = h1.intestectsByXY(h3),
                let i3 = h1.intestectsByXY(h4),
                let i4 = h2.intestectsByXY(h3),
                let i5 = h2.intestectsByXY(h4),
                let i6 = h3.intestectsByXY(h4) else {
                    continue
                }

                guard i1 == i2 && i2 == i3 && i3 == i4 && i4 == i5 && i5 == i6 else {
                    continue
                }

                print("Found intersection at \(i1)")


                let t = (i1.x - h1.x) / h1.vx
                let t2 = (i1.x - h2.x) / h2.vx 
                let t3 = (i1.x - h3.x) / h3.vx
                let t4 = (i1.x - h4.x) / h4.vx

                for vz in -speedRange...speedRange {

                    let z1 = h1.z + (h1.vz - vz) * t
                    let z2 = h2.z + (h2.vz - vz) * t2
                    let z3 = h3.z + (h3.vz - vz) * t3
                    let z4 = h4.z + (h4.vz - vz) * t4

                    guard z1 == z2 && z2 == z3 && z3 == z4 else {
                        continue
                    }   

                    print("Z coordinate is \(z1)")
                }

                
        }
    }


    // print(sol)

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
