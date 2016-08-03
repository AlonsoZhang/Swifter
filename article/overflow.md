# 溢出

	class MyClass {
	    var a: Int = 1
	    func method() {
	        a = a * 100000
	        a = a * 100000
	        a = a * 100000
	        print(a)
	    }
	}
	
	MyClass().method()
	
	// 64 位环境 (iPhone 5s 及以上)
	// 1,000,000,000,000,000
	
	// 32 位环境 (iPhone 5c 及以下)
	// 崩溃
	
 32 位的 Int 的最大值为 2,147,483,647。
 
 Swift 在溢出的时候选择了让程序直接崩溃而不是截掉超出的部分。
 
 在编译的时候就发现某些必然的错误：
 
	 func method() {
	    var max = Int.max
	    max = max + 1
	}
	
在 Swift 中，我们可以使用以下这五个带有 & 的操作符，这样 Swift 就会忽略掉溢出的错误：

* 溢出加法 (&+)
* 溢出减法 (&-)
* 溢出乘法 (&*)
* 溢出除法 (&/)
* 溢出求模 (&%)

var max = Int.max
max = max &+ 1

// 64 位系统下
// max = -9,223,372,036,854,775,808