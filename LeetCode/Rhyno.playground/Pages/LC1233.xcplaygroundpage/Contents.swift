/*:

## Category [String, Sorting]

# 456. 132 Pattern
 주어진 폴더에서 다른 폴더의 서브 폴더를 제외하라


## Soultion: Sorting + Trie
    1. 우선 서브폴더가 먼저 계산되는 경우를 막기 위해, 사전순으로 정렬해준다.
    2. Trie를 만들고, 이 Trie에 데이터를 삽입한다. 이때, 삽입 과정에서 해당 폴더의 접두사가 트라이가 발견되면 삽입이 실패한다.
    3. 삽입이 성공한 문자열을 배열에 담아서 반환한다.
### Complexity analysis
- Time complexity: O(nlog n) + O(nl)- 정렬 O(n log n), 트라이에 문자열 삽입 O(l)(l은 폴더 문자열 길이)을 n번하니 O(nl)
- Space complexity: O(27^l) -> 최대로 필요한 메모리량. 트라이는 메모리 효율은 별로다

### Result
- Runtime: 1140 ms
- Memory Usage: 31.5 MB

*/
import Foundation

class TrieNode {
    var children: [TrieNode?] = Array(repeating: nil, count: 27)
    var isTerminal: Bool = false

    func insert(_ s: String) -> Bool {
        let characters: [Character] = Array(s)
        return _insertCharacters(characters, index: 0)
    }

    private func _insertCharacters(_ characters: [Character], index i: Int) -> Bool {
        if self.isTerminal {
            return false
        }

        if i == characters.count {
            self.isTerminal = true
            return true
        }

        if let index = self.changeAlphaToNum(characters[i]) {
            if var nextNode = self.children[index] {
                return nextNode._insertCharacters(characters, index: i+1)
           } else {
                self.children[index] = TrieNode()
                return self.children[index]!._insertCharacters(characters, index: i+1)
             }
        }

        return false
    }

    private func changeAlphaToNum(_ c: Character) -> Int? {
        if !c.isASCII {
            return nil
        }

        if c == Character("/") {
            return 26
        } else {
            let result = c.asciiValue! - Character("a").asciiValue!
            return Int(result)
        }
    }

    func find(_ s: String) -> Bool {
        let str = Array(s)

        return _findCharacters(characters: str, index: 0)
    }

    func _findCharacters(_ characters: [Character], index i: Int) -> Bool {
        if characters.count == i {
            if self.isTerminal {
                return true
            } else {
                return false
            }
        }

        if let index = self.changeAlphaToNum(characters[i]) {
            if var nextNode = self.children[index] {
                return nextNode._findCharacters(characters, index: i+i)
           } else {
                return false
             }
        }

        return false
    }
}

class Solution {
    func removeSubfolders(_ folder: [String]) -> [String] {

        let f = folder.sorted()

        let trie = TrieNode()
        var result: [String] = []

        for s in f {
            if trie.insert(s+"/") {
                result.append(s)
            }
        }

        return result
    }
}

let s = Solution()

print(s.removeSubfolders(["/a","/a/b","/c/d","/c/d/e","/c/f"]))
