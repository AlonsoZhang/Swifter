# 闭包歧义

Swift 的闭包写法很多，但是最正规的应该是完整地将闭包的输入和输出都写上，然后用 in 关键字隔离参数和实现。

	extension Int {
	    func times(f: Int -> ()) {
	        print("Int")
	        for i in 1...self {
	            f(i)
	        }
	    }
	}
	
	3.times { (i: Int) -> () in
	    print(i)
	}
	// 输出：
	// Int
	// 1
	// 2
	// 3
	
将这个闭包的调用进行简化：

	3.times { i in
	    print(i)
	}
	// 输出：
	// Int
	// 1
	// 2
	// 3
	
为了增强可读性和安全性，最直接是在调用时尽量指明闭包参数的类型。