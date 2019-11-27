class Solution {
    func rob(_ nums: [Int]) -> Int {
        var cache:[Int] = Array(repeating: 0, count: nums.count)
        if nums.count == 0 {
            return 0
        }

        cache[0] = nums[0]

        for i in 1..<nums.count {
            if i-1 > 0 {
                cache[i] = max(cache[i-1], nums[i] + cache[i-2])
            } else {
                cache[i] = max(cache[i-1], nums[i])
            }
        }

        return cache.last!
    }
}

let s = Solution()
s.rob([2,7,9,3,1])
