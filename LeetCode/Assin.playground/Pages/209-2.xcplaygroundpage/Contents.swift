import Foundation

/*:
# 209. Minimum Size Subarray Sum

## Category [brute force, 2 Pointers]
 
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
 - Time complexity: O(n)
 - Space complexity: O(1)
 
  
 ### Result
  - Runtime: 52ms
  - Mmmory 21.1MB
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
                print("i: \(i) ans: \(ans) = min(ans: \(preAns), result: \(result) (i: \(i) + 1 - left: \(left))  sum: \(sum) nums[left]: \(nums[left])")
                left += 1
            }
        }
        return (ans != Int.max) ? ans : 0
    }
}

Solution().minSubArrayLen(7, [2,3,1,2,4,3])

