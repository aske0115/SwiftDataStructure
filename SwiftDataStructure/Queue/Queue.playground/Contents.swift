protocol QueueType {
    associatedtype T
    var count: Int { get }
    mutating func enqueue(item:T)
    mutating func dequeue() -> T?
}


struct Queue<T>: QueueType {
    
    private var items:[T] = []
    
    var count: Int {
        items.count
    }
    
    mutating func enqueue(item: T) {
        items.append(item)
    }
    
    @discardableResult mutating func dequeue() -> T? {
        return items.removeFirst()
    }
    
    func printQueue() {
        items.forEach {
            print($0)
        }
    }
}

var intQueue = Queue<Int>()

for i in 0..<10 {
    intQueue.enqueue(item: i)
}

print("enqueue 0..<10")
intQueue.printQueue()


print("while dequeue")
while intQueue.count > 0 {
    print("dequeue item : \(intQueue.dequeue()!)")
    intQueue.printQueue()
    print("\n======\n")
}



