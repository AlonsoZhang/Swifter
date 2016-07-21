# 实例方法的动态调用

生成 MyClass 的实例，然后用 .method 来调用它：

	class MyClass {
	    func method(number: Int) -> Int {
	        return number + 1
	    }
	}
	
	let object = MyClass()
	let result = object.method(1)
	// result = 2
	
改写为：

	let f = MyClass.method
	let object1 = MyClass()
	let result1 = f(object)(1)
	
有类型方法的名字冲突时：
	
	class MyClass1 {
	    func method(number: Int) -> Int {
	        return number + 1
	    }
	    
	    class func method(number: Int) -> Int {
	        return number
	    }
	}

如果不加改动，MyClass.method 将取到的是类型方法。

显式地加上类型声明加以区别：

	let f1 = MyClass1.method
	// class func method 的版本
	
	let f2: Int -> Int = MyClass1.method
	// 和 f1 相同
	
	let f3: MyClass1 -> Int -> Int = MyClass1.method
	// func method 的柯里化版本