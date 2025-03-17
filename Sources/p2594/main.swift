//
//  main.swift
//  LeetCodeInSwift
//
//  https://leetcode.com/problems/minimum-time-to-repair-cars/?envType=daily-question&envId=2025-03-16
//

import Utils
import Foundation

class Solution {
    func repairCars(_ ranks: [Int], _ cars: Int) -> Int {
        let N = ranks.count
        var start = 0, end = ranks.min()! * cars * cars + 1
        while start < end {
            let mid = start + (end - start) / 2
            if isValid(ranks, mid, cars) {
                end = mid
            } else {
                start = mid + 1
            }
        }
        if !isValid(ranks, start, cars) {
            return start - 1
        }
        return start
    }
    
    private func isValid(_ ranks: [Int], _ time: Int, _ cars: Int) -> Bool {
        var maxCarSum = 0
        for r in ranks {
            maxCarSum += Int(sqrt(Double(time / r)))
        }
        return maxCarSum >= cars
    }
}

//class Solution {
//    func repairCars(_ ranks: [Int], _ cars: Int) -> Int {
//        let ranks = ranks.sorted(by: >)
//
//        // dp[i][j]
//        let N = ranks.count
//        var dp = Array(repeating: Array(repeating: 0, count: cars + 1), count: N)
//        for i in 0..<N {
//            for j in 0...cars {
//                if i == 0 {
//                    dp[i][j] = j * j * ranks[i]
//                    continue
//                }
//                var temp = Int.max
//                for k in 0...j {
//                    let prev = dp[i - 1][j - k]
//                    let curr = k * k * ranks[i]
//                    temp = min(temp, max(prev, curr))
//                    if curr > prev {
//                        break
//                    }
//                }
//                dp[i][j] = temp
//            }
//        }
//        return dp[N - 1][cars]
//    }
//}

func check(_ ranks: [Int], _ cars: Int, _ expect: Int) {
    let actual = Solution().repairCars(ranks, cars)
    Utils.test("ranks=\(ranks) cars=\(cars)", expect, actual)
}

check([4, 2, 3, 1], 10, 16)
