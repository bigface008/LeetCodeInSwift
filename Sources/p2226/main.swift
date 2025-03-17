//
//  main.swift
//  LeetCodeInSwift
//
//  https://leetcode.com/problems/maximum-candies-allocated-to-k-children/?envType=daily-question&envId=2025-03-14
//

import Utils

class Solution {
    func maximumCandies(_ candies: [Int], _ k: Int) -> Int {
        // dp[i][j]
        // i -> candy piles num
        // j -> student num

        // dp[i-1][j] x
        // candies[i]
        var temp = candies
        temp.sort()
        let candySum = temp.reduce(0, +)
        var start = 0
        var end = candySum / k + 1
        while start < end {
            let mid = start + (end - start) / 2
            if isValid(temp, k, mid) {
                start = mid + 1
            } else {
                end = mid
            }
        }
        if isValid(temp, k, start) {
            return start
        }
        return start - 1
    }

    func isValid(_ candies: [Int], _ k: Int, _ candyNum: Int) -> Bool {
        if candyNum == 0 {
            return true
        }
        let N = candies.count
        var start = 0
        var end = N
        while start < end {
            let mid = start + (end - start) / 2
            if candies[mid] >= candyNum {
                end = mid
            } else {
                start = mid + 1
            }
        }
        if start > 0 && candies[start - 1] >= candyNum {
            start -= 1
        }
        var validCnt = 0
        for i in stride(from: start, to: N, by: 1) {
            validCnt += candies[i] / candyNum
            if validCnt >= k {
                return true
            }
        }
        return false
    }
}

func check(_ candies: [Int], _ k: Int, _ expect: Int) {
    let actual = Solution().maximumCandies(candies, k)
    Utils.test("candies=\(candies)", expect, actual)
}

//check([2, 5], 11, 0)
check([5, 8, 6], 3, 5)
