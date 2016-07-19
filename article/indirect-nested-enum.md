# indirect 和嵌套 enum

在 Swift 中，我们可以这样来定义一个单向链表：

	class Node<T> {
	    let value: T?
	    let next: Node<T>?
	    
	    init(value: T?, next: Node<T>?) {
	        self.value = value
	        self.next = next
	    }
	}
	
	let list = Node(value: 1,
	    next: Node(value: 2,
	        next: Node(value: 3,
	            next: Node(value: 4, next: nil))))
	            
Swift2 中，

	indirect enum LinkedList<Element: Comparable> {
	    case Empty
	    case Node(Element, LinkedList<Element>)
	}
	let linkedList = LinkedList.Node(1, .Node(2, .Node(3, .Node(4, .Empty))))
	// 单项链表：1 -> 2 -> 3 -> 4
	
链表节点的删除方法：

