//
//  main.swift
//  LeetCodeInSwift
//
//  https://leetcode.com/problems/house-robber-iv/?envType=daily-question&envId=2025-03-15
//

import Utils

class Solution {
    func minCapability(_ nums: [Int], _ k: Int) -> Int {
        var start = 0, end = nums.max()! + 1
        while start < end {
            let mid = start + (end - start) / 2
            if isValid(nums, mid, k) {
                end = mid
            } else {
                start = mid + 1
            }
        }
        if isValid(nums, start - 1, k) {
            return start - 1
        }
        return start
    }
    
    func isValid(_ nums: [Int], _ maxCap: Int, _ k: Int) -> Bool {
        let N = nums.count
        var dp = Array(repeating: 0, count: N)
        for i in 0..<N {
            if i == 0 {
                dp[i] = nums[i] > maxCap ? 0 : 1
                continue
            }
            if i == 1 {
                dp[i] = max(dp[0], nums[1] > maxCap ? 0 : 1)
                continue
            }
            
            if nums[i] > maxCap {
                dp[i] = dp[i - 1]
            } else {
                dp[i] = max(dp[i - 1], dp[i - 2] + 1)
            }
        }
//        print("maxCap=\(maxCap) dp=\(dp)")
        return dp.last! >= k
//        var f0 = 0, f1 = 0
//        for x in nums {
//            if x > maxCap {
//                f0 = f1
//            } else {
//                let new0 = f1
//                let new1 = max(f1, f0 + 1)
//                f0 = new0
//                f1 = new1
//            }
//        }
//        print(" f1=\(f1)")
//        return f1 >= k
    }
}

func check(_ nums: [Int], _ k: Int, _ expect: Int) {
    let actual = Solution().minCapability(nums, k)
    Utils.test("nums=\(nums) k=\(k)", expect, actual)
}

check([2, 3, 5, 9], 2, 5)
