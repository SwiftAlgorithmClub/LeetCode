//: [Previous](@previous)

/*:
# 684 - Redundant Connection

N개의 노드가 있는 무방향 그래프에서 N개의 edge가 주어졌을 때, cycle을 만드는 edge를 찾아서 반환한다. 답이 여러개라면 입력으로 주어진 순서가 가장 늦은 edge를 반환한다.

[LeetCode 684](https://leetcode.com/problems/redundant-connection/)
*/

import Foundation

struct UFSet {
    var root: [Int]
    var count: [Int]

    init(_ N: Int) {
        root = Array(0..<N)
        count = Array(repeating: 1, count: N)
    }

    mutating func find(_ x: Int) -> Int {
        if root[x] == x {
            return x
        }

        root[x] = self.find(root[x])

        return root[x]
    }

    mutating func union(_ x:Int, _ y:Int) {
        let a = self.find(x)
        let b = self.find(y)

        let totalCount = count[a] + count[b]

        if a == b {
            return
        } else if count[a] > count[b] {
            root[b] = a
            count[a] = totalCount
        } else {
            root[a] = b
            count[b] = totalCount
        }
    }

}

class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        var set = UFSet(edges.count)

        for edge in edges {
            if set.find(edge[0]-1) == set.find(edge[1]-1) {
                return edge
            } else {
                set.union(edge[0]-1, edge[1]-1)
            }
        }
        return [-1,-1]
    }
}
