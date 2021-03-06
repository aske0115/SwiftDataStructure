import Darwin
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
            } else
            {
                
                break
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
        printTree(root)
    }
    
    private func printTree(_ node: Node<T>?) {
        guard let node = node else { return }
        print("node.data \(node.data)")
        if node.left != nil {
            print("node.left.data \(node.left!.data)")
        }
        
        if node.right != nil {
            print("node.right.data \(node.right!.data)")
        }
        printTree(node.left)
        printTree(node.right)
    }
    
    
    func deleteData(_ item: T) {
        var search_node = false
        var currentNode: Node<T>? = root
        var parentNode: Node<T>? = root
        
        while currentNode != nil {
            if currentNode!.data == item {
                search_node = true
                break
            }
            else if item < currentNode!.data {
                parentNode = currentNode
                currentNode = currentNode!.left
            } else {
                parentNode = currentNode
                currentNode = currentNode!.right
            }
        }
        
        if !search_node {
            return
        }
        
        //leaf node
        if currentNode?.left == nil && currentNode?.right == nil {
            if currentNode == parentNode?.left {
                parentNode?.left = nil
            } else {
                parentNode?.right = nil
            }
        }
        //only left node
        else if currentNode?.left != nil && currentNode?.right == nil {
            if currentNode == parentNode?.left {
                parentNode?.left = currentNode?.left
            } else {
                parentNode?.right = currentNode?.left
            }
        }
        //only right node
        else if currentNode?.left == nil && currentNode?.right !== nil {
            if currentNode == parentNode?.left {
                parentNode?.left = currentNode?.right
            } else {
                parentNode?.right = currentNode?.right
            }
        }
        //have two child node
        else if currentNode?.left != nil && currentNode?.right !== nil {
            //지울 노드가 parent의 왼쪽인 경우,
            let isLeftNode = currentNode == parentNode?.left
            
                //가장 작은걸 찾아야하는 노드와 그 페어런트를 저장
                var changeNode = currentNode?.right
                var changeNodeParent = currentNode
                
                
                //더 작은수가 없을떄 까지 반복문.
                while changeNode?.left != nil {
                    changeNodeParent = changeNode
                    changeNode = changeNode?.left
                }
                
        
                if isLeftNode {
                    //부모노드의 왼쪽(지울노드)에 가장 작은 노드를 연결
                    parentNode?.left = changeNode
                } else {
                    //부모노드의 오른쪽(지울노드)에 가장 작은 노드를 연결
                    parentNode?.right = changeNode
                }
                
                
                //가장 작은 노드의 왼쪽에 지울노드의 왼쪽을 연결
                changeNode?.left = currentNode?.left
                
                //가장 작은 노드의 parent 노드의 왼쪽에 가장 작은 노드가 들고있던 오른쪽 노드를 연결
                changeNodeParent?.left =  changeNode?.right
                
                //가장 작은 노드의 오른쪽에 가장작은 노드의 부모 노드를 연결
                changeNode?.right = changeNodeParent
        }
    }
}


//tree 공부하기 전에 느낌대로 만들어본 트리인데.. 애들재우러가야하니 이만.
//tree공부 다 하고 다시 다듬어볼께요.


var values:Set<Int> = []
while values.count != 10 {
    values.insert(Int.random(in: 0..<100))
}

print("values = \(values)")

let sol = BinarySearchTree<Int>(head: Node<Int>(item: values.randomElement()!))

for val in values {
    sol.insert_data(item: val)
}

sol.printTree()

sol.search_data(item: 11)

let ss = values.randomElement()!

sol.deleteData(ss)


sol.printTree()
//
sol.search_data(item: 15)

