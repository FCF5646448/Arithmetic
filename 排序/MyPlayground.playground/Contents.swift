import UIKit


class QuickSourt {
    func sort(_ array:[Int]) -> [Int] {
        func quickSort(_ arr:inout [Int] ,_ l:Int, _ r:Int) {
            if l > r {
                return
            }
            
            var left = l
            var right = r
            let temp = arr[l]
            
            while l < r {
                while arr[right] >= temp && left < right {
                    right -= 1
                }
                
                while arr[left] <= temp && left < right {
                    left += 1
                }
                
                if left < right {
                    let t = arr[left]
                    arr[left] = arr[right]
                    arr[right] = t
                }
            }
            
            arr[l] = arr[left]
            arr[left] = temp
            
            quickSort(&arr, l, left)
            quickSort(&arr, left+1, r)
        }
        
        var result = array
        quickSort(&result, 0, result.count)
        return result
    }
}

let s = QuickSourt().sort([6,5,2,3,1])
print(s)



