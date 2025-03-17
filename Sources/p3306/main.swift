import Utils

// https://leetcode.com/problems/count-of-substrings-containing-every-vowel-and-k-consonants-ii/?envType=daily-question&envId=2025-03-10
class Solution {
    func countOfSubstrings(_ word: String, _ k: Int) -> Int {
        let arr = Array(word)
        return calc(word: arr, k: k) - calc(word: arr, k: k + 1)
    }
    
    private func calc(word: [Character], k: Int) -> Int {
        var vowelFreqMap = [Character: Int]()
        var consonantCnt = 0
        var ans = 0
        var l = 0
        for ch in word {
            if isVowel(ch: ch) {
                vowelFreqMap[ch, default: 0] += 1
            } else {
                consonantCnt += 1
            }
            while vowelFreqMap.count == 5 && consonantCnt >= k {
                let dropCh = word[l]
                if isVowel(ch: dropCh) {
                    vowelFreqMap[dropCh, default: 0] -= 1
                    if vowelFreqMap[dropCh] == 0 {
                        vowelFreqMap.removeValue(forKey: dropCh)
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
    
    private func isVowel(ch: Character) -> Bool {
        ch == "a" || ch == "e" || ch == "i" || ch == "o" || ch == "u"
    }
}

func check(word: String, k: Int, expect: Int) {
    let actual = Solution().countOfSubstrings(word, k)
    Utils.test("word=\(word) k=\(k)", expect, actual)
}

check(word: "aeiou", k: 0, expect: 1)
