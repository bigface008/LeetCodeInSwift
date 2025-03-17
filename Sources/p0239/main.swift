//
//  main.swift
//  LeetCodeInSwift
//
//

// https://leetcode.cn/problems/sliding-window-maximum/
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var monoStk = [Int]()
        let N = nums.count
        for i in 0..<k {
            let x = nums[i]
            while !monoStk.isEmpty && nums[monoStk.last!] < x {
                monoStk.removeLast()
            }
            monoStk.append(i)
        }
        var ans = [nums[monoStk.first!]]
        for i in k..<N {
            let x = nums[i]
            if monoStk.first == i - k {
                monoStk.removeFirst()
            }
            while !monoStk.isEmpty && nums[monoStk.last!] < x {
                monoStk.removeLast()
            }
            monoStk.append(i)
            ans.append(nums[monoStk.first!])
        }
        return ans
    }
}
