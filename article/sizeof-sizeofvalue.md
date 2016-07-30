# sizeof 和 sizeofValue

在从一个数组生成 NSData 的时候需要传入数据长度，OC 中：

	char bytes[] = {1, 2, 3};
	NSData *data = [NSData dataWithBytes:&bytes length:sizeof(bytes)];
	// <010203>
	
C 中的 sizeof 有两个版本，既可以接受类型，也可以接受某个具体的值：

	sizeof(int)
	sizeof(a)
	
	// C
	char bytes[] = {1, 2, 3};
	sizeof(bytes);
	// 3
	
	// Swift
	var bytes: [CChar] = [1,2,3]
	sizeofValue(bytes)
	// 8

Swift 等效代码：

	var bytes: [CChar] = [1,2,3]
	let data = NSData(bytes: &bytes, length:sizeof(CChar) * bytes.count)
