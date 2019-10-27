//: [Previous](@previous)

/*:

## Category [Simulation]

# 780 - Reaching Points
 (sx,sy)에서 출발해서 (x,x+y), (x+y,y) 방식의 변환만으로 (tx,ty)에 도달할 수 있는 지 여부를 묻는 문제

## Soultion: backtracking

### Complexity analysis
 - Time complexity: O(k) - 변환 방식이 바뀌는 횟수
 - Space complexity: O(1)


 ### Result
  - Runtime: 4 ms
  - Memory Usage: 20.5 MB
*/

import Foundation

class Solution {
    func reachingPoints(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
        var cx = tx
        var cy = ty

        // 출발지점보다 뒤로 가면 안된다.
        while cx >= sx && cy >= sy {
            if cx == cy { // cx == cy면 더이상 움직일 수 없게 된다.
                break
            }

            if cx > cy { // 무조건 큰 쪽에서 작은 쪽을 빼야한다.
                if cy > sy {
                    cx %= cy // 여러번 움직였을 수 있으므로 이를 한꺼번에 처리해준다
                } else { // cy == sy
                    return (cx - sx) % cy == 0
                }
            } else {
                if cx > sx {
                    cy %= cx
                } else { // cx == sx
                    return (cy - sy) % cx == 0
                }
            }
        }

        // 출발지점에 도착했거나, 아니면 x,y 중 한쪽에 출발지점보다 뒤로 간 상태
        return cx == sx && cy == sy
    }
}
