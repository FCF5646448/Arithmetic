//
//  LRUTest.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/26.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LRUCache {
    class func test() {
//        ["LRUCache","get","put","get","put","put","get","get"]
//        [[2],[2],[2,6],[1],[1,5],[1,2],[1],[2]]
        
        let cc = LRUCache(2)
        print(cc.get(2))
        print(cc.put(2, 6))
        print(cc.get(1))
        print(cc.put(1, 5))
        print(cc.put(1, 2))
        print(cc.get(1))
        print(cc.get(2))
    }
}
