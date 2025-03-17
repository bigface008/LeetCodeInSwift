//
//  main.swift
//  LeetCodeInSwift
//
//  https://leetcode.cn/problems/substring-with-largest-variance/?envType=daily-question&envId=2025-03-16
//

import Utils
import Algorithms

extension Character {
    var idx: Int {
        Int(asciiValue!) - Int(Character("a").asciiValue!)
    }
}

extension Int {
    func toChar() -> Character? {
        guard self >= 0 && self < 26 else { return nil }
        return Character(UnicodeScalar(97 + self)!)
    }
}

class Solution {
    func largestVariance(_ s: String) -> Int {
        var ans = 0
        let chs = Array(s)
        for perm in (0..<26).permutations(ofCount: 2) {
            let a = perm[0].toChar(), b = perm[1].toChar()
            var f0 = 0, f1 = Int.min
            for ch in s {
                if ch == a {
                    f0 = max(f0, 0) + 1
                    f1 += 1
                } else if ch == b {
                    f0 = max(f0, 0) - 1
                    f1 = f0
                }
                ans = max(ans, f1)
            }
        }
        return ans
    }
}

//class Solution {
//    func largestVariance(_ s: String) -> Int {
//        let N = s.count
//        let chs = Array(s)
//        var chPreSumMap = Array(repeating: Array(repeating: 0, count: N + 1), count: 26)
//        for (i, ch) in chs.enumerated() {
//            for chi in 0..<26 {
//                if chi == ch.idx {
//                    chPreSumMap[chi][i + 1] = chPreSumMap[chi][i] + 1
//                } else {
//                    chPreSumMap[chi][i + 1] = chPreSumMap[chi][i]
//                }
//            }
//            
//        }
//        var ans = 0
//        for i in stride(from: 0, to: N, by: 1) {
//            for j in stride(from: i, to: N, by: 1) {
//                var maxFreq = 0, minFreq = Int.max
//                for preSum in chPreSumMap {
//                    let freq = preSum[j + 1] - preSum[i]
//                    if freq == 0 {
//                        continue
//                    }
//                    maxFreq = max(maxFreq, freq)
//                    minFreq = min(minFreq, freq)
//                    ans = max(ans, maxFreq - minFreq)
//                }
////                print("[\(i), \(j)]=\(chs[i...j]) maxFreq=\(maxFreq) minFreq=\(minFreq) ans=\(ans)")
//            }
//        }
//        return ans
//    }
//}

func check(_ s: String, _ expect: Int) {
    let actual = Solution().largestVariance(s)
    Utils.test("s=\(s)", expect, actual)
}

check("aababbb", 3)
//let array = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
//var positions: [Int: [Int]] = [:]
//
//for (index, num) in array.enumerated() {
//    positions[num, default: []].append(index)
//}
//
//print(positions)
