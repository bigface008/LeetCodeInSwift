//
//  main.swift
//  LeetCodeInSwift
//
//  https://leetcode.com/problems/divide-array-into-equal-pairs/?envType=daily-question&envId=2025-03-17
//

class Solution {
    func divideArray(_ nums: [Int]) -> Bool {
        var cnt = [Int: Int]()
        for x in nums {
            cnt[x, default: 0] += 1
        }
        for v in cnt.values {
            if v % 2 != 0 {
                return false
            }
        }
        return true
    }
}
