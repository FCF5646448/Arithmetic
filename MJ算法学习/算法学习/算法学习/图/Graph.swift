////
////  Graph.swift
////  算法学习
////
////  Created by 冯才凡 on 2020/7/6.
////  Copyright © 2020 冯才凡. All rights reserved.
////
//
//import Foundation
//
////https://www.jianshu.com/p/5eb7c02f82d3  Equatable && Hashable
//
//
////定义一个图的接口
//public protocol Graph {
//    associatedtype T
//    
//    func addVertex()
//    
//}
//
////顶点
//public struct Vertex<V:Equatable,E:Equatable> {
//    var value:V?
//    var fromEdges:Set<Edge<V,E>>?
//    var toEdges:Set<Edge<V,E>>?
//    
//    public static func == (lhs:Vertex<V,E>,  rhs: Vertex<V,E>) ->Bool {
//        return lhs.fromEdges == rhs.fromEdges && lhs.toEdges == rhs.toEdges && lhs.value == rhs.value
//    }
//    
//}
//
////边,由两个顶点表示一条边，weight则是边的权值
//public struct Edge<V:Equatable,E:Equatable> : Hashable {
//    public static func == (lhs: Edge<V, E>, rhs: Edge<V, E>) -> Bool {
//        return true
//    }
//    
////    public static func == (lhs: Edge<V, E>, rhs: Edge<V, E>) -> Bool {
////        return lhs.from == rhs.from && lhs.to == rhs.to && lhs.weight == rhs.weight
////    }
//    
//    var from:Vertex<V,E>?
//    var to:Vertex<V,E>?
//    var weight:E?
//    
//    public var hashValue: Int {
//        return 1
//    }
//
//    public func hash(into hasher: inout Hasher) {
//
//    }
//}
//
