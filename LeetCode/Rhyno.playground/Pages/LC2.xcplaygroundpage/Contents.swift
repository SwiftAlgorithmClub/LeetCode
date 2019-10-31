/*:

## Category [LinkedList, Math]

# 2. Add Two Numbers
 두개의 LinkedList로 표현된 수가 주어졌을 때 두 수의 합을 구하는 문제


## Soultion: Simulation
 캐리값을 주의해서 구현하면 된다.

### Complexity analysis
- Time complexity: O(n)
- Space complexity: O(n)

### Result
- Runtime: 36 ms
- Memory Usage: 20.7 MB

#### 참고: 옵셔널 체이닝 쓰는 것보다 강제 해제가 더 빠르다.
*/
import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var l1 = l1
        var l2 = l2
        var resultNode: ListNode?
        var head: ListNode?
        var carry: Int = 0

        while l1 != nil || l2 != nil {
            var sum = carry

            if l1 != nil {
                sum += l1!.val
                l1 = l1!.next
            }

            if l2 != nil {
                sum += l2!.val
                l2 = l2!.next
            }

            let node = ListNode(sum % 10)
            carry = sum / 10

            if resultNode == nil {
                resultNode = node
                head = node
            } else {
                resultNode!.next = node
                resultNode = resultNode!.next
            }
        }

        if carry != 0 {
            let node = ListNode(carry)
            resultNode?.next = node
        }
    return head
    }
}
