# C 代码调用和 @asmname

如果我们导入了 Darwin 的 C 库的话，我们就可以在 Swift 中无缝地使用 Darwin 中定义的 C 函数了。

	import Darwin
	
而对于第三方的 C 代码，Swift 也提供了协同使用的方法。同调用 OC，将 C 代码的头文件在桥接的头文件中进行导入：

	//test.h
	int test(int a);
	
	//test.c
	int test(int a) {
	    return a + 1;
	}
	
	//Module-Bridging-Header.h
	#import "test.h"
	
	//File.swift
	func testSwift(input: Int32) {
	    let result = test(input)
	    print(result)
	}
	
	testSwift(1)
	// 输出：2
	
使用@asmname，不需要借助头文件和 Bridging-Header 来导入 C 函数：

	//File.swift
	//将 C 的 test 方法映射为 Swift 的 c_test 方法
	@asmname("test") func c_test(a: Int32) -> Int32
	
	func testSwift(input: Int32) {
	    let result = c_test(input)
	    print(result)
	}
	
	testSwift(1)
	// 输出：2

除了作为非头文件方式的导入之外，@asmname 还承担着和 @objc 的 “重命名 Swift 中类和方法名字” 类似的任务，这可以将 C 中不认可的 Swift 程序元素字符重命名为 ascii 码，以便在 C 中使用。