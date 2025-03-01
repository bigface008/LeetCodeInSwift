import Utils

// https://leetcode.com/problems/apply-operations-to-an-array/?envType=daily-question&envId=2025-03-01
class Solution {
    func applyOperations(_ nums: [Int]) -> [Int] {
        var res = nums
        let N = res.count
        for i in 0..<(N - 1) {
            if res[i] == res[i + 1] {
                res[i] *= 2
                res[i + 1] = 0
            }
        }
        var j = 0
        for i in 0..<N {
            if res[i] != 0 {
                res[j] = res[i]
                j += 1
            }
        }
        while j < N {
            res[j] = 0
            j += 1
        }
        return res
    }
}

func check(nums: [Int], expect: [Int]) {
    let actual = Solution().applyOperations(nums)
    Utils.test("nums=\(nums)", expect, actual)
}

// check(nums: [1, 2, 2, 1, 1, 0], expect: [1, 4, 2, 0, 0, 0])

var ans = [[Int]]()
var group = [Int]()
group.append(12)
group.append(13)
ans.append(group)
group[0] = 1
print(ans)
