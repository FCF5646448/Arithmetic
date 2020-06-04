//
//  ViewController.swift
//  算法Demo
//
//  Created by 冯才凡 on 2020/6/4.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let s = QuickSourt().sort([6,5,2,3,1])
        print(s)
    }


}


class QuickSourt {
    func sort(_ array:[Int]) -> [Int] {
        func quickSort(_ arr:inout [Int] ,_ left:Int, _ right:Int) {
            if left > right {
                return
            }
            
            var l = left
            var r = right
            let temp = arr[left]
            
            while l != r {
                while l < r  && arr[r] >= temp {
                    r -= 1
                }
                
                while l < r && arr[l] <= temp  {
                    l += 1
                }
                
                if l < r {
                    let t = arr[l]
                    arr[l] = arr[r]
                    arr[r] = t
                }
            }
            
            arr[left] = arr[l]
            arr[l] = temp
            
            quickSort(&arr, left, l-1)
            quickSort(&arr, l+1, right)
        }
        
        var result = array
        quickSort(&result, 0, result.count-1)
        return result
    }
}



