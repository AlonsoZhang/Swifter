# NSNull

OC 中：

	NSInteger voteCount = [jsonDic objectForKey:@"voteCount"] integerValue];
	// 如果在 JSON 中 voteCount 对应的是 null 的话
	// [NSNull intValue]: unrecognized selector sent to instance 崩溃

1. 在每次发送消息的时候都进行类型检查，以确保将要接收消息的对象不是 NSNull 的对象。
2. 添加 NSNull 的 category，让它响应各种常见的方法 (比如 integerValue 等)，并返回默认值。

Swift 中：

	// 假设 jsonValue 是从一个 JSON 中取出的 NSNull
	let jsonValue: AnyObject = NSNull()
	
	if let string = jsonValue as? String {
	    print(string.hasPrefix("a"))
	} else {
	    print("不能解析")
	}
	
	// 输出：
	// 不能解析
