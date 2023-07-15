//
//  _121_买卖股票的最佳时机.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/20.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

class Solution {
    
    /*
     121. 买卖股票的最佳时机
     给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。

     如果你最多只允许完成一笔交易（即买入和卖出一支股票一次），设计一个算法来计算你所能获取的最大利润。

     注意：你不能在买入股票前卖出股票。

      

     示例 1:

     输入: [7,1,5,3,6,4]
     输出: 5
     解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
          注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
     示例 2:

     输入: [7,6,4,3,1]
     输出: 0
     解释: 在这种情况下, 没有交易完成, 所以最大利润为 0

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     
     解析：因为是一次买卖，所以只需记录从最小值之后的最大值。
     
     */
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else{
            return 0
        }
        //用一个单调栈维护一个递增的序列,每一次pop的时候都对比一下栈顶与栈底直接的差值。
        var stack = [Int]()
        var differenceValue = Int.min //最大差值
//        var minPrice = Int.max
        
        var i = 0
        while i < prices.count {
            let n = prices[i]
            if stack.isEmpty || n > stack.last! {
                //栈为空或者比栈顶元素大，入栈
                stack.append(n)
            }else if !stack.isEmpty && n < stack.first! {
                //栈不为空，且比栈底元素小，记录差值，清空栈，将当前值入栈
                if stack.count > 1 {
                    differenceValue = max(stack.last! - stack.first!,differenceValue)
                }
                stack.removeAll()
                stack.append(n)
            }
            
            i += 1
        }
        
        if stack.count > 1 {
            differenceValue = max(stack.last! - stack.first!,differenceValue)
        }
        
        return differenceValue < 0 ? 0 : differenceValue
    }
    
    
}
