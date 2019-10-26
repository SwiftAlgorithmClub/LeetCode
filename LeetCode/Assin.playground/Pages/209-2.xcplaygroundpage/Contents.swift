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
 
 ### Complexity analysis
 - Time complexity: O(n)
 - Space complexity: O(1)
 
 Follow up:
  - If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n).
  
*/
class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        let size = nums.count
        var ans = Int.max
        var left = 0
        var sum = 0
        
        for i in (0..<size) {
            sum += nums[i]
            print("i: { \(i) } \(sum) >= \(s) ")
            while sum >= s {
                let preAns = ans
                let result = i + 1 - left
                ans = min(ans, result)
                sum -= nums[left]
                print("\(ans) = min(\(preAns), \(result) (\(i) + 1 - \(left))  sum: { \(sum) }")
                left += 1
            }
        }
        return (ans != Int.max) ? ans : 0
    }
}

Solution().minSubArrayLen(7, [2,3,1,2,4,3])
