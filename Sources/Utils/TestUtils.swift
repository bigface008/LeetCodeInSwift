//
//  TestUtils.swift
//  LeetCodeInSwift
//
//  Created by 汪喆昊 on 2025/2/26.
//

public func test<T: Equatable>(_ name: String, _ expected: T, _ actual: T) {
    if expected == actual {
        print("✅ [PASSED] \(name)")
    } else {
        print("❌ [FAILED] \(name) expect=\(expected) actual=\(actual)")
    }
}
