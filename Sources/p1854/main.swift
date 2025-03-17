//
//  main.swift
//  LeetCodeInSwift
//  https://leetcode.com/problems/maximum-population-year
//

import Utils

class Solution {
    func maximumPopulation(_ logs: [[Int]]) -> Int {
        var diffMap = [Int: Int]()
        for log in logs {
            diffMap[log[0], default: 0] += 1
            diffMap[log[1], default: 0] -= 1
        }
        var maxYear = 0
        var maxPopulation = 0
        var currPopulation = 0
        for year in diffMap.keys.sorted() {
            let diff = diffMap[year]!
            currPopulation += diff
            if currPopulation > maxPopulation {
                maxPopulation = currPopulation
                maxYear = year
            }
        }
        return maxYear
    }
}

func check(_ logs: [[Int]], _ expect: Int) {
    let actual = Solution().maximumPopulation(logs)
    Utils.test("logs=\(logs)", expect, actual)
}

check([[1993, 1999], [2000, 2010]], 1993)
