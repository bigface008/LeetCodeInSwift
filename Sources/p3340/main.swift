//
//  main.swift
//  LeetCodeInSwift
//
//  https://leetcode.cn/problems/check-balanced-string/?envType=daily-question&envId=2025-03-14
//

class Solution {
    func isBalanced(_ num: String) -> Bool {
        var allSum = 0
        var evenSum = 0
        for (i, ch) in num.enumerated() {
            let val = Int(ch.asciiValue! - Character("0").asciiValue!)
            if i % 2 == 0 {
                evenSum += val
            }
            allSum += val
        }
        return allSum - evenSum == evenSum
    }
}
