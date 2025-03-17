//
//  main.swift
//  LeetCodeInSwift
//
//  https://leetcode.com/problems/partition-array-according-to-given-pivot/
//

class Solution {
    func pivotArray(_ nums: [Int], _ pivot: Int) -> [Int] {
        let N = nums.count
        var temp = nums
        var fake = pivot
        var l = -1, r = N - 1
        while l < r {
            while l < r && getValue(nums, r, fake) >= pivot {
                r -= 1
            }
            setValue(&temp, l, &fake, getValue(temp, r, fake))
            while l < r && getValue(nums, l, fake) < pivot {
                l += 1
            }
            setValue(&temp, r, &fake, getValue(temp, l, fake))
        }
        setValue(&temp, l, &fake, pivot)
        for i in stride(from: 0, to: (l + 1) / 2, by: 1) {
            temp.swapAt(i, l + 1 - i - 1)
        }
        
        return temp
    }
    
    func getValue(_ nums: [Int], _ idx: Int, _ fake: Int) -> Int {
        if idx == -1 {
            return fake
        }
        return nums[idx]
    }
    
    func setValue(_ nums: inout [Int], _ idx: Int, _ fake: inout Int, _ newValue: Int) {
        if idx == -1 {
            fake = newValue
            return
        }
        nums[idx] = newValue
    }
}
