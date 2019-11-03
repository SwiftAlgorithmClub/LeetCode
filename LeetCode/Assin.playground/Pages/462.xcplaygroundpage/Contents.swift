
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
 - Time complexity: O()
 - Space complexity: O()
 
  
 ### Result
  - Runtime:
  - Mmmory:
*/


class Solution {
    func minMoves2(_ nums: [Int]) -> Int {
        var sum = 0
        for n in nums {
            sum += n
        }
        let avg = sum / nums.count

        for n in nums {
            let a = max(n, n - avg)
            print(a)
        }
        return 0
    }
}
Solution().minMoves2([1, 2, 3])

