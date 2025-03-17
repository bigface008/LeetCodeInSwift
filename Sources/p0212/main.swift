//
//  main.swift
//  LeetCodeInSwift
//

import Utils
import Collections

// https://leetcode.cn/problems/word-search-ii/
class Solution {
    private var tree = TrieTree()
    private var N = 0, M = 0
    private var board = [[Character]]()
    private var visited = [[Bool]]()
    private var ans = Set<String>()
    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        for word in words {
            tree.add(word)
        }
        M = board.count
        N = board[0].count
        self.board = board
        visited = Array(repeating: Array(repeating: false, count: N), count: M)
        for i in 0..<M {
            for j in 0..<N {
                let ch = board[i][j]
                if let node = tree.root.subNodes[ch] {
                    visited[i][j] = true
                    dfs(r: i, c: j, node: node)
                    visited[i][j] = false
                }
            }
        }
        return Array(ans)
    }
    
    private func dfs(r: Int, c: Int, node: TrieNode) {
        if let word = node.word {
            ans.insert(word)
            node.word = nil
        }
        for (dx, dy) in [(1, 0), (0, 1), (-1, 0), (0, -1)] {
            let x = dx + r, y = dy + c
            if 0 <= x && x < M && 0 <= y && y < N && !visited[x][y] {
                if let subNode = node.subNodes[board[x][y]] {
                    visited[x][y] = true
                    dfs(r: x, c: y, node: subNode)
                    visited[x][y] = false
                }
            }
        }
    }
}

class TrieTree {
    let root = TrieNode()
    
    init() {}
    
    func add(_ word: String) {
        var p = root
        for ch in word {
            if p.subNodes[ch] == nil {
                p.subNodes[ch] = TrieNode()
            }
            p = p.subNodes[ch]!
        }
        p.word = word
    }
}

class TrieNode {
    var word: String?
    
    var subNodes = [Character: TrieNode]()
    
    init() {}
}

func check(_ board: [[Character]], _ words: [String], _ expect: [String]) {
    let actual = Solution().findWords(board, words)
    Utils.test("board=\(board) words=\(words)", expect, actual)
}

//check([["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]],
//      ["oath","pea","eat","rain"],
//      ["eat","oath"])
//check([["a","b"],["c","d"]],
//      ["abcb"],
//      [])
//check([["a"]], ["a"], ["a"])

//var hp = Heap<Int>()
//hp.insert(12)
//hp.insert(15)
//hp.insert(-2)
//print(hp.min)
//print(hp.max)
