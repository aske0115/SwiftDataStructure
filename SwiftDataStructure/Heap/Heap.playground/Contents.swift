/*
 heap은 배열을 아용
 root는 index 1번부터 채우게 됨
 - 나의 부모노드 인덱스를 구하는 뻡은 자신의 인덱스 / 2 를 한 몫
 - 내 자식노드를 아는법 (왼쪽 : 내 인덱스 * 2.  오른쪽 : 내 인덱스 * 2 + 1)
 완전이진트리이기때문에 인덱스 규칙이 적용됨.
 */

enum HeapType: Int {
    case min,max
}

class Heap<T: Comparable> {
    var items:[T?] = []
    private var heapType: HeapType = .max
    
    convenience init(_ item: T, heapType: HeapType) {
        self.init(item)
        self.heapType = heapType
    }
    
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
    }
}
