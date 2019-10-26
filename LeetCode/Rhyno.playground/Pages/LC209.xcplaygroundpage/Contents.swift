//: [Previous](@previous)

import Foundation
/*:
# 209 - Minimum Size Subarray Sum

N

[LeetCode 684](https://leetcode.com/problems/redundant-connection/)
*/
class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var current = 0
        var lower = 0
        var upper = 0
        var answer = nums.count + 1

        while lower < nums.count {
            if upper<nums.count, current < s {
                current += nums[upper]
                upper += 1

            } else {
                current -= nums[lower]
                lower += 1
            }

            if current >= s {
                answer = min(answer,upper-lower)
            }
        }
        if answer > nums.count {
            return 0
        } else {
            return answer
        }
    }
}
