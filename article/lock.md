# Lock

如果我们有一个方法接受参数，需要这个方法是线程安全的话，就需要在参数上加锁：

	- (void)myMethod:(id)anObj {
	    @synchronized(anObj) {
	        // 在括号内 anObj 不会被其他线程改变
	    }
	}
	
在 Swift 中，如果我们忽略掉那些异常的话，我们想要 lock 一个变量的话，可以这样写：

	func myMethod(anObj: AnyObject!) {
	    objc_sync_enter(anObj)
	    
	    // 在 enter 和 exit 之间 anObj 不会被其他线程改变
	    
	    objc_sync_exit(anObj)
	}
	
	func synchronized(lock: AnyObject, closure: () -> ()) {
	    objc_sync_enter(lock)
	    closure()
	    objc_sync_exit(lock)
	}
	
	func myMethodLocked(anObj: AnyObject!) {
	    synchronized(anObj) {
	        // 在括号内 anObj 不会被其他线程改变
	    }
	}