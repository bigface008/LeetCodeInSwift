//
//  main.swift
//  LeetCodeInSwift
//  https://leetcode.cn/problems/zero-array-transformation-i/description/
//

import Utils

class Solution {
    func isZeroArray(_ nums: [Int], _ queries: [[Int]]) -> Bool {
        let N = nums.count
        let Q = queries.count
        var diff = Array(repeating: 0, count: N + 1)
        diff[0] = nums[0]
        for i in 1..<N {
            diff[i] = nums[i] - nums[i - 1]
        }
        for query in queries {
            let l = query[0]
            let r = query[1]
            diff[l] -= 1
            diff[r + 1] += 1
        }
        var diffSum = 0
        for i in 0..<N {
            diffSum += diff[i]
            if diffSum > 0 {
                return false
            }
        }
        return true
    }
}

func check(_ nums: [Int], _ queries: [[Int]], _ expect: Bool) {
    let actual = Solution().isZeroArray(nums, queries)
    Utils.test("nums=\(nums) queries=\(queries)", expect, actual)
}

check([1, 0, 1], [[0, 2]], true)
