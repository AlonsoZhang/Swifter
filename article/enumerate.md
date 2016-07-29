# 数组 enumerate

对某个数组内的前三个数字进行累加，OC 中：

	NSArray *arr = @[@1, @2, @3, @4, @5];
	__block NSInteger result = 0;
	[arr enumerateObjectsUsingBlock:^(NSNumber *num, NSUInteger idx, BOOL *stop) {
	    result += [num integerValue];
	    if (idx == 2) {
	        *stop = YES;
	    }
	}];
	
	NSLog(@"%ld", result);
	// 输出：6
	
Swift 中：

	let arr: NSArray = [1,2,3,4,5]
	var result = 0
	arr.enumerateObjectsUsingBlock { (num, idx, stop) -> Void in
	    result += num as! Int
	    if idx == 2 {
	        stop.memory = true
	    }
	}
	print(result)
	// 输出：6	
	
但使用EnumerateGenerator更好：

	result = 0
	for (idx, num) in [1,2,3,4,5].enumerate() {
	    result += num
	    if idx == 2 {
	        break
	    }
	}
	print(result)