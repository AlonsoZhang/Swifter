# 接口和类方法中的 Self

Self 出现在类型位置上，接受实现该接口的自身的类型，并返回一个同样的类型。

Self 不仅指代的是实现该接口的类型本身，也包括了这个类型的子类。

dynamicType，这里我们就可以使用它来做初始化，以保证方法与当前类型上下文无关，这样不论是 MyClass 还是它的子类，都可以正确地返回合适的类型满足 Self 的要求。

	class MyClass: Copyable {
	    
	    var num = 1
	    
	    func copy() -> Self {
	        let result = self.dynamicType.init()
	        result.num = num
	        return result
	    }
	    
	    required init() {
	        
	    }
	}
	
	let object = MyClass()
	object.num = 100
	
	let newObject = object.copy()
	object.num = 1
	
	print(object.num)     // 1
	print(newObject.num)  // 100