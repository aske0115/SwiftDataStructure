class SingleLinkedList<T: Equatable>{
    
    var v: T
    var next: SingleLinkedList?
    private var head: SingleLinkedList?
    private var tail: SingleLinkedList?
    
    init(value: T) {
        v = value
        head = self
        tail = self
    }
    
    func find(v: T) -> SingleLinkedList? {
        var head = self.head
        
        while head != nil {
            if head?.v == v {
                return head
            }
            head = head?.next
        }
        return nil
    }
    
    func add(v: T) {
        let addNode = SingleLinkedList(value: v)
        if let tail = self.tail {
            tail.next = addNode
            self.tail = addNode
        }
    }
    
    func remove(v: T) {
        var head = self.head
        
        if head?.next == nil && head?.v == v {
            print("can not remove head!!")
        }
        
        while head != nil {
            if let next = head?.next, next.v == v {
                head?.next = next.next
            }
            
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
        print("=====\n")
    }
}



let node = SingleLinkedList<Int>(value: 10)
node.add(v: 20)
node.add(v: 1)
node.add(v: 3)

node.printNode()

let find = node.find(v: 1)

node.add(v: 5)
node.add(v: 4)
node.add(v: 5)
node.add(v: 5)


node.printNode()

node.remove(v: 5)

node.printNode()
node.add(v: 15)
node.add(v: 25)
node.printNode()
