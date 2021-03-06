//: [Previous](@previous)

import Foundation

/*:
# [799. Champagne Tower](https://leetcode.com/problems/champagne-tower/)

## Category [Tree]
 
 We stack glasses in a pyramid, where the first row has 1 glass, the second row has 2 glasses, and so on until the 100th row.  Each glass holds one cup (250ml) of champagne.

 Then, some champagne is poured in the first glass at the top.  When the top most glass is full, any excess liquid poured will fall equally to the glass immediately to the left and right of it.  When those glasses become full, any excess champagne will fall equally to the left and right of those glasses, and so on.  (A glass at the bottom row has it's excess champagne fall on the floor.)

 For example, after one cup of champagne is poured, the top most glass is full.  After two cups of champagne are poured, the two glasses on the second row are half full.  After three cups of champagne are poured, those two cups become full - there are 3 full glasses total now.  After four cups of champagne are poured, the third row has the middle glass half full, and the two outside glasses are a quarter full, as pictured below.
 
 ![tower](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/03/09/tower.png)
 
 Now after pouring some non-negative integer cups of champagne, return how full the j-th glass in the i-th row is (both i and j are 0 indexed.)
 
 
````
 Input: poured = 1, query_glass = 1, query_row = 1
 Output: 0.0
 Explanation: We poured 1 cup of champange to the top glass of the tower (which is indexed as (0, 0)). There will be no excess liquid so all the glasses under the top glass will remain empty.

 Input: poured = 2, query_glass = 1, query_row = 1
 Output: 0.5
 Explanation: We poured 2 cups of champange to the top glass of the tower (which is indexed as (0, 0)). There is one cup of excess liquid. The glass indexed as (1, 0) and the glass indexed as (1, 1) will share the excess liquid equally, and each will get half cup of champange.
 ````
 
 
 Note:
 * poured will be in the range of [0, 10 ^ 9].
 * query_glass and query_row will be in the range of [0, 99].
 
 ### Complexity analysis
 - Time complexity: O()
 - Space complexity: O()
 
  
 ### Result
  - Runtime:
  - Mmmory:
*/
class Solution {
   func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        var result: [[Double]] = Array(repeating: Array(repeating: 0.0, count:101), count: 101)
        result[0][0] = Double(poured)
        
       for row in 0...query_row {
           for cup in 0...row {
               var flow = (result[row][cup] - 1.0)/2.0
               if flow > 0 {
                   result[row+1][cup] += flow
                   result[row+1][cup+1] += flow
               }
           }
       }
        return  result[query_row][query_glass] > 1.0 ? 1.0 : result[query_row][query_glass]
    }
}

Solution().champagneTower(2, 1, 1)
