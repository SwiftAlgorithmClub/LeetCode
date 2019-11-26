import Foundation

class Solution {
    func countBits(_ num: Int) -> [Int] {
        var result: [Int] = Array(repeating: 0, count: num+1)

        if num == 0 {
            return result
        }

        for i in 1...num {
            result[i] = result[i/2] + (i & 1)
        }

        return result
    }
}
