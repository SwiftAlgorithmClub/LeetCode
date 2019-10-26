//: [Previous](@previous)

/*:

## Category [Simulation]

# 799 - Champagne Tower

 샴페인 잔을 피라미드 형태로 쌓았을 때, 맨 위에서 정해진 잔 수의 샴페인을 부었을 때, 특정 잔에 담겨 있는 샴페인의 양을 구하라. 샴페인 잔의 크기는 모두 동일하고, 샴페인이 넘칠때는 양 옆으로 균일하게 흘러내려서 아래 있는 잔으로 내려간다.


## Soultion 1. View of Lower Glass

### Complexity analysis
 - Time complexity: O(n^2)
 - Space complexity: O(1) //  항상 100 * 100의 cache를 가지게 된다.


 ### Result
  - Runtime: 24 ms
  - Memory Usage: 20.8 MB
*/
class Solution {
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        var cache :[[Double]] = Array(repeating:Array(repeating:0,count:100), count: 100)

        cache[0][0] = Double(poured)

        if query_row != 0 {
            for i in 1 ... query_row {
                for j in 0...i {
                    if j > 0, cache[i-1][j-1] > 1 {
                        cache[i][j] += (cache[i-1][j-1] - 1) / 2
                    }

                    if j < i, cache[i-1][j] > 1 {
                        cache[i][j] += (cache[i-1][j] - 1) / 2
                    }
                }
            }
        }

        if cache[query_row][query_glass] > 1 {
            return 1.0
        } else {
            return cache[query_row][query_glass]
        }
    }
}

/*:
## Soultion 2. View of Upper Glass

### Complexity analysis
 - Time complexity: O(n^2)
 - Space complexity: O(1)


 ### Result
  - Runtime: 16 ms
  - Memory Usage: 21 MB
*/

class Solution {
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        var cache :[[Double]] = Array(repeating:Array(repeating:0.0,count:101), count: 101)

        cache[0][0] = Double(poured)

            for i in 0 ... query_row {
                for j in 0...i {
                    var flow = (cache[i][j] - 1.0) / 2.0
                    if flow > 0 {
                        cache[i+1][j] += flow
                        cache[i+1][j+1] += flow
                    }
                }
            }

        return cache[query_row][query_glass] > 1.0 ? 1.0 : cache[query_row][query_glass]
    }
}


