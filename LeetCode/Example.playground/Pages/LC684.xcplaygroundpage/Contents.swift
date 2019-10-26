//: [Previous](@previous)

/*:
# 684 - Redundant Connection

N개의 노드가 있는 무방향 그래프에서 N개의 edge가 주어졌을 때, cycle을 만드는 edge를 찾아서 반환한다. 답이 여러개라면 입력으로 주어진 순서가 가장 늦은 edge를 반환한다.

[LeetCode 684](https://leetcode.com/problems/redundant-connection/)
*/

import Foundation

class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        var arr = Array(0 ..< edges.count)

        for edge in edges {
            if arr.find(arr[edge[0]-1]) == arr.find(arr[edge[1]-1]) {
                return edge
            } else {
                arr.union(edge[0]-1, edge[1]-1)
            }
        }
        return [-1,-1]
    }
}

// MARK: - Union - find Extension for Int array
extension Array where Element == Int {
    mutating func find(_ i: Int) -> Int {
        if self[i] == i {
            return i
        } else {
            self[i] = find(self[i])
            return self[i]
        }
    }

    mutating func union(_ x:Int, _ y:Int) {
        let a = find(x)
        let b = find(y)

        self[b] = a
    }
}
