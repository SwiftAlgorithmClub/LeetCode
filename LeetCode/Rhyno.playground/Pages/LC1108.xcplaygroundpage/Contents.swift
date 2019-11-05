/*:

## Category [String]

# 1108. Defanging an IP Address
    유효한 IP 주소를 Defanged 되게 바꾸라

## Soultion: String Manipulation
    문자열을 순회하면서, .이 나올때마다 [.]으로 대체한다.다만 여기서는 내장 함수를 이용한다.

 ### Complexity analysis
 - Time complexity: O(n) // n: IP 주소의 길이
 - Space complexity: O(n) // 별도 배열을 만들어서 작업하는 경우, 그대로 작업하면 O(1)이지만, 배열을 여러번 밀어야 하므로 번거로울 수 있다.

 ### Result
 - Runtime: 4 ms
 - Memory Usage: 21.6 MB

*/

import Foundation

class Solution {
    func defangIPaddr(_ address: String) -> String {
        return address.replacingOccurrences(of: ".", with: "[.]")
    }
}
