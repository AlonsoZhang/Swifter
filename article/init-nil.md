# 初始化返回 nil

在 Objective-C 中，init 方法除了返回 self 以外，其实和一个普通的实例方法并没有太大区别。

一般来说，我们还会在初始化失败 (比如输入不满足要求无法正确初始化) 的时候返回 nil 来通知调用者这次初始化没有正确完成。

但是，在 Swift 中默认情况下初始化方法是不能写 return 语句来返回值的，也就是说我们没有机会初始化一个 Optional 的值。
	
	let url = NSURL(string: "ht tp://swifter。tips")
	print(url)
	//输出 nil
	
在新版本的 Swift 中，对于可能初始化失败的情况，我们应该始终使用可返回 nil 的初始化方法，而不是类型工厂方法。
