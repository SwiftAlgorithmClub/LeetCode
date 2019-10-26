//: [Previous](@previous)

import Foundation

/*:
# 209. Minimum Size Subarray Sum

 ## Category [brute force]
 
Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

[LeetCode 209](https://leetcode.com/problems/minimum-size-subarray-sum/)
 
````
 Input: s = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: the subarray [4,3] has the minimal length under the problem constraint.
 ````
 
 Follow up:
  - If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n).
 
 ### Complexity analysis
 - Time complexity: O(nlog(n))
 - Space complexity: O(n)
 
  
 ### Result
  - Runtime: 72ms
  - Mmmory 21.6MB
*/
class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var sums = [Int](repeatElement(0, count: nums.count + 1))
        var result = Int.max
        
        for i in 1..<sums.count {
            sums[i] = sums[i - 1] + nums[i - 1]
        }
        for i in 0..<sums.count {
            let end = binarySearch(i + 1, sums.count - 1, sums, sums[i] + s)
            if end == sums.count {
                break
            }
            if end - i < result {
                result = end - i
            }
        }
        
        return result == Int.max ? 0 : result
    }
    private func binarySearch(_ left: Int, _ right:Int, _ nums: [Int], _ target: Int) -> Int {
        var left = left
        var right = right
        var middle = 0
        
        while left <= right {
            middle = (left + right) / 2
            if nums[middle] < target {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        return left
    }
}

Solution().minSubArrayLen(7, [2,3,1,2,4,3])

