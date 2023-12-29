import Foundation
let input = """
Time:        51699878
Distance:   377117112241505
"""

let inputTest = """
Time:      71530
Distance:  940200
"""

var lines = input.split(separator: "\n").map { String($0) }
// lines = inputTest.split(separator: "\n").map { String($0) }

// Just in case if we need to read input and not the lines
// let scanner = Scanner(string: input)
// while !scanner.isAtEnd {
//     if let line = scanner.scanLine() {
//         print(line)
//     }
// }


let times = lines[0].split(separator: ":")[1].split(separator: " ").map { Int($0)! }  
let distances = lines[1].split(separator: ":")[1].split(separator: " ").map { Int($0)! }

print(times)
print(distances)

var totalWins = 1

for i in 0..<times.count {
    let time = times[i]
    let distance = distances[i]

    var currentSpeed = 0

    var wins = 0
    for holdTime in (0..<time) {
        if ((time - holdTime) * holdTime > distance) {
            wins += 1
        }
    }
    print(wins)


    totalWins *= wins
}

print(totalWins)


















// MARK: - Private

// private extension Scanner {
//     func scanLine() -> String? {
//         var line: NSString?
//         scanUpTo("\n", into: &line)
//         return line as String?
//     }
// }

struct Coord: Hashable, Equatable {
    var x: Int
    var y: Int
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
