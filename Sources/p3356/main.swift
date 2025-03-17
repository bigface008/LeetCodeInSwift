//
//  main.swift
//  LeetCodeInSwift
//  https://leetcode.com/problems/zero-array-transformation-ii/?envType=daily-question&envId=2025-03-13
//

import Utils

class Solution {
    func minZeroArray(_ nums: [Int], _ queries: [[Int]]) -> Int {
        let N = nums.count
        let Q = queries.count
        var start = 0
        var end = Q + 1
        while start < end {
            let mid = start + (end - start) / 2
            if isValid(nums, queries, mid) {
                end = mid
            } else {
                start = mid + 1
            }
        }
        if start == Q + 1 {
            return -1
        }
        if start == 0 {
            return start
        }
        if isValid(nums, queries, start - 1) {
            return start - 1
        }
        return start
    }

    private func isValid(_ nums: [Int], _ queries: [[Int]], _ k: Int) -> Bool {
        let N = nums.count
        var diff = Array(repeating: 0, count: N + 1)
        diff[0] = nums[0]
        for i in 1..<N {
            diff[i] = nums[i] - nums[i - 1]
        }
        for i in 0..<min(k, queries.count) {
            let query = queries[i]
            let l = query[0]
            let r = query[1]
            let v = query[2]
            diff[l] -= v
            diff[r + 1] += v
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

func check(_ nums: [Int], _ queries: [[Int]], _ expect: Int) {
    let actual = Solution().minZeroArray(nums, queries)
    Utils.test("nums=\(nums) queries=\(queries)", expect, actual)
}

//check([4, 3, 2, 1], [[1, 3, 2], [0, 2, 1]], -1)
check([0], [[0, 0, 2], [0, 0, 4], [0, 0, 4], [0, 0, 3], [0, 0, 5]], 0)

//class Solution {
//    func minZeroArray(_ nums: [Int], _ queries: [[Int]]) -> Int {
//        var zeroCnt = 0
//        var temp = nums
//        for x in nums {
//            if x == 0 {
//                zeroCnt += 1
//            }
//        }
//        if zeroCnt == nums.count {
//            return 0
//        }
//        for (k, query) in queries.enumerated() {
//            let l = query[0], r = query[1], v = query[2]
//            for i in l...r {
//                if temp[i] == 0 {
//                    continue
//                }
//                if temp[i] >= v {
//                    temp[i] -= v
//                } else {
//                    temp[i] = 0
//                }
//                if temp[i] == 0 {
//                    zeroCnt += 1
//                }
//            }
//            if zeroCnt == nums.count {
//                return k + 1
//            }
//        }
//        return -1
//    }
//}
