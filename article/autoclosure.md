# @autoclosure 和 ??

@autoclosure 做的事情就是把一句表达式自动地封装成一个闭包 (closure)。

	func logIfTrue(predicate: () -> Bool) {
	    if predicate() {
	        print("True")
	    }
	}
	//调用时
	logIfTrue({return 2 > 1}

在 Swift 中对闭包的用法可以进行一些简化，在这种情况下我们可以省略掉 return。

	 logIfTrue({2 > 1})
	 
因为这个闭包是最后一个参数，所以可以使用尾随闭包 (trailing closure) 的方式把大括号拿出来，然后省略括号。

	logIfTrue{2 > 1}
	
在参数名前面加上 @autoclosure 关键字：
	
	func logIfTrue2(@autoclosure predicate: () -> Bool) {
    	if predicate() {
       		print("2True")
    	}
    }
    
然后就可以直接写：
    
    logIfTrue2(2 > 1)
    
    
??操作符可以判断输入并在当左侧的值是非 nil 的 Optional 值时返回其 value，当左侧是 nil 时返回右侧的值。

	func ??<T>(optional: T?, @autoclosure defaultValue: () -> T) -> T {
	    switch optional {
	        case .Some(let value):
	            return value
	        case .None:
	            return defaultValue()
	        }
	}
	
&& 和 ||
	
	public func ||<T : BooleanType>(lhs: T, @autoclosure rhs: () throws -> Bool) rethrows -> Bool
	
	public func &&<T : BooleanType>(lhs: T, @autoclosure rhs: () throws -> Bool) rethrows -> Bool