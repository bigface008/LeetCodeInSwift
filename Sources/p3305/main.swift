//
//  main.swift
//  LeetCodeInSwift
//

// https://leetcode.cn/problems/count-of-substrings-containing-every-vowel-and-k-consonants-i
class Solution {
    func countOfSubstrings(_ word: String, _ k: Int) -> Int {
        return calc(word, k) - calc(word, k + 1)
    }
    
    private func calc(_ word: String, _ k: Int) -> Int {
        let N = word.count
        let chs = Array(word)
        var l = 0
        var vowelCntMap = [Character: Int]()
        var consonantCnt = 0
        var ans = 0
        for r in 0..<N {
            if isVowel(chs[r]) {
                vowelCntMap[chs[r], default: 0] += 1
            } else {
                consonantCnt += 1
            }
            while consonantCnt >= k && vowelCntMap.count == 5 {
                let lch = chs[l]
                if isVowel(lch) {
                    vowelCntMap[lch]! -= 1
                    if vowelCntMap[lch] == 0 {
                        vowelCntMap.removeValue(forKey: lch)
                    }
                } else {
                    consonantCnt -= 1
                }
                l += 1
            }
            ans += l
        }
        return ans
    }
    
    private func isVowel(_ ch: Character) -> Bool {
        ch == "a" || ch == "e" || ch == "i" || ch == "o" || ch == "u"
    }
}
