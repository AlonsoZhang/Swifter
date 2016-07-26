# 判等

Swift 中的 String 类型中是没有 -isEqualToString: 或者 -isEqual: 这样的方法的，因为这些毕竟是 NSObject 的东西。在 Swift 的字符串内容判等，我们简单地使用 == 操作符来进行：

	let str1 = "快乐的字符串"
	let str2 = "快乐的字符串"
	let str3 = "开心的字符串"
	
	str1 == str2  // true
	str1 == str3  // false

在 Objective-C 中 == 这个符号的意思是判断两个对象是否指向同一块内存地址。

Swift中 == 和原来 Objective-C 的 isEqual: 的行为十分相似。

对于原来 Objective-C 中使用 == 进行的对象指针的判定，在 Swift 中提供的是另一个操作符 ===。

	func ===(lhs: AnyObject?, rhs: AnyObject?) -> Bool

它用来判断两个 AnyObject 是否是同一个引用。

