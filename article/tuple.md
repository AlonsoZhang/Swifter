# 多元组 (Tuple)

交换输入，普通写法：

	func swapMe<T>(inout a: T, inout b: T) {
	    let temp = a
	    a = b
	    b = temp
	}
	
文艺写法：

	func swapMe<T>(inout a: T, inout b: T) {
	    (a,b) = (b,a)
	}
	
CGRect 有一个辅助方法叫做 CGRectDivide，它用来将一个 CGRect 在一定位置切分成两个区域。

使用多元组的方式来同时返回被分割的部分和剩余部分。

	let rect = CGRectMake(0, 0, 100, 100)
	let (small, large) = rect.divide(20, fromEdge: .MinXEdge)
	
	//决定哪条边哪个轴
	case MinXEdge
	case MinYEdge
	case MaxXEdge
	case MaxYEdge