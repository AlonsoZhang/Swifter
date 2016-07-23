# 内存管理，weak 和 unowned

Swift 是自动管理内存的，这也就是说，我们不再需要操心内存的申请和分配。

Swift 会替我们管理和分配内存。而释放的原则遵循了自动引用计数 (ARC) 的规则：当一个对象没有引用的时候，其内存将会被自动回收。

循环引用：

	class A {
	    let b: B
	    init() {
	        b = B()
	        b.a = self
	    }
	
	    deinit {
	        print("A deinit")
	    }
	}
	
	class B {
	    var a: A? = nil
	    deinit {
	        print("B deinit")
	    }
	}

在 Swift 里防止循环引用：

	class B {
	    weak var a: A? = nil
	    deinit {
	        print("B deinit")
	    }
	}

在 var a 前面加上了 weak，向编译器说明我们不希望持有 a。

日常工作中一般使用弱引用的最常见的场景有两个：

* 设置 delegate 时
* 在 self 属性存储为闭包时，其中拥有对self 引用时

