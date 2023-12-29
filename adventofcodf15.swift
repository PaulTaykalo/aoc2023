import Foundation

// Set buffet to immediately flush output
setbuf(stdout, nil)

let inputTest = """
rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7
"""

let input = loadFile("inputs/input15.txt")

let input3 = """

"""

/// ----------------------------------------------------------------------------------------------------
// MARK: - Solution ======================================================================================
/// ----------------------------------------------------------------------------------------------------

solve(input)
// solve(inputTest)

func __hash(_ s: String) -> Int {
    var sum = 0
    for c in s {
        sum += Int(c.asciiValue!)
        sum = sum * 17
        sum = sum % 256
    }
    return sum
}

struct Lense: CustomStringConvertible {
    let label: String
    let value: Int

    var description: String {
        return "\(label)=\(value)"
    }
}
struct Box: CustomStringConvertible {
    var ops: [Lense]

    var description: String {
        return "\(ops)"
    }
}


func solve(_ input: String) -> Void {
    var totalSum = 0
    var sum = 0

    var boxes: [Box] = Array(repeating: Box(ops: []), count: 256)

    let inputs = input.split(separator: ",")
    for input in inputs {

        if input.contains("=") {
            let parts = input.split(separator: "=")
                    let label = String(parts[0])
                    let value = Int(parts[1])!
                let boxNum = __hash(label)

                let lense = Lense(label: label, value: value)


            var wasReplaced = false
            boxes[boxNum].ops = boxes[boxNum].ops.map {

                // Replace
                if $0.label == label {
                    wasReplaced = true
                    return lense
                } else {
                    return $0
                }
            }

            if !wasReplaced {
                boxes[boxNum].ops.append(lense)
            }
        } else {

            let label = String(input.filter { $0 != "-" })
            let boxNum = __hash(label)
            boxes[boxNum].ops = boxes[boxNum].ops.filter { $0.label != label }
        }

        print("Boxes: \(boxes)")

    }

    var boxSum = 0
    for box in boxes.enumerated() {

        let boxIndex = box.offset + 1

        for lense in box.element.ops.enumerated() {
            let slot = lense.offset + 1
            boxSum += boxIndex * slot * lense.element.value
        }

    }

    print("Box sum: \(boxSum)")
    // print("Boxes: \(boxes)")



    print("Input: \(input)")

    print("Sum: \(sum)")
    print("Total sum: \(totalSum)")
}

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
