# 输出格式化

C 系语言在字符串格式化输出上，需要通过类似 %d，%f 或者在 Objective-C 中的 %@ 这样的格式在指定的位置设定占位符，然后通过参数的方式将实际要输出的内容补充完整。

OC中：

	int a = 3;
	float b = 1.234567;
	NSString *c = @"Hello";
	NSLog(@"int:%d float:%f string:%@",a,b,c);
	// 输出：
	// int:3 float:1.234567 string:Hello

Swift 中：

	let a = 3;
	let b = 1.234567  // 我们在这里不去区分 float 和 Double 了
	let c = "Hello"
	print("int:\(a) double:\(b) string:\(c)")
	// 输出：
	// int:3 double:1.234567 string:Hello
	
只输出上面的 b 中的小数点后两位，OC 中：

	NSLog(@"float:%.2f",b);
	// 输出：
	// float:1.23
	
Swift 中：

	let format = String(format:"%.2f",b)
	print("double:\(format)")
	// 输出：
	// double:1.23
	
为 Double 写一个扩展：

	extension Double {
	    func format(f: String) -> String {
	        return String(format: "%\(f)f", self)
	    }
	}
	
	let f = ".2"
	print("double:\(b.format(f))")