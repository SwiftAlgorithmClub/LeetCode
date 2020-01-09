//: [Previous](@previous)

/*:

## Category [Hash Table]

# 290. Word Pattern
 Input: pattern = "abba"
 str = "dog cat cat dog"
 Output: true
 
## Soultion:

### Complexity analysis
 - Time complexity: O(n)
 - Space complexity: O(1)

 ### Result
  - Runtime: 8 ms
  - Memory Usage: 22.5 MB
*/

class Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        
        let splitPattern = pattern.map { String($0) }
        let splitStr = str.split(separator: " ").map { String($0) }
        
        guard splitPattern.count == splitStr.count else { return false }
        
        var dic: [String : String] = [:]
        var flag = true
        
        for i in 0..<splitPattern.count {
            if dic[splitPattern[i]] == nil && dic.someKey(forValue: splitStr[i]) == nil {
                dic[splitPattern[i]] = splitStr[i]
            } else {
                if dic[splitPattern[i]] != splitStr[i] {
                    flag = false
                    break
                }
            }
        }
        return flag
    }
}

extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}

//: [Next](@next)
