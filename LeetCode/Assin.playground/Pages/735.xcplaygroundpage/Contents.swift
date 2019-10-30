
/*:
# [735. Asteroid Collision](https://leetcode.com/problems/asteroid-collision/)

 
[해설]()
 We are given an array asteroids of integers representing asteroids in a row.

 For each asteroid, the absolute value represents its size, and the sign represents its direction (positive meaning right, negative meaning left). Each asteroid moves at the same speed.

 Find out the state of the asteroids after all collisions. If two asteroids meet, the smaller one will explode. If both are the same size, both will explode. Two asteroids moving in the same direction will never meet.
 
 ```
 Input:
 asteroids = [5, 10, -5]
 Output: [5, 10]
 Explanation:
 The 10 and -5 collide resulting in 10.  The 5 and 10 never collide.

 Input:
 asteroids = [8, -8]
 Output: []
 Explanation:
 The 8 and -8 collide exploding each other.

 Input:
 asteroids = [10, 2, -5]
 Output: [10]
 Explanation:
 The 2 and -5 collide resulting in -5.  The 10 and -5 collide resulting in 10.

 Input:
 asteroids = [-2, -1, 1, 2]
 Output: [-2, -1, 1, 2]
 Explanation:
 The -2 and -1 are moving left, while the 1 and 2 are moving right.
 Asteroids moving the same direction never meet, so no asteroids will meet each other
 ```
 Note:
 * The length of asteroids will be at most 10000.
 * Each asteroid will be a non-zero integer in the range [-1000, 1000]..
 
 ### Complexity analysis
 - Time complexity: O()
 - Space complexity: O()
 
  
 ### Result
  - Runtime:
  - Mmmory:
*/


class Solution {
    func oppositeSigns(x: Int, y: Int) -> Bool {
        return (x ^ y) < 0
    }
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var result = asteroids
        for i in 1..<asteroids.count {
            let x = asteroids[i - 1]
            let y = asteroids[i]

            if (x - abs(y)) == 0 {
                result.remove(at: i)
                result.remove(at: i - 1)
                continue
            }
            if oppositeSigns(x: x, y: y) {
                var minIndex = max(x, y) == y ? i - 1 : i
                result.remove(at: minIndex)
            }
            print(result)
        }
        return result
    }
}

//Solution().asteroidCollision([8, -8])
Solution().asteroidCollision([5,10,-5]) // [5,10]
Solution().asteroidCollision([10,2,-5]) // [10]


