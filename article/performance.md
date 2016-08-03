# 性能考虑

相比于 Objective-C，Swift 最大的改变就在于方法调用上的优化。

OC 中：

	methodToCall = findMethodInClass(class, selector);
	// 这个查找一般需要遍历类的方法表，需要花费一定时间
	
	methodToCall();  // 调用
	
Swift 中：

	let methodToCall = class.vtable[methodIndex]
	// 直接使用 methodIndex 获取实现
	
	methodToCall();  // 调用
	
	