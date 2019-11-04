/*:

## Category [Math]

# 729. My Calander 1
    이벤트가 겹치지 않도록 예약하라

## Soultion1: Linear Search
    이 문제의 핵심은 기존 예약된 이벤트들 중 겹치는 이벤트를 찾는 것이다. 즉, 이벤트를 범위 형태로 저장하는 배열을 만들고,
    매 삽입마다 모든 이벤트와 비교해서 하나라도 겹치면 삽입하지 않는다.

 ### Complexity analysis
 - Time complexity: O(n)
 - Space complexity: O(n)

 ### Result
 - Runtime: 1404 ms
 - Memory Usage: 21.7 MB

 ## Soultion2: Binary Search
    선형 탐색은 시간이 너무 오래 걸린다. 따라서 탐색 속도를 줄이기 위해서 범위를 시작점 기준으로 정렬된 상태를 유지한다.
    이후 매 탐색마다 binary search를 통해 겹치는 범위를 찾은 뒤 없으면 삽입한다.

 ### Complexity analysis
 - Time complexity: O(log n)
 - Space complexity: O(n)

 ### Result
 - Runtime: 404 ms
 - Memory Usage: 21.7 MB
*/

import Foundation

class MyCalendar {

    private var bookedList: [(Int, Int)] = []


    func book(_ start: Int, _ end: Int) -> Bool {

        let toBook = (start, end)
        var left = 0
        var right = bookedList.count-1

        while left <= right {
            let mid = (left + right) / 2

            let midElement = bookedList[mid]

            if isOverwrapped(midElement, toBook) {
                return false
            }

            if midElement.0 < toBook.0 {
                left = mid + 1
            } else if midElement.0 > toBook.0 {
                right = mid - 1
            }
        }

        bookedList.insert(toBook, at: left)
        return true
    }

    private func isOverwrapped(_ a: (Int, Int), _ b: (Int, Int)) -> Bool {
        if a.1 <= b.0 || b.1 <= a.0 {
            return false
        } else {
            return true
        }
    }
}

/**
 * Your MyCalendar object will be instantiated and called as such:
 * let obj = MyCalendar()
 * let ret_1: Bool = obj.book(start, end)
 */

