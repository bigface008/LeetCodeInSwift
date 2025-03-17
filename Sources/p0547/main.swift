import Utils

// https://leetcode.cn/problems/number-of-provinces/
class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let N = isConnected.count
        var ans = 0
        var visited = Array(repeating: false, count: N)
        for i in 0..<N {
            if visited[i] {
                continue
            }
            ans += 1
            dfs(node: i, isConnect: isConnected, visited: &visited)
        }
        return ans
    }

    func dfs(node: Int, isConnect: [[Int]], visited: inout [Bool]) {
        if visited[node] {
            return
        }
        visited[node] = true
        let N = isConnect.count
        for i in 0..<N {
            if isConnect[node][i] == 0 || node == i || visited[i] {
                continue
            }
            dfs(node: i, isConnect: isConnect, visited: &visited)
        }
    }
}

func check(_ isConnected: [[Int]], expect: Int) {
    let output = Solution().findCircleNum(isConnected)
    Utils.test("isConnected=\(isConnected)", expect, output)
}

check([[1, 1, 0], [1, 1, 0], [0, 0, 1]], expect: 2)
