# AnyClass，元类型和 .self

	public typealias AnyClass = AnyObject.Type
	
通过 AnyObject.Type 这种方式所得到是一个元类型 (Meta)。

AnyClass 所表达的东西就是任意类型本身。

	class A {
	    class func method() {
	        print("Hello")
	    }
	}
	
	let typeA: A.Type = A.self
	typeA.method()
	
	// 或者
	let anyClass: AnyClass = A.self
	(anyClass as! A.Type).method()
	
将这些元类型存入数组并且传递给别的方法来进行配置这一点上，元类型编程就很难被替代了：

	let usingVCTypes: [AnyClass] = [MusicViewController.self,
	    AlbumViewController.self]
	
	func setupViewControllers(vcTypes: [AnyClass]) {
	    for vcType in vcTypes {
	        if vcType is UIViewController.Type {
	            let vc = (vcType as! UIViewController.Type).init()
	            print(vc)
	        }
	    }
	}
	
	setupViewControllers(usingVCTypes)

