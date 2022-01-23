/*
 heap은 배열을 아용
 root는 index 1번부터 채우게 됨
 - 나의 부모노드 인덱스를 구하는 뻡은 자신의 인덱스 / 2 를 한 몫
 - 내 자식노드를 아는법 (왼쪽 : 내 인덱스 * 2.  오른쪽 : 내 인덱스 * 2 + 1)
 완전이진트리이기때문에 인덱스 규칙이 적용됨.
 */


class Heap<T: Comparable> {
    var items:[T?] = []

    init(_ item: T) {
        self.items.append(nil)
        self.items.append(item)
    }
    
    func insert(_ item: T) {
        if self.items.isEmpty {
            self.items.append(nil)
            self.items.append(item)
            return
        }
        
        self.items.append(item)
        
        var currentInserted_idx = self.items.count - 1
        while moveUp(currentInserted_idx) {
            let parent_idx = currentInserted_idx / 2
            let currentValue = self.items[currentInserted_idx]
            self.items[currentInserted_idx] = self.items[parent_idx]
            self.items[parent_idx] = currentValue
            currentInserted_idx = parent_idx
        }
    }
    
    private func moveUp(_ index: Int) -> Bool {
        if  index <= 1 {
            return false
        }
        
        if let currentValue = self.items[index], let parent = self.items[index / 2] {
            return currentValue > parent
        }
        return false
    }
    
}

let heap = Heap<Int>(15)
heap.insert(10)
heap.insert(8)
heap.insert(5)
heap.insert(4)

print(heap.items)

heap.insert(20)
print(heap.items)
