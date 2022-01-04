protocol StackType {
    associatedtype T
    var count: Int { get }
    mutating func push(item: T)
    mutating func pop() -> T?
}


struct Stack<T> :  StackType {
    
    private var items: [T] = []
    
    var count: Int {
        items.count
    }
    
    mutating func push(item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T? {
        items.removeLast()
    }

    func printStack() {
        items.reversed().forEach {
            print($0)
        }
    }
}


var stringStack = Stack<String>()

for i in 0..<10 {
    stringStack.push(item: "\(i)")
}

print("push 0..<10")
stringStack.printStack()


print("while pop")
while stringStack.count > 0 {
    print("pop item : \(stringStack.pop()!)")
    stringStack.printStack()
    print("\n======\n")
}

