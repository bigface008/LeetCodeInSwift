// https://leetcode.cn/problems/shortest-path-with-alternating-colors/
import Collections
import Utils

class Solution {
    func shortestAlternatingPaths(
        _ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]
    ) -> [Int] {
        var graph = Array(repeating: [(Int, Int)](), count: n)
        for edge in redEdges {
            let a = edge[0]
            let b = edge[1]
            graph[a].append((b, 0))  // 0 red 1 blue -1 none
        }
        for edge in blueEdges {
            let a = edge[0]
            let b = edge[1]
            graph[a].append((b, 1))
        }
        var ans = Array(repeating: -1, count: n)
        var distances = Array(
            repeating: Array(repeating: Int.max, count: n), count: 2)
        distances[1][0] = 0
        distances[0][0] = 0
        var deque: Deque = [(0, 0, 0), (0, 1, 0)]  // node, color, len
        while !deque.isEmpty {
            let levelSize = deque.count
            for _ in 0..<levelSize {
                let (node, color, len) = deque.removeFirst()
                distances[color][node] = min(distances[color][node], len)
                for (subNode, edgeColor) in graph[node] {
                    if distances[edgeColor][subNode] == Int.max && color != edgeColor
                    {
                        deque.append((subNode, edgeColor, distances[color][node] + 1))
                    }
                }
            }
        }
        for i in 0..<n {
            let val = min(distances[0][i], distances[1][i])
            if val != Int.max {
                ans[i] = val
            }
        }
        return ans
    }
}

func check(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]], expect: [Int]) {
    let actual = Solution().shortestAlternatingPaths(n, redEdges, blueEdges)
    Utils.test(
        "n=\(n) redEdges=\(redEdges) blueEdges=\(blueEdges)", expect, actual)
}

//check(3, [[0,1],[1,2]], [], expect: [0,1,-1])
check(
    5,
    [[2, 2], [0, 1], [0, 3], [0, 0], [0, 4], [2, 1], [2, 0], [1, 4], [3, 4]],
    [[1, 3], [0, 0], [0, 3], [4, 2], [1, 0]],
    expect: [0, 1, 2, 1, 1]
)
