# 类簇

简单来说类簇就是使用一个统一的公共的类来订制单一的接口，然后在表面之下对应若干个私有类进行实现的方式。

类簇在子类种类繁多，但是行为相对统一的时候对于简化接口非常有帮助。

类簇在 Objective-C 中实现起来也很自然，在所谓的“初始化方法”中将 self 进行替换，根据调用的方式或者输入的类型，返回合适的私有子类对象就可以了。

对于 Swift 中的类簇构建，一种有效的方法是使用工厂方法来进行。

	class Drinking {
	    typealias LiquidColor = UIColor
	    var color: LiquidColor {
	        return LiquidColor.clearColor()
	    }
	    
	    class func drinking(name: String) -> Drinking {
	        var drinking: Drinking
	        switch name {
	        case "Coke":
	            drinking = Coke()
	        case "Beer":
	            drinking = Beer()
	        default:
	            drinking = Drinking()
	        }
	        
	        return drinking
	    }
	}
	
	class Coke: Drinking {
	    override var color: LiquidColor {
	        return LiquidColor.blackColor()
	    }
	}
	
	class Beer: Drinking {
	    override var color: LiquidColor {
	        return LiquidColor.yellowColor()
	    }
	}
	
	let coke = Drinking.drinking("Coke")
	coke.color // Black
	
	let beer = Drinking.drinking("Beer")
	beer.color // Yellow
	
通过获取对象类型中提到的方法，我们也可以确认 coke 和 beer 各自的动态类型分别是 Coke 和 Beer。
	
	let cokeClass = NSStringFromClass(coke.dynamicType) //Coke
	
	let beerClass = NSStringFromClass(beer.dynamicType) //Beer
