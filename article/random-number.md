# 随机数生成

arc4random 是一个非常优秀的随机数算法，并且在 Swift 中也可以使用。它会返回给我们一个任意整数，我们想要在某个范围里的数的话，可以做模运算 (%) 取余数就行了。但是有个陷阱..

Swift 的 Int 是和 CPU 架构有关的：在 32 位的 CPU 上 （也就是 iPhone 5 和前任们），实际上它是 Int32，而在 64 位 CPU (iPhone 5s 及以后的机型) 上是 Int64。

arc4random 所返回的值不论在什么平台上都是一个 UInt32，于是在 32 位的平台上就有一半几率在进行 Int 转换时越界，时不时的崩溃也就不足为奇了。

使用一个 arc4random 的改良版本：

	func arc4random_uniform(_: UInt32) -> UInt32
	
	let diceFaceCount: UInt32 = 6
	let randomRoll = Int(arc4random_uniform(diceFaceCount)) + 1
	print(randomRoll)
	
最佳实践：
	
	func randomInRange(range: Range<Int>) -> Int {
	    let count = UInt32(range.endIndex - range.startIndex)
	    return  Int(arc4random_uniform(count)) + range.startIndex
	}
	
	for _ in 0...100 {
	    print(randomInRange(1...6))
	}