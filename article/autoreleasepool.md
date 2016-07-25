# @autoreleasepool

Swift 在内存管理上使用的是自动引用计数 (ARC) 。

retain 和 release 都很直接，就是将对象的引用计数加一或者减一。

autorelease 将接受该消息的对象放到一个预先建立的自动释放池 (auto release pool) 中，并在 自动释放池收到 drain 消息时将这些对象的引用计数减一，然后将它们从池子中移除。

Swift 1.0：

	func loadBigData() {
	    if let path = NSBundle.mainBundle()
	        .pathForResource("big", ofType: "jpg") {
	
	        for i in 1...10000 {
	            autoreleasepool {
	                let data = NSData.dataWithContentsOfFile(
	                    path, options: nil, error: nil)
	
	                NSThread.sleepForTimeInterval(0.5)
	            }
	        }
	    }
	}
	
现在：

	let data = NSData(contentsOfFile: path)