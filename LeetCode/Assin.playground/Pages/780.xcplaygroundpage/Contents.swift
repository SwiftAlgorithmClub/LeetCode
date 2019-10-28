//: [Previous](@previous)

import Foundation

/*:
# [780. Reaching Points](https://leetcode.com/problems/reaching-points/)

## Category []
 A move consists of taking a point (x, y) and transforming it to either (x, x+y) or (x+y, y).

 Given a starting point (sx, sy) and a target point (tx, ty), return True if and only if a sequence of moves exists to transform the point (sx, sy) to (tx, ty). Otherwise, return False.
 

````
 Examples:
 Input: sx = 1, sy = 1, tx = 3, ty = 5
 Output: True
 Explanation:
 One series of moves that transforms the starting point to the target is:
 (1, 1) -> (1, 2)
 (1, 2) -> (3, 2)
 (3, 2) -> (3, 5)

 Input: sx = 1, sy = 1, tx = 2, ty = 2
 Output: False

 Input: sx = 1, sy = 1, tx = 1, ty = 1
 Output: True

 ````
 
 
 Note:
 * sx, sy, tx, ty will all be integers in the range [1, 10^9].
 
 ### Complexity analysis
 - Time complexity: O()
 - Space complexity: O()
 
  
 ### Result
  - Runtime:
  - Mmmory:
*/

class Solution {
    func reachingPoints(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
        
        var array = [(Int, Int)]()
        for x in sx...tx {
            for y in sy...ty {
                array.append((x, y))
            }
        }
        var isEnd: Bool = false
        for i in (sx...tx-1) {
            for j in (sy...ty-1) {
                print(" ======= \(i) \(j) \(tx) \(ty) =======")
                isEnd = permute(i, j, tx, ty)
                if isEnd {
                    return true
                }
            }
        }
        return false
    }
    
    func permute(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
        print("sx: \(sx) sy: \(sy) tx: \(tx) ty: \(ty)")
        if sx == tx, sy == ty {
            print("true")
            return true
        }
        if sx > tx || sy > ty || tx == ty {
            return false
        }

        if tx > ty {
            
        }
        permute(sx + sy, sy, tx, ty)
        if sx < tx {
            return permute(sx + sy, sy, tx, ty)
        } else if sy < ty {
            return permute(sx, sx + sy, tx, ty)
        }
        return false
    }
}

Solution().reachingPoints(3, 3, 12, 9)
