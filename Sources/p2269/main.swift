// https://leetcode.cn/problems/find-the-k-beauty-of-a-number/?envType=daily-question&envId=2025-03-10

class Solution {
    func divisorSubstrings(_ num: Int, _ k: Int) -> Int {
        let str = String(num)
        let N = str.count
        var ans = 0
        for i in k...N {
            let start = str.index(str.startIndex, offsetBy: i - k)
            let end = str.index(str.startIndex, offsetBy: i)
            let substr = str[start..<end]
            let val = Int(substr) ?? 0
            if val != 0 && num % val == 0 {
                ans += 1
            }
        }
        return ans
    }
}

let str = "Hello world"
let substr = str.prefix(5)
print(type(of: substr))
let newStr = String(substr)
print(type(of: newStr))
