# 属性观察

属性观察 (Property Observers) 是 Swift 中一个很特殊的特性，利用属性观察我们可以在当前类型内监视对于属性的设定，并作出一些响应。Swift 中为我们提供了两个属性观察的方法，它们分别是 willSet 和 didSet。

	class MyClass {
	    
	    let oneYearInSecond: NSTimeInterval = 365 * 24 * 60 * 60
	    
	    var date: NSDate {
	        willSet {
	            let d = date
	            print("即将将日期从 \(d) 设定至 \(newValue)")
	        }
	        
	        didSet {
	            if (date.timeIntervalSinceNow > oneYearInSecond) {
	                print("设定的时间太晚了！")
	                date = NSDate().dateByAddingTimeInterval(oneYearInSecond)
	            }
	            print("已经将日期从 \(oldValue) 设定至 \(date)")
	        }
	    }
	    
	    init() {
	        date = NSDate()
	    }
	}
	
	let foo = MyClass()
	foo.date = foo.date.dateByAddingTimeInterval(60)
	//即将将日期从 2016-07-14 07:26:44 +0000 设定至 2016-07-14 07:27:44 +0000
	//已经将日期从 2016-07-14 07:26:44 +0000 设定至 2016-07-14 07:27:44 +0000
	
	foo.date = foo.date.dateByAddingTimeInterval(100_000_000)
	
	//即将将日期从 2016-07-14 07:36:25 +0000 设定至 2019-09-14 17:23:05 +0000
	//设定的时间太晚了！
	//已经将日期从 2016-07-14 07:36:25 +0000 设定至 2017-07-14 07:35:25 +0000
	
在 Swift 中所声明的属性包括存储属性和计算属性两种。其中存储属性将会在内存中实际分配地址对属性进行存储，而计算属性则不包括背后的存储，只是提供 set 和 get 两种方法。在同一个类型中，属性观察和计算属性是不能同时共存的。

	class A {
	    var number :Int {
	        get {
	            print("get")
	            return 1
	        }
	        
	        set {print("set")}
	    }
	}
	
	class B: A {
	    override var number: Int {
	        willSet {print("willSet")}
	        didSet {print("didSet")}
	    }
	}
	
	let b = B()
	b.number = 0
	
	// 输出
	// get
	// willSet
	// set
	// didSet