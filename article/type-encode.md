# 类型编码 @encode

在 Objective-C 中 @encode 使用起来很简单，通过传入一个类型，我们就可以获取代表这个类型的编码 C 字符串：

	char *typeChar1 = @encode(int32_t);
	char *typeChar2 = @encode(NSArray);
	// typeChar1 = "i", typeChar2 = "{NSArray=#}
	
Swift 中：
	
	let int: Int = 0
	let float: Float = 0.0
	let double: Double = 0.0
	
	let intNumber: NSNumber = int
	let floatNumber: NSNumber = float
	let doubleNumber: NSNumber = double
	String.fromCString(intNumber.objCType)
	String.fromCString(floatNumber.objCType)
	String.fromCString(doubleNumber.objCType)
	
	// 结果分别为：
	// {Some "q"}
	// {Some "f"}
	// {Some "d"}
	// 注意，fromCString 返回的是 `String?`

对于像其他一些可以转换为 NSValue 的类型，我们也可以通过同样的方式获取类型编码，一般来说这些类型会是某些 struct，因为 NSValue 设计的初衷就是被作为那些不能直接放入 NSArray 的值的容器来使用的：

	let p = NSValue(CGPoint: CGPointMake(3, 3))
	String.fromCString(p.objCType)
	// {Some "{CGPoint=dd}"}
	
	let t = NSValue(CGAffineTransform: CGAffineTransformIdentity)
	String.fromCString(t.objCType)
	// {Some "{CGAffineTransform=dddddd}"}

