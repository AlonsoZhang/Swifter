# String 还是 NSString

	let levels = "ABCDE"
	for i in levels.characters {
	    print(i)
	}
	
	// 输出：
	// ABCDE
	
如果转换为 NSString 的话，是无法使用 characters 并且进行枚举的。

有一些 NSString 的方法在 String 中并没有实现，一个很有用的就是在 iOS 8 中新加的 containsString。我们想使用这个 API 来简单地确定某个字符串包括一个子字符串时，只能先将其转为 NSString：

	if (levels as NSString).containsString("BC") {
	    print("包含字符串")
	}
	
	// 输出：
	// 包含字符串
	
使用 String 唯一一个比较麻烦的地方在于它和 Range 的配合。

	let nsRange = NSMakeRange(1, 4)
	// 编译错误
	// Cannot invoke `stringByReplacingCharactersInRange` with an argument list of type '(NSRange, withString: String)'
	//levels.stringByReplacingCharactersInRange(nsRange, withString: "AAAA")
	
	let indexPositionOne = levels.startIndex.successor()
	let swiftRange = indexPositionOne ..< indexPositionOne.advancedBy(4)
	levels.stringByReplacingCharactersInRange(swiftRange, withString: "AAAA")
	// 输出：
	// AAAAA

将 String 转为 NSString：

	(levels as NSString).stringByReplacingCharactersInRange(
	    nsRange, withString: "AAAA")