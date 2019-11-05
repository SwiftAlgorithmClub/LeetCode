
/*:
# [826. Most Profit Assigning Work](https://leetcode.com/problems/most-profit-assigning-work/)

 We have jobs: difficulty[i] is the difficulty of the ith job, and profit[i] is the profit of the ith job.

 Now we have some workers. worker[i] is the ability of the ith worker, which means that this worker can only complete a job with difficulty at most worker[i].

 Every worker can be assigned at most one job, but one job can be completed multiple times.

 For example, if 3 people attempt the same job that pays $1, then the total profit will be $3.  If a worker cannot complete any job, his profit is $0.

 What is the most profit we can make?
 
 ```
 Input: difficulty = [2,4,6,8,10], profit = [10,20,30,40,50], worker = [4,5,6,7]
 Output: 100
 Explanation: Workers are assigned jobs of difficulty [4,4,6,6] and they get profit of [20,20,30,30] seperately.
 ```
 
 Note:
 * 1 <= difficulty.length = profit.length <= 10000
 * 1 <= worker.length <= 10000
 * difficulty[i], profit[i], worker[i]  are in range [1, 10^5]
 
 ### Complexity analysis
 - Time complexity: O(n log n)
 - Space complexity: O()
 
  
 ### Result
  - Runtime:
  - Mmmory:
*/
class Solution {
    func maxProfitAssignment(_ difficulty: [Int], _ profit: [Int], _ worker: [Int]) -> Int {
        var sum = 0
        var left = 0
        let right = difficulty.count - 1
        let difficulty = difficulty.sorted()
        let profit = profit.sorted()
        let worker = worker.sorted()

        for i in (0..<(worker.count)) {
            let w = worker[i]


            while left < right && w >= difficulty[left] {
                left += 1
            }

            if left == 0 {
                continue
            }

            while left > 0 && left <= right && w < difficulty[left] {
                left -= 1
            }
            sum += profit[left]
        }
        return sum
    }
}



Solution().maxProfitAssignment([85, 47, 57], [24, 66, 99], [40, 25, 25])
