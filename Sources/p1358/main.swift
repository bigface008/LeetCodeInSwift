//
//  main.swift
//  LeetCodeInSwift
//  https://leetcode.com/problems/number-of-substrings-containing-all-three-characters/?envType=daily-question&envId=2025-03-11
//

class Solution {
    func numberOfSubstrings(_ s: String) -> Int {
        let chs = Array(s)
        let N = chs.count
        var cntMap = [Character: Int]()
        var l = 0
        var ans = 0
        for r in 0..<N {
            cntMap[chs[r], default: 0] += 1
            while cntMap.count == 3 {
                let lch = chs[l]
                cntMap[lch]! -= 1
                if cntMap[lch] == 0 {
                    cntMap.removeValue(forKey: lch)
                }
                l += 1
            }
            ans += l
        }
        return ans
    }
}
