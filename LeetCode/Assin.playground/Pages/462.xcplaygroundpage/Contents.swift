
/*:
# [462. Minimum Moves to Equal Array Elements II](https://leetcode.com/problems/minimum-moves-to-equal-array-elements-ii/)

 
Given a non-empty integer array, find the minimum number of moves required to make all array elements equal, where a move is incrementing a selected element by 1 or decrementing a selected element by 1.

You may assume the array's length is at most 10,000.
 
 ```
 Input:
 [1,2,3]

 Output:
 2

 Explanation:
 Only two moves are needed (remember each move increments or decrements one element):

 [1,2,3]  =>  [2,2,3]  =>  [2,2,2]
 ```
 
 ### Complexity analysis
 - Time complexity: O(log N)
 - Space complexity: O(1)
 
  
 ### Result
  - Runtime: 108ms
  - Mmmory: 21.8MB
*/

/*:
 
 [1,0,0,8,6] -> [1,1,1,1,1] 로 만들기 위해 14번의 이동이 필요함
 
 */

class Solution {
    func minMoves2(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        let mid: Int = nums[nums.count / 2]
        var offset = 0
        for n in nums {
            offset += abs(n - mid)
        }
        return offset
    }
}
Solution().minMoves2([1,0,0,8,6])
