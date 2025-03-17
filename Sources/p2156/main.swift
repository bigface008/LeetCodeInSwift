//
//  main.swift
//  LeetCodeInSwift
//

import Foundation
import Utils

// https://leetcode.cn/problems/find-substring-with-given-hash-value/
class Solution {
    func subStrHash(_ s: String, _ power: Int, _ modulo: Int, _ k: Int, _ hashValue: Int) -> String {
        let N = s.count
        let MOD = Int64(modulo)
        let POWER = Int64(power)
        let chs = Array(s)
        var hash: Int64 = 0
        var powerVal: Int64 = 1
        for i in stride(from: N - 1, through: N - k, by: -1) { // 0, k
            let chVal = Int64(chs[i].asciiValue! - Character("a").asciiValue! + 1)
            hash = ((hash * POWER) % MOD + chVal) % MOD
            powerVal = (powerVal * POWER) % MOD
        }
        var ans = hash == hashValue ? N - k : 0
        for i in stride(from: N - k - 1, through: 0, by: -1) { // k N
            let currChVal = Int64(chs[i].asciiValue! - Character("a").asciiValue!) + 1
            let dropChVal = Int64(chs[i + k].asciiValue! - Character("a").asciiValue!) + 1
            hash = (hash * POWER + currChVal - powerVal * dropChVal % MOD + MOD) % MOD
            if hash % MOD == hashValue {
                ans = i
            }
        }
        return String(chs[ans..<ans + k])
    }
}

//class Solution {
//    func subStrHash(_ s: String, _ power: Int, _ modulo: Int, _ k: Int, _ hashValue: Int) -> String {
//        let N = s.count
//        let chs = Array(s)
//        var sumVal: Int64 = 0
//        var powerVal: Int64 = 1
//        for i in 0..<k {
//            print("powerVal=\(powerVal)")
//            sumVal += Int64(chs[i].asciiValue! - Character("a").asciiValue! + 1) * Int64(powerVal)
//            print("  ch=\(chs[i]) val=\(Int64(chs[i].asciiValue! - Character("a").asciiValue! + 1))")
//            if i != k - 1 {
////                powerVal = (powerVal % Int64(modulo)) * Int64(power % modulo)
//                powerVal = Int64(power) * powerVal
//            }
//        }
//        
//        
//        var realValue: Int64 = 0
//        var pv: Int64 = 1
//        for j in 0..<k {
//            let val = Int64(chs[j].asciiValue! - Character("a").asciiValue!) + 1
//            realValue += val * pv
//            pv *= Int64(power)
//        }
//        
//        if sumVal % Int64(modulo) == hashValue {
//            return String(chs[0..<k])
//        }
//        print("realValue=\(realValue) realValue % MOD=\(realValue % Int64(modulo)) calcValue=\(sumVal) calcValue % MOD=\(sumVal % Int64(modulo))")
//        for i in k..<N {
//            let currChVal = Int64(chs[i].asciiValue! - Character("a").asciiValue!) + 1
//            print("  ch=\(chs[i]) val=\(currChVal)")
//            let dropChVal = Int64(chs[i - k].asciiValue! - Character("a").asciiValue!) + 1
//            sumVal = (sumVal - dropChVal) / Int64(power) + currChVal * powerVal
//            
//            var realValue: Int64 = 0
//            var pv: Int64 = 1
//            for j in 0..<k {
//                let val = Int64(chs[i - k + 1 + j].asciiValue! - Character("a").asciiValue!) + 1
//                realValue += val * pv
//                pv *= Int64(power)
//            }
//            print("i=\(i) realValue=\(realValue) realValue % MOD=\(realValue % Int64(modulo)) calcValue=\(sumVal) calcValue % MOD=\(sumVal % Int64(modulo))")
//            
//            if sumVal % Int64(modulo) == hashValue {
//                return String(chs[(i - k + 1)...i])
//            }
//        }
//        return ""
//    }
//}

func check(_ s: String, _ power: Int, _ modulo: Int, _ k: Int, _ hashValue: Int, _ expect: String) {
    let actual = Solution().subStrHash(s, power, modulo, k, hashValue)
    Utils.test("s=\(s) power=\(power) module=\(modulo) k=\(k) hashValue=\(hashValue)", expect, actual)
}

check("leetcode", 7, 20, 2, 0, "ee")
check("xmmhdakfursinye", 96, 45, 15, 21, "")
check("xxterzixjqrghqyeketqeynekvqhc", 15, 94, 4, 16, "nekv")
