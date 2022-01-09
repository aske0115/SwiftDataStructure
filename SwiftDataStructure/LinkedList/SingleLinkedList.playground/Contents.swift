import Darwin
class Node<T : Equatable> : Equatable {
    var v: T
    var next: Node?
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.v == rhs.v && lhs.next == rhs.next
    }
    
    init(value: T) {
        v = value
    }
    
    deinit {
        print("\(v) is Gone.., byebye...")
    }
}


class SingleLinkedList<T: Equatable> {
    
    //rootNode
    private var head: Node<T>?
    private var tail: Node<T>?
    
    init() { }
    
    func find(v: T) -> [Node<T>] {
        var head = self.head
        var findElements:[Node<T>] = []
        while head != nil {
            if head?.v == v {
                findElements.append(head!)
//                return head
            }
            head = head?.next
        }
        return findElements
    }
    
    func add(v: T) {
        let addNode = Node(value: v)
        if let tail = self.tail {
            tail.next = addNode
            self.tail = addNode
        } else {
            head = addNode
            tail = addNode
        }
    }
    
    func remove(v: T) {
        
        /*
         1. 지우려는게 head야
            1-1. 근데 head다음에 next가 있으면 지우고 next를 head로 변경
            1-2. head다음에 next가 없으면 지우지못하게 하자
         2. 지우러는게 나의 next야
            2-1. next.next를 나의 next로 변경 (그러면 노드가 다다음으로 연결됨)
            2-2. next.next를 변경했는데 next의 next가 없어 (마지막이라는 소리) 그럼 그놈을 tail로 설정
            2-3. next의 next가 없는데 value도 맞아.. (그럼 개도 지워져야하고 tail은 내가되어야함)
         */
        var head = self.head
        
        if head?.next == nil && head?.v == v {
            print("can not remove head!!")
        }
        
        while head != nil {
            //지우려는 값이 head이면 head.next를 head로 설정
            if head?.v == v && head == self.head {
                self.head = head?.next
            //지우려는값이 헤드는 아닌데 head.next가있고 그 값이 지우려는 값이면, head.next에 head.next.next를 바라보게 변경하여 해당 노드 삭제
            } else if let next = head?.next, next.v == v {
                head?.next = next.next
            }
            //head의 next.next가 없고, head.next가 지울값이면.. (테일을 지워야 할 경우, 지금바라보는 node를 tail로 설정해준다.
            if head?.next?.next == nil, head?.next?.v == v{
                tail = head
                head?.next = nil
            }
            head = head?.next
        }
    }
    
    func printNode() {
        var head = self.head
        while head != nil {
            print("value = \(head!.v)")
            head = head?.next
        }
        print("============\n")
    }
}


let nodeTest = SingleLinkedList<Int>()
nodeTest.printNode()

nodeTest.add(v: 10)
nodeTest.add(v: 10)
nodeTest.add(v: 11)
nodeTest.add(v: 10)
nodeTest.add(v: 12)
nodeTest.add(v: 10)
nodeTest.add(v: 10)

nodeTest.printNode()

nodeTest.find(v: 10).forEach { node in
    print(node.next?.v ?? "Empty")
}

nodeTest.remove(v: 10)

nodeTest.printNode()


nodeTest.add(v: 12)
nodeTest.add(v: 10)
nodeTest.add(v: 10)

nodeTest.printNode()
