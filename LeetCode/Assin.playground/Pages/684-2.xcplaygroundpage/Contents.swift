//: [Previous](@previous)

import Foundation

/*:
# [684. Redundant Connection](https://leetcode.com/problems/redundant-connection/)

## Category [detect cycle]
 
In this problem, a tree is an undirected graph that is connected and has no cycles.

The given input is a graph that started as a tree with N nodes (with distinct values 1, 2, ..., N), with one additional edge added. The added edge has two different vertices chosen from 1 to N, and was not an edge that already existed.

The resulting graph is given as a 2D-array of edges. Each element of edges is a pair [u, v] with u < v, that represents an undirected edge connecting nodes u and v.

Return an edge that can be removed so that the resulting graph is a tree of N nodes. If there are multiple answers, return the answer that occurs last in the given 2D-array. The answer edge [u, v] should be in the same format, with u < v.
 
 ### Example 1
````
 Input: [[1,2], [1,3], [2,3]]
 Output: [2,3]
 Explanation: The given undirected graph will be like this:
   1
  / \
 2 - 3
 ````
 
 ### Example 2
 ````
  Input: [[1,2], [2,3], [3,4], [1,4], [1,5]]
  Output: [1,4]
  Explanation: The given undirected graph will be like this:
  5 - 1 - 2
      |   |
      4 - 3
  ````
 
 
 Note:
 The size of the input 2D-array will be between 3 and 1000.
 Every integer represented in the 2D-array will be between 1 and N, where N is the size of the input array.
 
 ### Complexity analysis
 - Time complexity: O(N) [아커만 함수](https://ko.wikipedia.org/wiki/%EC%95%84%EC%BB%A4%EB%A7%8C_%ED%95%A8%EC%88%98)
 - Space complexity: O(N)
 
  
 ### Result
  - Runtime: 32ms
  - Mmmory: 21MB
*/

/*
 DSU (Disjoint Set Union) 두 가지 메소드를 가지고 있습니다.
  find(node:): 두 요소가 동일한 하위 집합에 있는지 확인하는 데 사용할 수 있습니다. (부모가 같은지 찾음)
 union(node:, node:): 두 개의 하위 집합을 단일 하위 집합으로 결합 (부모가 같다면 같은 부모로 연결합니다.)
  
 */
extension Array where Element == Int {
    func findParent(parent: inout [Int], node: Int) -> Int {
        if parent[node] == -1 {
            return node
        }
        return findParent(parent: &parent, node: parent[node])
    }
    func union(parent: inout [Int], x: Int, y: Int) {
        let xset = findParent(parent: &parent, node: x)
        let yset = findParent(parent: &parent, node: y)
        parent[xset] = yset
    }
}

class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        return isCyclic(edges)
    }

    func isCyclic(_ edges: [[Int]]) -> [Int] {
        // Allocate memory for creating subsets
        // Initialize all subsets as single element sets
        var parent = Array(repeating: -1, count: edges.count + 1)

        for (i, edge) in edges.enumerated() {
            let x = edge.findParent(parent: &parent, node: edge[0])
            let y = edge.findParent(parent: &parent, node: edge[1])
            if x == y {
                return edge
            }

            edge.union(parent: &parent, x: x, y: y)
        }
        return [-1, -1]
    }
}


Solution().findRedundantConnection([[0, 1], [1, 2], [0, 2]])
Solution().findRedundantConnection([[1,2], [1,3], [2,3]])
