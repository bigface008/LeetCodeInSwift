//
//  main.swift
//  LeetCodeInSwift
//
//  https://leetcode.cn/problems/score-of-a-string/?envType=daily-question&envId=2025-03-15
//

class Solution {
    func scoreOfString(_ s: String) -> Int {
        var ans = 0
        var prev: Character?
        for ch in s {
            if let prev = prev {
                ans += abs(Int(ch.asciiValue!) - Int(prev.asciiValue!))
            }
            prev = ch
        }
        return ans
    }
}

Solution().scoreOfString("hello")
