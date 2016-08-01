# fatalError

OC中：

	let array: NSArray = [1,2,3]
	array[100]
	// 输出:
	// *** Terminating app due to uncaught exception 'NSRangeException',
	// reason: '*** -[__NSArrayI objectAtIndex:]:
	// index 100 beyond bounds [0 .. 2]
	
Swift 中：

	let array = [1,2,3]
	array[100]
	// 输出:
	// fatal error: Array index out of range
	
在调试时我们可以使用断言来排除类似这样的问题，但是断言只会在 Debug 环境中有效，而在 Release 编译中所有的断言都将被禁用。在遇到确实因为输入的错误无法使程序继续运行的时候，我们一般考虑以产生致命错误 (fatalError) 的方式来终止程序。

	enum MyEnum {
	    case Value1,Value2,Value3
	}
	
	
	func check(someValue: MyEnum) -> String {
	    switch someValue {
	    case .Value1:
	        return "OK"
	    case .Value2:
	        return "Maybe OK"
	    default:
	        // 这个分支没有返回 String，也能编译通过
	        fatalError("Should not show!")
	    }
	}
	
	class MyClass {
	    func methodMustBeImplementedInSubclass() {
	        fatalError("这个方法必须在子类中被重写")
	    }
	}
	
	class YourClass: MyClass {
	    override func methodMustBeImplementedInSubclass() {
	        print("YourClass 实现了该方法")
	    }
	}
	
	class TheirClass: MyClass {
	    func someOtherMethod() {
	        
	    }
	}
	
	YourClass().methodMustBeImplementedInSubclass()
	// YourClass 实现了该方法
	
	TheirClass().methodMustBeImplementedInSubclass()
	// 这个方法必须在子类中被重写
	