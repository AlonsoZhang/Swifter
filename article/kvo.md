# KVO

KVO (Key-Value Observing) 

由于 Swift 为了效率，默认禁用了动态派发，因此想用 Swift 来实现 KVO，我们还需要做额外的工作，那就是将想要观测的对象标记为 dynamic。

	class MyClass: NSObject {
	    dynamic var date = NSDate()
	}
	
	class MyClass1: NSObject {
	    var date = NSDate()
	}
	
	class MyChildClass: MyClass1 {
	    dynamic override var date: NSDate {
	        get { return super.date }
	        set { super.date = newValue }
	    }
	}
	
	private var myContext = 0
	
	class Class: NSObject {
	    
	    var myObject: MyClass!
	    
	    override init() {
	        super.init()
	        myObject = MyClass()
	        print("初始化 MyClass，当前日期: \(myObject.date)")
	        myObject.addObserver(self,
	            forKeyPath: "date",
	            options: .New,
	            context: &myContext)
	        
	        delay(3) {
	            self.myObject.date = NSDate()
	        }
	    }
	    
	    override func observeValueForKeyPath(keyPath: String?,
	            ofObject object: AnyObject?,
	            change: [String : AnyObject]?,
	            context: UnsafeMutablePointer<Void>)
	    {
	        if let change = change where context == &myContext {
	            let a = change[NSKeyValueChangeNewKey]
	            print("日期发生变化 \(a)")
	        }
	    }
	}
	
	let obj = Class()

