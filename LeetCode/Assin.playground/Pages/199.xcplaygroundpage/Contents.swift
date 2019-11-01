
/*:
# [199. Binary Tree Right Side View](https://leetcode.com/problems/binary-tree-right-side-view/)

 
Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
 
 ```
 Input: [1,2,3,null,5,null,4]
 Output: [1, 3, 4]
 Explanation:

    1            <---
  /   \
 2     3         <---
  \     \
   5     4       <---
 ```
 
 ### Complexity analysis
 - Time complexity: O(N)
 - Space complexity: O(N)
 
  
 ### Result
  - Runtime: 12ms
  - Mmmory: 21.1MB
*/

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let node = root else { return [] }
        var queue: [TreeNode] = []
        queue.append(node)
        var result: [Int] = []

        while !queue.isEmpty {

            var count = queue.count - 1

            while count >= 0 {
                let node = queue.removeFirst()
                if count == 0 { result.append(node.val) }
                if let leftChild = node.left { queue.append(leftChild) }
                if let rightChild = node.right { queue.append(rightChild) }
                count -= 1
            }
        }

        return result
    }
}

let treeNode1 = TreeNode(1)
let treeNode2 = TreeNode(2)
let treeNode3 = TreeNode(3)
let treeNode4 = TreeNode(4)
let treeNode5 = TreeNode(5)

treeNode1.left = treeNode2
treeNode1.right = treeNode3

treeNode3.right = treeNode4
treeNode2.right = treeNode5



Solution().rightSideView(treeNode1)
