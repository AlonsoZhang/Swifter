# Log 输出

在 print 的时候将当前的文件名字和那些必要的信息作为参数同我们的消息一起进行打印：

	func method() {
	    //...
	    print("文件名:Test.swift, 方法名:method，这是一条输出")
	    //...
	}
	
	method()
	//文件名:Test.swift, 方法名:method，这是一条输出
	
在 Swift 中，编译器为我们准备了几个很有用的编译符号，用来处理类似这样的需求，它们分别是：

| 符号 | 类型 | 描述 |
|:-----------:|:-------------:|:----:| 
| #file | String | 包含这个符号的文件的路径 |
| #line | Int | 符号出现处的行号 |
| #column | Int | 符号出现处的列 |
| #function | String | 包含这个符号的方法名字 |

	 func printLog<T>(message: T,
	    file: String = #file,
	    method: String = #function,
	    line: Int = #line)
	{
	    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
	}
	
	// Test.swift
	func method1() {
	    //...
	    printLog("这是一条输出")
	    //...
	}
	
	method1()
	//playground11.swift[23], method1(): 这是一条输出
	
使用条件编译的方法，我们可以添加条件，并设置合适的编译配置，使 printLog 的内容在 Release 时被去掉，从而成为一个空方法：

	func printLogDebug<T>(message: T,
	    file: String = #file,
	    method: String = #function,
	    line: Int = #line)
	{
	    #if DEBUG
	        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
	    #endif
	}
	
	func method2() {
	    //...
	    printLogDebug("这又是一条输出")
	    //...
	}
	
	method2()
	// No Output
