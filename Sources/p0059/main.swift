//
//  main.swift
//  LeetCodeInSwift
//  https://leetcode.com/problems/spiral-matrix-ii/
//

import Utils

class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var res = Array(repeating: Array(repeating: 0, count: n), count: n)
        var val = 1
        let limit = n * n
        var r = 0
        var c = 0
        var width = n
        var height = n
        while width > 0 && height > 0 {
            for i in stride(from: 0, to: width - 1, by: 1) {
                res[r][c] = val
                c += 1
                val += 1
            }
            for i in stride(from: 0, to: height - 1, by: 1) {
                res[r][c] = val
                r += 1
                val += 1
            }
            for i in stride(from: 0, to: width - 1, by: 1) {
                res[r][c] = val
                c -= 1
                val += 1
            }
            for i in stride(from: 0, to: height - 2, by: 1) {
                res[r][c] = val
                r -= 1
                val += 1
            }
            res[r][c] = val
            val += 1
            c += 1
            width -= 2
            height -= 2
        }
        return res
    }
}

func check(_ n: Int, _ expect: [[Int]]) {
    let actual = Solution().generateMatrix(n)
    Utils.test("n=\(n)", expect, actual)
}

check(3, [[1, 2, 3], [8, 9, 4], [7, 6, 5]])
