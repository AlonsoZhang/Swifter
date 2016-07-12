# 可变参数函数

OC中用 [NSString StringWithFormat:%@]

但是这一切在 Swift 中得到了前所未有的简化。现在，写一个可变参数的函数只需要在声明参数时在类型后面加上 ... 就可以了。

	func sum(input: Int...) -> Int {
	    return input.reduce(0, combine: +)
	}
	// 输出：15
	print(sum(1,2,3,4,5))
	

	
	func myFunc(numbers: Int..., string: String) {
	    numbers.forEach {
	        for i in 0..<$0 {
	            print("\(i + 1): \(string)")
	        }
	    }
	}
	
	myFunc(1, 2, 3, string: "hello")
	
	let name = "Tom"
	let date = NSDate()
	let string = NSString(format: "Hello %@. Date: %@", name, date)