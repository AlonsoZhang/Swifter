# 自省

向一个对象发出询问，以确定它是不是属于某个类，这种操作就称为自省。

OC中：

	[obj1 isKindOfClass:[ClassA class]];
	[obj2 isMemberOfClass:[ClassB class]];
	
-isKindOfClass: 判断 obj1 是否是 ClassA **或者其子类**的实例对象；而 isMemberOfClass: 则对 obj2 做出判断，**当且仅当** obj2 的类型为 ClassB 时返回为真。

Swift 中：

	class ClassA: NSObject { }
	class ClassB: ClassA { }
	
	let obj1: NSObject = ClassB()
	let obj2: NSObject = ClassB()
	
	obj1.isKindOfClass(ClassA.self)    // true
	obj2.isMemberOfClass(ClassA.self)  // false

为了快速确定类型，Swift 提供了一个简洁的写法：对于一个不确定的类型，我们现在可以使用 is 来进行判断。is 在功能上相当于原来的 isKindOfClass。

	let obj: AnyObject = ClassB()
	
	if (obj is ClassA) {
	    print("属于 ClassA")
	}
	
	if (obj is ClassB) {
	    print("属于 ClassB")
	}

如果编译器能够唯一确定类型，那么 is 的判断就没有必要，编译器将会抛出一个警告，来提示你并没有转换的必要。

	let string = "String"
	if string is String {
	    // Do something
	}
	
	// 'is' test is always true