//: [Previous](@previous)

import Foundation

class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var result = 0
        var jewelSet: Set<Character> = Set()

        for j in J {
            jewelSet.insert(j)
        }

        for s in S {
            if jewelSet.contains(s) {
                result += 1
            }
        }

        return result
    }
}
