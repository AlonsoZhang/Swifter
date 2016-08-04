# 尾递归

使用递归求和：

	func sum(n: UInt) -> UInt {
	    if n == 0 {
	        return 0
	    }
	    return n + sum(n - 1)
	}
	
	sum(4)
	sum(100)
	
但数字太大会崩溃：

	sum(1000000)
	// EXC_BAD_ACCESS (code=2, address=...)
	
原因是栈溢出了。
	
	func tailSum(n: UInt) -> UInt {
	    func sumInternal(n: UInt, current: UInt) -> UInt {
	        if n == 0 {
	            return current
	        } else {
	            return sumInternal(n - 1, current: current + n)
	        }
	    }
	    
	    return sumInternal(n, current: 0)
	}
	tailSum(1000000)
	
在 Debug 模式下 Swift 编译器并不会对尾递归进行优化。我们可以在 scheme 设置中将 Run 的配置从 Debug 改为 Release，这段代码就能正确运行了。