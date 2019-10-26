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
 - Time complexity: O(N)
 - Space complexity: O(N)
 
  
 ### Result
  - Runtime: 48ms
  - Mmmory: 21.2MB
*/

/*
 DSU (Disjoint Set Union) 두 가지 메소드를 가지고 있습니다.
  find(node:): 두 요소가 동일한 하위 집합에 있는지 확인하는 데 사용할 수 있습니다. (부모가 같은지 찾음)
 union(node:, node:): 두 개의 하위 집합을 단일 하위 집합으로 결합 (부모가 같다면 같은 부모로 연결합니다.)
  
 */

struct Subset {
    var parent: Int
    var rank: Int
}

extension Array where Element == Int {
    func findParent(subsets: inout [Subset], i: Int) -> Int {
        if subsets[i].parent != i {
            // Path compression
            subsets[i].parent = findParent(subsets: &subsets, i: subsets[i].parent)
        }
        return subsets[i].parent
    }
    func union(subsets: inout [Subset], x: Int, y: Int) {
        let xroot = findParent(subsets: &subsets, i: x)
        let yroot = findParent(subsets: &subsets, i: y)

        // union-by-rank
        if subsets[xroot].rank < subsets[yroot].rank {
            subsets[xroot].parent = yroot
        } else if subsets[xroot].rank > subsets[yroot].rank {
            subsets[yroot].parent = xroot
        } else {
            subsets[yroot].parent = xroot
            subsets[xroot].rank += 1
        }
    }
}

class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        return findCyclic(edges)
    }

    func findCyclic(_ edges: [[Int]]) -> [Int] {
        var subsets: [Subset] = []
        (0...edges.count).forEach {
            subsets.append(Subset(parent: $0, rank: 0))
        }

        for (i, edge) in edges.enumerated() {
            let x = edge.findParent(subsets: &subsets, i: edge[0])
            let y = edge.findParent(subsets: &subsets, i: edge[1])

            if x == y {
                return edge
            }

            edge.union(subsets: &subsets, x: x, y: y)

        }
        return [-1, -1]
    }
}



Solution().findRedundantConnection([[111,181],[91,120],[80,150],[118,125],[38,130],[42,174],[30,154],[57,100],[78,145],[94,137],[34,116],[90,162],[5,139],[115,188],[80,163],[49,73],[65,182],[43,117],[144,167],[52,99],[40,54],[159,188],[74,141],[21,69],[19,148],[130,175],[98,173],[172,177],[76,119],[1,12],[85,196],[52,97],[70,104],[54,175],[188,197],[55,113],[126,168],[88,135],[37,104],[102,174],[4,189],[107,200],[51,175],[61,86],[106,188],[104,160],[29,52],[8,10],[34,93],[43,60],[17,24],[156,182],[69,156],[164,169],[104,147],[82,152],[52,138],[78,155],[157,178],[83,114],[110,183],[28,188],[41,77],[98,129],[81,93],[101,179],[47,170],[108,175],[142,187],[60,194],[72,90],[14,91],[68,99],[31,146],[82,149],[66,147],[134,156],[50,123],[45,185],[144,180],[135,176],[6,90],[134,196],[100,192],[95,187],[53,143],[21,93],[17,51],[21,140],[110,184],[95,133],[5,155],[87,193],[56,89],[158,159],[95,199],[109,139],[22,112],[8,88],[79,136],[25,48],[7,198],[39,83],[49,186],[105,185],[14,16],[55,169],[54,129],[3,196],[39,92],[91,122],[36,175],[114,149],[179,187],[131,187],[80,94],[12,159],[25,53],[53,118],[84,116],[112,159],[2,100],[64,91],[174,177],[120,130],[24,165],[89,189],[150,161],[93,100],[80,85],[33,123],[124,195],[85,171],[67,197],[39,127],[12,96],[47,193],[113,186],[30,92],[59,139],[27,174],[5,13],[52,81],[64,135],[13,128],[75,144],[121,158],[58,73],[11,123],[143,190],[82,181],[76,160],[4,33],[159,167],[67,153],[7,146],[7,44],[37,191],[23,168],[83,128],[145,148],[63,197],[24,56],[5,151],[7,32],[58,195],[84,102],[105,124],[20,114],[132,194],[45,90],[15,143],[77,110],[148,166],[104,131],[26,161],[31,103],[71,184],[3,77],[35,91],[178,199],[141,169],[48,149],[155,170],[113,193],[110,121],[9,49],[23,191],[8,81],[46,60],[18,91],[136,156],[67,103],[70,180],[118,179],[20,107],[60,74],[86,106],[62,199],[134,177]])
