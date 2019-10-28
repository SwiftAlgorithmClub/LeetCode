//: [Previous](@previous)

/*:

## Category [Math, Dynamic Programming]

# 517. Super Washing Machine
 매 차례마다 양 옆으로 빨래감을 하나씩 옮길 수 있을 때, 모든 세탁기가 동일한 수의 빨랫감을 가지려면 몇번의 차례가 필요한가?

## Soultion: linear scan
    1. 빨래의 수가 세탁기 수로 나누어 떨어지지 않으면 답이 존재하지 않으므로 이를 걸러준다.
    2. 세탁기를 앞에서부터 차례대로 확인하면서 다음 과정을 거친다.
        1. sumNeed: i단계 까지 빨래가 모두 채워지기 위해 필요한 차례수의 합. 답은 abs(sumNeed) 보다 커야 한다.
        2. m[i] - average, 현재 빨래량이 많다면 이를 옆으로 주는데 그만큼의 시간이 필요하다.
    3. 답은 2-1번과 2-2번 중 큰 쪽이다.

### Complexity analysis
 - Time complexity: O(n)
 - Space complexity: O(1)


 ### Result
  - Runtime: 76 ms
  - Memory Usage: 21.1 MB
*/

import Foundation

class Solution {
    func findMinMoves(_ machines: [Int]) -> Int {
        var total: Int = machines.reduce(0, +)

        if total % machines.count != 0 {
            return -1
        }

        let average = total / machines.count

        var sumNeed = 0
        var result = 0

        for m in machines {
            sumneed += m - average
            result = max(result, abs(sumneed),m - average)
        }

        return result
    }
}


