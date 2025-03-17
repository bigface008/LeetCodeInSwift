//
//  main.swift
//  LeetCodeInSwift
//  https://leetcode.cn/problems/string-compression/
//

import Utils

class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        let N = chars.count
        var i = 0
        var j = 0
        while i < N {
            var chCnt = 1
            let ch = chars[i]
            while i + 1 < N && chars[i + 1] == ch {
                chCnt += 1
                i += 1
            }
            i += 1
            if chCnt == 1 {
                chars[j] = ch
                j += 1
            } else {
                chars[j] = ch
                j += 1
                let digits = Array(String(chCnt))
                for d in 0..<digits.count {
                    chars[j] = digits[d]
                    j += 1
                }
            }
        }
        return j
    }
}

func check(_ chars: inout [Character], _ expect: Int) {
    let origin = Array(chars)
    let actual = Solution().compress(&chars)
    Utils.test("chars=\(origin)", expect, actual)
}

var arr: [Character] = ["a", "a", "b", "b", "c", "c", "c"]
check(&arr, 6)
print(arr)
