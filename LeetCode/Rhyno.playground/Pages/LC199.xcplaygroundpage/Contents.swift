/*:

## Category [String, Sorting]

# 199. Binary Tree Right Side View
    이진 트리를 오른쪽에서 봤을 때 보이는 노드들을 트리 높이의 오름차순으로 반환하라

## Soultion: BFS
    BFS를 하면 높이별로 노드들을 탐색할 수 있다. 여기서 가장 오른쪽 노드를 찾아서 반환하면 된다.
    왼쪽부터 해도 되고, 오른쪽부터 해도 되는데, 오른쪽부터 하면 항상 첫번째 발견되는 노드가 답이므로 로직이 간편해진다.

### Complexity analysis
- Time complexity: O(n)
- Space complexity: O(n)

### Result
- Runtime: 12~16 ms
- Memory Usage: 21.1 MB

*/
import Foundation

 /**
  * Definition for a binary tree node.
  * public class TreeNode {
  *     public var val: Int
  *     public var left: TreeNode?
  *     public var right: TreeNode?
  *     public init(_ val: Int) {
  *         self.val = val
  *         self.left = nil
  *         self.right = nil
  *     }
  * }
  */
 class Solution {
     func rightSideView(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return [Int]()
        }

         var result:[Int] = []
         var queue:[TreeNode] = []

         queue.append(root!)

        while queue.count > 0 {
            let size = queue.count

             for i in 0 ..< size {
                let node = queue.removeFirst()

                if i == 0 {
                    result.append(node.val)
                }

                if let right = node.right {
                     queue.append(right)
                }

                if let left = node.left {
                    queue.append(left)
                }
             }
         }
         return result
     }
 }

