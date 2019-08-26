import UIKit

/*
 用面向协议的方式来实现一个栈和队列
 */

/*
 通常来说，一个栈的基本操作包括压栈push，出栈pop，是否为空，栈顶元素，以及大小size
 */
protocol stack {
    //持有的类型 associatedtype主要是为了做占位符
    associatedtype Element
    
    var isEmpty:Bool{get}
    var size:Int{get}
    var peek:Element? {get}
    
    // mutating 函数中要修改 struct或enum的变量或self，则
    mutating func push(_ newElement:Element)
    mutating func pop()->Element?
}

struct IntStack : stack {
    //设置占位类型真正类型
    typealias Element = Int
    
    //存放每一个元素
    private var stack = [Element]()
    
    var isEmpty:Bool{return stack.count == 0}
    var size:Int{return stack.count}
    var peek:Element? {return stack.last}
    
    // mutating 函数中要修改 struct或enum的变量或self，则
    mutating func push(_ newElement:Element) {
        stack.append(newElement)
    }
    mutating func pop()->Element? {
        return stack.popLast() //Array自带的方法
    }
}


/*
 同样的，我们使用面向写的方式来实现一个队列。
 一个队列的基本操作包括入队enqueue，出队dequeue，队首元素，以及大小size
 */

protocol queue {
    associatedtype Element
    var isEmpty:Bool{get}
    var size:Int{get}
    var peek:Element? {get}
    
    mutating func enqueue(_ newElement:Element)
    mutating func dequeue()->Element?
}

struct IntQueue : queue {
    typealias Element = Int
    
    private var queue = [Element]()
    
    var isEmpty:Bool{return queue.count == 0}
    var size:Int{return queue.count}
    var peek:Element? {return queue.first}
    
    mutating func enqueue(_ newElement:Element) {
        queue.append(newElement)
    }
    
    mutating func dequeue()->Element? {
        let temp =  queue.first
        if temp != nil {
            queue.remove(at: 0)
        }
        return temp
    }
    
}

var q = IntQueue()
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.enqueue(4)
q.enqueue(5)

print(q.dequeue()!)


/*
 给出一个绝对路径，将其简化，比如/home/ ，简化后是/home；路径 '/a/./b/../../c/',简化后是/c
 简而言之就是 .不用管，string压栈，..出栈
 */

func isSimplePath(_ path:String)->String {
    var pathStack = [String]()
    //拆分路径
    let paths = path.components(separatedBy: "/")
    
    for path in paths {
        //
        guard path != "." else {
            continue
        }
        
        if path == ".." {
            if pathStack.count > 0 {
                pathStack.popLast()
            }
        }else if path != "" {
            pathStack.append(path)
        }
    }
    let res = pathStack.reduce(""){totle,dir in "\(totle)/\(dir)"}
    
    return res.isEmpty ? "/" : res
}

print(isSimplePath("/a/./b/../../c/"))







