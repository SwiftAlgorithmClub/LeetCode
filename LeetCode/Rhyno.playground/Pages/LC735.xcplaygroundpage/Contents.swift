/*:

## Category [Stack, Implementation]

# 735. Asteroid Collision
 별들이 일렬로 있고, 이들이 각자 방향으로 움직일 때, 충돌한 뒤의 남은 별들의 리스트를 순서대로 출력하라

## Soultion: Simulation
    1.결과로 반환할 리스트(스택으로 사용)를 만든다
    2.별들의 배열을 순서대로 순회하면서 다음 루프를 수행한다.
        1. 결과 리스트가 비어있으면 무조건 리스트에 삽입한다.
        2. 현재 살펴보는 별이 리스트의 가장 끝(스택의 top)원소와 충돌하지 않을 때까지 충돌시킨다. 이 때 현재의 별이 부서지게 되면 루프를 빠져 나온다.
    3. 결과 리스트를 반환한다.

### Complexity analysis
 - Time complexity: O(n)
 - Space complexity: O(n)


 ### Result
  - Runtime: 88 ms
  - Memory Usage: 21.3 MB
*/

import Foundation

class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var result: [Int] = []

        for a in asteroids {
            var isBroken = false
            while let last = result.last, last ^ a < 0 {
                let absLast = abs(last)
                if absLast > a {
                    isBroken = true
                    break
                } else if abs(last) == a {
                    isBroken = true
                    result.popLast()
                    break
                } else {
                    result.popLast()
                }
            }

            if !isBroken {
                result.append(a)
            }
        }
        return result
    }
}
