import Foundation

/*:
# [517. Super Washing Machines](https://leetcode.com/problems/super-washing-machines/)

 
[해설](https://leetcode.com/problems/super-washing-machines/discuss/368475/O(n)-runtime-O(1)-extra-memory-solution-with-breakdown-of-cases.)
 
## Category []
 
 한 줄에 슈퍼 세탁기가 n 대 있습니다. 처음에는 각 세탁기에 드레스가 있거나 비어 있습니다.
 
 You have n super washing machines on a line. Initially, each washing machine has some dresses or is empty.

 각 이동마다 m (1 ≤ m ≤ n) 세탁기를 선택하고 동시에 각 세탁기의 드레스를 인접한 세탁기 중 하나에 전달할 수 있습니다.
 
 For each move, you could choose any m (1 ≤ m ≤ n) washing machines, and pass one dress of each washing machine to one of its adjacent washing machines at the same time .

 줄마다 왼쪽에서 오른쪽으로 각 세탁기의 드레스 수를 나타내는 정수 배열이 주어지면 모든 세탁기가 동일한 드레스 수를 갖도록 최소 이동 횟수를 찾아야합니다. 그렇게 할 수 없으면 -1을 반환하십시오.
 
 Given an integer array representing the number of dresses in each washing machine from left to right on the line, you should find the minimum number of moves to make all the washing machines have the same number of dresses. If it is not possible to do it, return -1.


````
 Input: [1,0,5]

 Output: 3

 Explanation:
 1st move:    1     0 <-- 5    =>    1     1     4
 2nd move:    1 <-- 1 <-- 4    =>    2     1     3
 3rd move:    2     1 <-- 3    =>    2     2     2

 
 Input: [0,3,0]

 Output: 2

 Explanation:
 1st move:    0 <-- 3     0    =>    1     2     0
 2nd move:    1     2 --> 0    =>    1     1     1
 
 
 Input: [0,2,0]

 Output: -1

 Explanation:
 It's impossible to make all the three washing machines have the same number of dresses.
 ````
 
 
 Note:
 * The range of n is [1, 10000].
 * The range of dresses number in a super washing machine is [0, 1e5].
 
 ### Complexity analysis
 - Time complexity: O(N)
 - Space complexity: O(1)
 
  
 ### Result
  - Runtime: 88ms
  - Mmmory: 20.9MB
*/

class Solution {
    func findMinMoves(_ machines: [Int]) -> Int {
        var total = 0
        
        // 모든 값을 total 에 저장한다.
        for clothes in machines {
            total += clothes
        }
        
        // 균등 분할 할 수 있는 지 검증한다.
        if (total % machines.count) != 0 {
            return -1
        }
        
        // 평균을 구한다.
        let avg = total / machines.count
        var maxRunningBalance = 0
        var maxOffLoad = 0
        var runningBalance = 0
        
        for clothes in machines {
            let offload = clothes - avg
            runningBalance += offload;
            maxRunningBalance = max(maxRunningBalance, abs(runningBalance));
            maxOffLoad = max(maxOffLoad, offload);
        }
        
        return max(maxOffLoad, maxRunningBalance)
    }
}


Solution().findMinMoves([1,0,5])
