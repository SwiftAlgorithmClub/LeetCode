
/*:
# [761. Special Binary String](https://leetcode.com/problems/special-binary-string/)

 
Special binary strings are binary strings with the following two properties:

The number of 0's is equal to the number of 1's.
Every prefix of the binary string has at least as many 1's as 0's.
Given a special string S, a move consists of choosing two consecutive, non-empty, special substrings of S, and swapping them. (Two strings are consecutive if the last character of the first string is exactly one index before the first character of the second string.)

At the end of any number of moves, what is the lexicographically largest resulting string possible?
 
 ```
 Input: S = "11011000"
 Output: "11100100"
 Explanation:
 The strings "10" [occuring at S[1]] and "1100" [at S[3]] are swapped.
 This is the lexicographically largest string possible after some number of swaps.
 ```
 
 ### Complexity analysis
 - Time complexity: O()
 - Space complexity: O()
 
  
 ### Result
  - Runtime:
  - Mmmory:
*/
class Solution {
    func makeLargestSpecial(_ S: String) -> String {
        var balance = 0
        var l = S.startIndex
        var r = S.startIndex
        var subResults = [String]()
        
        while r != S.endIndex {
            if S[r] == "0" {
                balance -= 1
            } else {
                balance += 1
            }
            if balance == 0 {
                let start = S.index(l, offsetBy: 1)
                subResults.append("1\(String(S[start...r]))0")
                l = S.index(r, offsetBy: 1)
            }
            r = S.index(r, offsetBy: 1)
        }
        subResults.sort()
        print(subResults)
        return ""
    }
}

Solution().makeLargestSpecial("11011000")
