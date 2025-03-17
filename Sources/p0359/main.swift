//
//  main.swift
//  LeetCodeInSwift
//

// https://leetcode.cn/problems/logger-rate-limiter/
class Logger {
    private var lastPrintTimeMap = [String: Int]()
    
    private var msgInfos = [(Int, String)]()
    
    init() {}
    
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        msgInfos.append((timestamp, message))
        if let lastTime = lastPrintTimeMap[message] {
            if lastTime + 10 <= timestamp {
                lastPrintTimeMap[message] = timestamp
                return true
            } else {
                return false
            }
        } else {
            lastPrintTimeMap[message] = timestamp
            return true
        }
    }
}
