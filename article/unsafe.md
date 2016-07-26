# UnsafePointer

原来的 C API 中已经指明了输入的 num 指针的不可变的 (const)，因此在 Swift 中我们与之对应的是 UnsafePointer 这个不可变版本。如果只是一个普通的可变指针的话，我们可以使用 UnsafeMutablePointer 来对应：


| C API			| Swift API 				|
|:-----------:|:-------------:		| 
| const Type *	| UnsafePointer			|
| Type *			| UnsafeMutablePointer	|

	func method(num: UnsafePointer<CInt>) {
	    print(num.memory)
	}

C 的版本和 Swift 的版本只在声明变量的时候有所区别：

	// C
	int a = 123;
	method(&a);   // 输出 123

	// Swift
	var a: CInt = 123
	method(&a)    // 输出 123
	
将一个指针强制按位转成所需类型的对象：

	let arr = NSArray(object: "meow")
	let str = unsafeBitCast(CFArrayGetValueAtIndex(arr, 0), CFString.self)
	// str = "meow"