/*:

## Category [Stack]

# 456. 132 Pattern
 수열에서 132 패턴을 찾을 수 있는지 여부를 반환하는 문제


## Soultion: Stack Simulation
    정방향 시뮬레이션, 역방향 시뮬레이션이 있는데 여기서는 역방향 시뮬레이션이 좀 더 간편하다.
### Complexity analysis
- Time complexity: O(n)
- Space complexity: O(n)

### Result
- Runtime: 144 ms
- Memory Usage: 21.2 MB

#### 참고: 옵셔널 체이닝 쓰는 것보다 강제 해제가 더 빠르다.
*/
class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        guard nums.count > 2 else { return false }

        var st: [Int] = []
        var mid = Int.min // 현재까지 나온 수 중 두번째로 가장 높은 수

        for i in 0 ..< nums.count {
            let num = nums[nums.count - i - 1]
            if num < mid { return true } // 이번에 만난 수가, mid값보다 작으면 패턴이 존재한다.

            while !st.isEmpty, num > st.last! {// stack을 큰 값 -> 작은 값으로 유지한다.
                mid = max(mid, st.removeLast()) // 빠지는 수중에서 가장 큰 수를 mid로 유지한다.
            }

            st.append(num)
        }

        return false
    }
}
