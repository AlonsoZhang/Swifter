# 值类型和引用类型

Swift 的类型分为值类型和引用类型两种，值类型在传递和赋值时将进行复制，而引用类型则只会使用引用对象的一个 "指向"。

Swift 中的 struct 和 enum 定义的类型是值类型，使用 class 定义的为引用类型。

	func test(arr: [Int]) {
	    for i in arr {
	        print(i)
	    }
	}
	
	var a1 = [1,2,3]
	var b1 = a1
	let c1 = b1
	test(a1)
	
只在第一句 a 初始化赋值时发生了内存分配，而之后的 b，c 甚至传递到 test 方法内的 arr，和最开始的 a 在物理内存上都是同一个东西。

这个过程对于数组来说，只发生了指针移动，而完全没有堆内存的分配和释放的问题。

	var a2 = [1,2,3]
	var b2 = a2
	b2.append(5)
	// 此时 a 和 b 的内存地址不再相同
	
值类型在复制时，会将存储在其中的值类型一并进行复制，而对于其中的引用类型的话，则只复制一份引用。

	class MyObject {
	    var num = 0
	}
	
	var myObject = MyObject()
	var a3 = [myObject]
	var b3 = a3
	
	b3.append(myObject)
	
	myObject.num = 100
	print(b3[0].num)   //100
	print(b3[1].num)   //100
	
	// myObject 的改动同时影响了 b3[0] 和 b3[1]

在使用数组合字典时的最佳实践应该是，按照具体的数据规模和操作特点来决定到时是使用值类型的容器还是引用类型的容器：在需要处理大量数据并且频繁操作 (增减) 其中元素时，选择 NSMutableArray 和 NSMutableDictionary 会更好，而对于容器内条目小而容器本身数目多的情况，应该使用 Swift 语言内建的 Array 和 Dictionary。