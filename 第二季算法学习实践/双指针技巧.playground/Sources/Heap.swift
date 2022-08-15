import Foundation

struct Heap {
    // 批量建小顶堆
    func buildHeap(array: [Int]) {
        // 下虑 建立小顶堆
        func shiftUp(array: inout [ListNode], index: Int) {
            let element = array[index]
            var index = index
            while index > 0 {
                let parentIndex = (index - 1) / 2
                let parent = array[parentIndex]
                
                if element.val >= parent.val {
                    break
                }
                array[index] = element
                index = parentIndex
            }
            array[index] = element
        }
        
        // 下虑，小顶堆
        func shiftDown(array: inout [Int], index: Int, size: Int) {
            let element = array[index]
            var index = index
            while index < size / 2 { // size / 2是非叶子节点的个数，所以index要小于count
                var childIndex = index * 2 + 1
                var child = array[childIndex]
                let rightIndx = childIndex + 1
                // 小顶堆，取左右最小的子节点在上面
                if rightIndx < size && array[rightIndx] < child {
                    childIndex = rightIndx
                    child = array[rightIndx]
                }
                
                // 当前节点比子节点中最小的还要小，就不用交换，否则就要交换，来满足二叉堆的性质
                guard element > child else {
                    break
                }
                
                array[index] = child
                index = childIndex
            }
            array[index] = element
        }
        
        guard array.count > 0 else { return }
        var array = array
        var index = array.count / 2 - 1 // 从第一个非叶子节点开始下虑建堆
        while index >= 0 {
            shiftDown(array: &array, index: index, size: array.count)
            index -= 1
        }
        print(array)
    }
}

Heap().buildHeap(array: [1,4,5,1,3,4,2,6])
