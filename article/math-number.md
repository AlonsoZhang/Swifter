# 数学和数字

计算周长：

	func circlePerimeter(radius: Double) -> Double {
	    return 2 * M_PI * radius
	}
	
计算三角函数：

	func yPosition(dy: Double, angle: Double) -> Double {
	    return dy * tan(angle)
	}
	
infinity 代表无穷，它是类似 1.0 / 0.0 这样的数学表达式的结果，代表数学意义上的无限大。

	1.797693134862315e+308 < Double.infinity  // true
	1.797693134862316e+308 < Double.infinity  // false
	
NaN，它是 “Not a Number” 的简写，可以用来表示某些未被定义的或者出现了错误的运算。

	let a = 0.0 / 0.0
	let b = sqrt(-1.0)
	let c = 0.0 * Double.infinity
	
用判定自身是否与自己相等的方式就可以判定一个量是不是 NaN 了。

	let num = Double.NaN
	if num == num {
	    print("Num is \(num)")
	} else {
	    print("NaN")
	}
	
	// 输出：
	// NaN
	
使用 Double 的 isNaN 或者 Darwin 中的 isnan 来判断：

	if num.isNaN {
	    print("NaN")
	}
	
	if isnan(num) {
	    print("NaN")
	}
	
	// 输出：
	// NaN
	// NaN
	
	