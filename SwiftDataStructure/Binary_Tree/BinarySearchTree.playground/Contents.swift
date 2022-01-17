class Node<T: Equatable & Comparable> : Equatable & Comparable {
    var data: T
    var left: Node?
    var right: Node?
    
    init(item: T) {
        self.data = item
    }
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.data == rhs.data &&
                lhs.left == rhs.left &&
                lhs.right == rhs.right
    }
    
    static func < (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.data < rhs.data
    }
    
    static func > (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.data > rhs.data
    }
}

class BinarySearchTree<T: Equatable & Comparable> {
    var root: Node<T>
    
    init(head: Node<T>) {
        self.root = head
    }
    
    func insert_data(item: T) {
        var currentNode = root
        while true {
            //루트보다 넣을값이 크면 오른쪽으로..
            if item > currentNode.data {
                if currentNode.right == nil {
                    currentNode.right = Node<T>(item: item)
                    break
                } else {
                    currentNode = currentNode.right!
                }
            } else if item < currentNode.data {
                if currentNode.left == nil {
                    currentNode.left = Node<T>(item: item)
                    break
                } else {
                    currentNode = currentNode.left!
                }
            }
        }
    }
    
    func search_data(item: T) -> Node<T>? {
        var head:Node<T>? = root
        while head != nil {
            if head!.data == item {
                return head
            }
            else if item < head!.data {
                head = head!.left
            } else {
                head = head!.right
            }
        }
        return nil
    }
    
    func printTree() {
        var rt: Node<T>? = root
        while rt != nil {
            print("rootData left: \(rt?.data)")
            rt = rt?.left
        }

        rt = root.right
        while rt != nil {
            print("rootData right: \(rt?.data)")
            rt = rt?.right
        }
    }

}


//tree 공부하기 전에 느낌대로 만들어본 트리인데.. 애들재우러가야하니 이만.
//tree공부 다 하고 다시 다듬어볼께요.

let sol = BinarySearchTree<Int>(head: Node<Int>(item: 21))
sol.insert_data(item: 14)
sol.insert_data(item: 28)
sol.insert_data(item: 11)
sol.insert_data(item: 5)
sol.printTree()

sol.search_data(item: 11)

