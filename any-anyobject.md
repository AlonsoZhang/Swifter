# Any 和 AnyObject

AnyObject 可以代表任何 class 类型的实例

Any 可以表示任意类型，甚至包括方法 (func) 类型

将OC原来 id 的概念使用了一个类似的，可以代表任意 class 类型的 AnyObject 来进行替代。

应该选择的做法是在使用时先确定 AnyObject 真正的类型并进行转换以后再进行调用。

	import UIKit
	
	let swiftInt: Int = 1
	let swiftString: String = "miao"
	
	var array: [AnyObject] = []
	array.append(swiftInt)
	array.append(swiftString)
	array
	
Without UIKit:

	let swiftInt: Int = 1
	let swiftString: String = "miao"
	
	var array: [Any] = []
	array.append(swiftInt)
	array.append(swiftString)
	array
	
只使用 Swift 类型而不转为 Cocoa 类型，对性能的提升是有所帮助的，所以我们应该尽可能地使用原生的类型。

简单来说，我们最好避免依赖和使用Any 和 AnyObject，而去尝试明确地指出确定的类型。