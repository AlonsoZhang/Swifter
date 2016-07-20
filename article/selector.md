# Selector

@selector 是 Objective-C 时代的一个关键字，它可以将一个方法转换并赋值给一个 SEL 类型，它的表现很类似一个动态的函数指针。

	-(void) callMe {
	    //...
	}
	
	-(void) callMeWithParam:(id)obj {
	    //...
	}
	
	SEL someMethod = @selector(callMe);
	SEL anotherMethod = @selector(callMeWithParam:);
	
	// 或者也可以使用 NSSelectorFromString
	// SEL someMethod = NSSelectorFromString(@"callMe");
	// SEL anotherMethod = NSSelectorFromString(@"callMeWithParam:");
	
Swift2.2:

	func callMe() {
	    //...
	}
	
	func callMeWithParam(obj: AnyObject!) {
	    //...
	}
	
	let someMethod = #selector(callMe)
	let anotherMethod = #selector(callMeWithParam(_:))
	
多个参数名：

	func turnByAngle(theAngle: Int, speed: Float) {
	    //...
	}
	let method = #selector(turnByAngle(_:speed:))