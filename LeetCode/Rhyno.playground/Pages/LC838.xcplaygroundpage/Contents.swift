import Foundation

class Solution {
    func pushDominoes(_ dominoes: String) -> String {
        var chars = Array(dominoes)
        var start = 0

        let leftDomino = Character("L")
        let rightDomino = Character("R")
        let standDomino = Character(".")

        while start != chars.endIndex {
            if chars[start] == rightDomino {
                var last = start + 1

                while last < chars.count, chars[last] == standDomino {
                    last += 1
                }

                if last == chars.count || chars[last] == rightDomino {
                    for i in start..<last {
                        chars[i] = rightDomino
                    }
                    start = last
                } else {
                    let length = (last - start - 1) / 2
                    for i in 0...length {
                        chars[start+i] = rightDomino
                        chars[last-i] = leftDomino
                    }
                    start = last + 1
                }
            } else if chars[start] == leftDomino {
                if start != 0, chars[start-1] == standDomino {
                    var index = start - 1

                    while index >= 0, chars[index] == standDomino {
                        chars[index] = leftDomino
                        index -= 1
                    }
                }

                start += 1
            } else {
                start += 1
            }
        }
        return String(chars)
    }
}

let s = Solution()

s.pushDominoes("RR.L")
