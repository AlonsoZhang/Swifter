# default 参数

Swift 的方法是支持默认参数的，也就是说在声明方法时，可以给某个参数指定一个默认使用的值。在调用该方法时要是传入了这个参数，则使用传入的值，如果缺少这个输入参数，那么直接使用设定的默认值进行调用。

	func sayHello1(str1: String = "Hello", str2: String, str3: String) {
	    print(str1 + str2 + str3)
	}
	
	func sayHello2(str1: String, str2: String, str3: String = "World") {
	    print(str1 + str2 + str3)
	}
	
	sayHello1(str2: " ", str3: "World")
	sayHello2("Hello", str2: " ")
	
	//输出都是 Hello World