import UIKit


4/2
5/2


class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var sunNums:[Int] = []
        sunNums.append(contentsOf: nums1)
        sunNums.append(contentsOf: nums2)
        sunNums.sort(by: {$0<$1})
        
        print(sunNums)
        
        if sunNums.count < 1 {
            return Double(sunNums.first ?? 0)
        }
        
        if sunNums.count == 2 {
            return Double((sunNums[0] + sunNums[1]))/2.0
        }
        
        if sunNums.count % 2 == 0 {
            _ = sunNums.count / 2

            return Double(sunNums[sunNums.count / 2] + sunNums[sunNums.count / 2 - 1]) / 2.0
        }else{
            return Double(sunNums[sunNums.count / 2])
        }
    }
}

let result = Solution.init().findMedianSortedArrays([1,2], [3,4])
print(result)






