# final

final 关键字可以用在 class，func 或者 var 前面进行修饰，表示不允许对该内容进行继承或者重写操作。

给一段代码加上 final 就意味着编译器向你作出保证，这段代码不会再被修改；同时，这也意味着你认为这段代码已经完备并且没有再被进行继承或重写的必要，因此这往往会是一个需要深思熟虑的决定。

一般来说，不希望被继承和重写会有这几种情况：

1. 类或者方法的功能确实已经完备了。
2. 子类继承和修改是一件危险的事情。
3. 为了父类中某些代码一定会被执行。
4. 性能考虑。


		class Parent {
	    	final func method() {
		        print("开始配置")
		        // ..必要的代码
		        
		        methodImpl()
		        
		        // ..必要的代码
		        print("结束配置")
	    	}
	    
	    	func methodImpl() {
	       	 	fatalError("子类必须实现这个方法")
	        	// 或者也可以给出默认实现
	    	}
		}
	
		class Child: Parent {
	    override func methodImpl() {
	        //..子类的业务逻辑
	        print("Setup in Child")
	    	}
		}
	
		let c = Child()
		c.method()
	
		//输出
		//开始配置
		//Setup in Child
		//结束配置