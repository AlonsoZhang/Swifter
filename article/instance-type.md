# 获取对象类型

获取任意一个实例类型：

OC中：

	NSDate *date = [NSDate date];
	NSLog(@"%@",NSStringFromClass([date class]));
	// 输出：
	// __NSDate
	
Swift 中：

	let date1 = NSDate()
	let name1: AnyClass! = object_getClass(date1)
	print(name1)
	// 输出：
	// __NSDate
	
更 Swift 的方式：
	
	let date = NSDate()
	let name = date.dynamicType
	print(name)
	// 输出：
	// __NSDate
	
原生的 String：

	let string = "Hello"
	let name = string.dynamicType
	print(name)
	debugPrint(name)
	// 输出：
	// Swift.String