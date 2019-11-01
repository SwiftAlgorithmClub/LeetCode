
/*:
# [745. Prefix and Suffix Search](https://leetcode.com/problems/prefix-and-suffix-search/)

 
[해설]()
 Given many words, words[i] has weight i.

 Design a class WordFilter that supports one function, WordFilter.f(String prefix, String suffix). It will return the word with given prefix and suffix with maximum weight. If no word exists, return -1.
 
 ```
 Input:
 WordFilter(["apple"])
 WordFilter.f("a", "e") // returns 0
 WordFilter.f("b", "") // returns -1
 ```
 
 Note:
 * words has length in range [1, 15000].
 * For each test case, up to words.length queries WordFilter.f may be made.
 * words[i] has length in range [1, 10].
 * prefix, suffix have lengths in range [0, 10].
 * words[i] and prefix, suffix queries consist of lowercase letters only.
 
 ### Complexity analysis
 - Time complexity: O()
 - Space complexity: O()
 
  
 ### Result
  - Runtime:
  - Mmmory:
*/


class WordFilter {

    let words: [String]
    
    init(_ words: [String]) {
        self.words = words
    }
    
    func f(_ prefix: String, _ suffix: String) -> Int {
        return 0
    }
}


WordFilter(["apple"]).f("a", "e")


