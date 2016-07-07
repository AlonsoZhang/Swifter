# 操作符
与 Objective-C 不同，Swift 支持重载操作符这样的特性，最常见的使用方式可能就是定义一些简便的计算了。

	//定义一个二维向量
	struct Vector2D {
	    var x = 0.0
	    var y = 0.0
	}
	
	let v1 = Vector2D(x: 2.0, y: 3.0)
	let v2 = Vector2D(x: 1.0, y: 4.0)
	
	//正常相加
	let v3 = Vector2D(x: v1.x + v2.x, y: v1.y + v2.y)
	// v3 为 {x 3.0, y 7.0}
	
	//重载加号操作符
	func +(left: Vector2D, right: Vector2D) -> Vector2D {
	    return Vector2D(x: left.x + right.x, y: left.y + right.y)
	}
	
	let v4 = v1 + v2
	// v4 为 {x 3.0, y 7.0}

点积运算会报错

	func +* (left: Vector2D, right: Vector2D) -> Double {
	    return left.x * right.x + left.y * right.y
	}

要重新声明

	infix operator +* {
	//infix 表示要定义的是一个中位操作符，即前后都是输入
	associativity none
	//associativity 定义了结合律，即如果多个同类的操作符顺序出现的计算顺序。
	precedence 160
	//运算的优先级，越高的话越优先进行运算。Swift 中乘法和除法的优先级是 150，加法和减法是 140，这里我们定义点积优先级 160，就是说应该早于普通的乘除进行运算。
	}
	
	let result = v1 +* v2
	//输出14.0
	
	