import Utils

class Solution {
    func lenLongestFibSubseq(_ arr: [Int]) -> Int {
        // var sum2Pairs = [Int: [(Int, Int)]]()
        let N = arr.count
        var val2Idx = [Int: Int]()
        for (i, x) in arr.enumerated() {
            val2Idx[x] = i
        }
        var dp = Array(repeating: Array(repeating: 0, count: N), count: N)
        var ans = 0
        for i in 1..<N {
            for j in (i + 1)..<N {
                var res = 0
                let prevVal = arr[j] - arr[i]
                if let prevIdx = val2Idx[prevVal] {
                    if prevIdx >= i {
                        continue
                    }
                    if dp[prevIdx][i] == 0 {
                        res = 3
                    } else {
                        res = dp[prevIdx][i] + 1
                    }
                }
                dp[i][j] = res
                ans = max(ans, res)
            }
        }
        // for row in dp {
        //     print(row)
        // }
        return ans
    }
}

func check(arr: [Int], expect: Int) {
    let actual = Solution().lenLongestFibSubseq(arr)
    Utils.test("arr=\(arr)", expect, actual)
}

check(arr: [1, 2, 3, 4, 5, 6, 7, 8], expect: 5)
check(arr: [2, 4, 7, 8, 9, 10, 14, 15, 18, 23, 32, 50], expect: 5)
// 4 14 18 32 50
// 1  6  8 10 11

// 1,5 -> 0
// 5,7 -> 3
// 7,9 -> 4
// 9,10 -> 5
