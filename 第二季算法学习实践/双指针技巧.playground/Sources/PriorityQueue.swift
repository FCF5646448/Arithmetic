import Foundation

struct PriorityQueueArray<Element: Equatable> {
    private var elements: [Element] = []
    let sort: (Element, Element) -> Bool
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element]) {
        self.elements = elements
        self.sort = sort
        self.elements.sort(by: sort)
    }
    
    var isEmpty: Bool { elements.isEmpty }
    
    var peek: Element? { elements.first }
    
    // 入队， 同时维护优先级
    @discardableResult
    mutating func enqueue(_ element: Element) -> Bool {
        for (index, otherElement) in elements.enumerated() {
            if sort(element, otherElement) {
                elements.insert(element, at: index)
                return true
            }
        }
        elements.append(element)
        return true
    }
    
    // 出队，同时移除队首元素
    @discardableResult
    mutating func dequeue() -> Element? {
        isEmpty ? nil: elements.removeFirst()
    }
}
