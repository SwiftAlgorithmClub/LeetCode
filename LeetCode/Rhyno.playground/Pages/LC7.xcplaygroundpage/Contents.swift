/*:

## Category [Math]

# 7. Reversed Integer
    32비트 정수가 주어졌을 때, 이를 뒤집은 숫자를 반환하라. 단, 오버플로우가 발생할 경우 0을 반환하라

## Soultion1: Math
    나누기와 나머지 연산을 이용한다. swift는 괜찮지만, c++로 하면 음수에 대한 나누기와 나머지가 잘 동작하지 않는 경우가 많아서 양수로 바꿔서 작업을 해준다.
    오버 플로우 체크는 뒤집한 숫자와 원래의 숫자의 부호를 비교함으로써 이루어진다. 부호가 바뀌면 오버플로우가 일어난 것이다.

    하지만 여기서는 기본 Int가 64bit인 것을 이용해 Int32의 범위를 넘어가는 지 체크한다.
 ### Complexity analysis
 - Time complexity: O(n)
 - Space complexity: O(n)

 ### Result
 - Runtime: 8 ms
 - Memory Usage: 20.6 MB

## Solution2: String
    숫자를 string으로 바꾼 뒤, 뒤집어준다. 부호는 따로 뺀 뒤, 나중에 따로 붙여준다.

### Complexity analysis
- Time complexity: O(n)
- Space complexity: O(n)

### Result
- Runtime: 4 ms
- Memory Usage: 20.9 MB

*/

import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        let isNegative = x < 0
        let number = isNegative ? x * -1 : x

        if var reversedNum = Int(String(String(number).reversed())) {
            reversedNum = isNegative ? reversedNum * -1 : reversedNum

            if reversedNum > Int32.max || reversedNum < Int32.min {
                return 0
            } else {
                return reversedNum
            }
        }
        return 0
    }
}



let x = -123

let s = Solution()
print(s.reverse(x))
