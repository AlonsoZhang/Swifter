# delegate

	protocol MyClassDelegate {
	    func method()
	}
	
	class MyClass {
	    weak var delegate: MyClassDelegate?
	}
	
	class ViewController: UIViewController, MyClassDelegate {
	    // ...
	    var someInstance: MyClass!
	    
	    override func viewDidLoad() {
	        super.viewDidLoad()
	        
	        someInstance = MyClass()
	        someInstance.delegate = self
	    }
	    
	    func method() {
	        print("Do something")
	    }
	    
	    //...
	}

	// weak var delegate: MyClassDelegate? 编译错误
	// 'weak' cannot be applied to non-class type 'MyClassDelegate'
	
这是因为 Swift 的 protocol 是可以被除了 class 以外的其他类型遵守的，而对于像 struct 或是 enum 这样的类型，本身就不通过引用计数来管理内存，所以也不可能用 weak 这样的 ARC 的概念来进行修饰。

做法一：

	@objc protocol MyClassDelegate {
	    func method()
	}
	
做法二：

	protocol MyClassDelegate: class {
	    func method()
	}