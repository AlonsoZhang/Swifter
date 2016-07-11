# 命名空间

在 Swift 中，由于可以使用命名空间了，即使是名字相同的类型，只要是来自不同的命名空间的话，都是可以和平共处的。

	// MyFramework.swift
	// 这个文件存在于 MyFramework.framework 中
	public class MyClass {
	    public class func hello() {
	        print("hello from framework")
	    }
	}
	
	// MyApp.swift
	// 这个文件存在于 app 的主 target 中
	class MyClass {
	    class func hello() {
	        print("hello from app")
	    }
	}
	
在使用时，如果出现可能冲突的时候，我们需要在类型名称前面加上 module 的名字 (也就是 target 的名字)：

	MyClass.hello()
	// hello from app
	
	MyFramework.MyClass.hello()
	// hello from framework
	
另一种策略是使用类型嵌套的方法来指定访问的范围。常见做法是将名字重复的类型定义到不同的 struct 中，以此避免冲突。这样在不使用多个 module 的情况下也能取得隔离同样名字的类型的效果：

	struct MyClassContainer1 {
	    class MyClass {
	        class func hello() {
	            print("hello from MyClassContainer1")
	        }
	    }
	}
	
	struct MyClassContainer2 {
	    class MyClass {
	        class func hello() {
	            print("hello from MyClassContainer2")
	        }
	    }
	}
	
使用时：

	MyClassContainer1.MyClass.hello()
	MyClassContainer2.MyClass.hello()