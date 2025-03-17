// https://leetcode.cn/problems/sum-of-beauty-in-the-array/?envType=daily-question&envId=2025-03-11
class Solution {
    func sumOfBeauties(_ nums: [Int]) -> Int {
        var ans = 0
        let N = nums.count
        var prevMax = Array(repeating: 0, count: N)
        var postMin = Array(repeating: 0, count: N)
        var prevMaxVal = 0
        for (i, x) in nums.enumerated() {
            prevMax[i] = prevMaxVal
            prevMaxVal = max(prevMaxVal, x)
        }
        var postMinVal = Int.max
        for (i, x) in nums.enumerated().reversed() {
            postMin[i] = postMinVal
            postMinVal = min(postMinVal, x)
        }
        for i in 1..<(N - 1) {
            var val = 0
            let x = nums[i]
            if prevMax[i] < x && x < postMin[i] {
                val = 2
            } else if nums[i - 1] < x && x < nums[i + 1] {
                val = 1
            } else {
                val = 0
            }
            ans += val
        }
        return ans
    }
}
