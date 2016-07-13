# 多类型和容器

Swift 中常用的原生容器类型有三种，它们分别是 Array、Dictionay 和 Set。

它们都是泛型的，也就是说我们在一个集合中只能放同一个类型的元素。

	let numbers = [1,2,3,4,5]
	// numbers 的类型是 [Int]
	
	let strings = ["hello", "world"]
	// strings 的类型是 [String]
	
把不相关的类型放到同一个容器类型中：

	import UIKit

	let mixed1: [Any] = [1, "two", 3]
	
	// 如果不指明类型，由于 UIKit 的存在
	// 将被推断为 [NSObject]
	let objectArray = [1, "two", 3]
	
使用 enum 可以带有值的特点，将类型信息封装到特定的 enum 中。下面的代码封装了 Int 或者 String 类型：

	enum IntOrString {
	    case IntValue(Int)
	    case StringValue(String)
	}
	
	let mixed3 = [IntOrString.IntValue(1),
	    IntOrString.StringValue("two"),
	    IntOrString.IntValue(3)]
	
	for value in mixed3 {
	    switch value {
	    case let .IntValue(i):
	        print(i * 2)
	    case let .StringValue(s):
	        print(s.capitalizedString)
	    }
	}
	
	// 输出：
	// 2
	// Two
	// 6
