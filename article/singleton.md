# 单例

将 OC 中单例改为 Swift：

	class MyManager1 {
	    class var sharedManager : MyManager1 {
	        struct Static {
	            static var onceToken : dispatch_once_t = 0
	            static var staticInstance : MyManager1? = nil
	        }
	        
	        dispatch_once(&Static.onceToken) {
	            Static.staticInstance = MyManager1()
	        }
	        
	        return Static.staticInstance!
	    }
	}
	
用 let 简化：

	class MyManager2 {
	    private static let sharedInstance = MyManager2()
	    class var sharedManager : MyManager2 {
	        return sharedInstance
	    }
	}
	
Swift1.2之后：

	class MyManager  {
	    static let sharedManager = MyManager()
	    private init() {}
	}
	