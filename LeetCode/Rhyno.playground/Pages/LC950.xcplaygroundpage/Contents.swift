
import Foundation

/*:

## Category [Sorting, Array, Queue]

# 950. Reveak Cards In Increasing Order
 숫자가 적혀있는 카드 덱에서 특정 규칙으로 카드를 뽑을 때, 오름차순으로 카드가 나오기 위한 카드덱 순서를 반환하라.

## Soultion: Simulation
    1.우선 배열을 정렬한다.
    2.결과 배열에서 원소가 들어갈 위치를 검색한다.
        1. 나머지 연산으로 위치를 찾는 법
        2. 큐를 이용하는 법
    3. 모든 원소를 결과 배열에 배치했으면, 이 결과 배열을 반환한다.

### Complexity analysis
 - Time complexity: O(n log n) // 정렬 O(n log n), 결과 배열 원소 찾기 O(n log n)
 - Space complexity: O(n) 혹은 O(n log n) // 결과 배열 O(n), Queue 구현 로직에 따라 O(n) 혹은 O(n log n)


 ### Result
  - Runtime: 40 ms ~ 44 ms
  - Memory Usage: 21.2 MB
*/

// 1. 나머지 연산 이용 방법
class Solution {
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: deck.count)

        let deck = deck.sorted()

        var index = 0
        var isPassed = true

        for card in deck {
            while !isPassed || result[index] != 0 {
                if result[index] == 0 {
                    isPassed = true
                }

                index += 1
                index %= deck.count
            }
            result[index] = card
            isPassed = false
        }

        return result
    }
}

// 2. 큐를 이용하는 방법
class Solution {
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        var result = Array(repeating: -1, count: deck.count)
        var queue = Array(0..<deck.count)
        var index = 0
        var queueIndex = 0

        let sortedDeck = deck.sorted()

        while index < deck.count {
            result[queue[queueIndex]] = sortedDeck[index]
            index += 1
            queueIndex += 1
            if queueIndex < queue.count {
                queue.append(queue[queueIndex])
                queueIndex += 1
            }
        }

        return result
    }
}

let s = Solution()

s.deckRevealedIncreasing([17,13,11,2,3,5,7])
