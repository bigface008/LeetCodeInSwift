//
//  main.swift
//  LeetCodeInSwift
//

import Utils

// https://leetcode.com/problems/kth-smallest-element-in-a-bst/
class Solution {
    private var k = 0
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        self.k = k
        return dfs(root)
    }
    
    func dfs(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return -1
        }
        let leftNode = dfs(root?.left)
        if leftNode != -1 {
            return leftNode
        }
        k -= 1
        if k == 0 {
            return root?.val ?? -1
        }
        return dfs(root?.right)
    }
}

let root = TreeNode(1)
root.right = TreeNode(2)
print(Solution().kthSmallest(root, 2))
