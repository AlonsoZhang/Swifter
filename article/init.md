# 初始化方法顺序

Swift 的初始化方法需要保证类型的所有属性都被初始化。

我们需要保证在当前子类实例的成员初始化完成后才能调用父类的初始化方法：

	class Cat1 {
	    var name: String
	    init() {
	        name = "cat"
	    }
	}
	
	class Tiger1: Cat1 {
	    let power: Int
	    override init() {
	        power = 10
	        // 如果我们不需要打改变 name 的话，
	        // 虽然我们没有显式地对 super.init() 进行调用
	        // 不过由于这是初始化的最后了，Swift 替我们自动完成了
	    }
	}
	
	let cat = Cat1()
	
	let tiger = Tiger1()
	
	