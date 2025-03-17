//
//  main.swift
//  LeetCodeInSwift
//

import Utils
import Collections

class Solution {
    //    func maxDepth(_ root: TreeNode?) -> Int {
    //        if root == nil {
    //            return 0
    //        }
    //        return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
    //    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        var stk = [(TreeNode?, Int)]()
        stk.append((root, 1))
        var ans = 0
        while !stk.isEmpty {
            let (node, depth) = stk.removeLast()
            if node == nil {
                continue
            }
            ans = max(ans, depth)
            if node?.right != nil {
                stk.append((node?.right, depth + 1))
            }
            if node?.left != nil {
                stk.append((node?.left, depth + 1))
            }
        }
        return ans
    }
}
