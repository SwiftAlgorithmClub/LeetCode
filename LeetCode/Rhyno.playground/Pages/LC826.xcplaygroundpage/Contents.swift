/*:

## Category [Array, Sort]

# 826. Most Profit Assigning Work
    모든 인부의 작업 이익의 합이 최대가 되도록 하라

## Soultion: Sorting & Two Pointer
    우선 작업을 정렬한 뒤, 인부도 정렬해준다. 인부가 수행할 수 있는 가장 이익이 높은 일을 찾아서 모두 더해주면 된다.

 ### Complexity analysis
 - Time complexity: O(n log n)
 - Space complexity: O(n)

 ### Result
 - Runtime: 640 ms
 - Memory Usage: 21.9 MB

*/

import Foundation

class Solution {
    func maxProfitAssignment(_ difficulty: [Int], _ profit: [Int], _ worker: [Int]) -> Int {

        let jobs = zip(profit,difficulty).sorted { $0 > $1 } + [(0,0)]

        var result = 0
        var index = 0

        let sortedWorker = worker.sorted { $0 > $1 }

        for w in sortedWorker {
            while index < jobs.count, jobs[index].1 > w {
                index += 1
            }

            result += jobs[index].0
        }

        return result
    }
}
