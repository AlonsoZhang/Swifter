# 条件编译

	#if os(OSX)
	    typealias Color = NSColor
	#else
	    typealias Color = UIColor
	#endif
	
	@IBAction func someButtonPressed(sender: AnyObject!) {
	    #if FREE_VERSION
	        // 弹出购买提示，导航至商店等
	    #else
	        // 实际功能
	    #endif
	}
	
在这里我们用 FREE_VERSION 这个编译符号来代表免费版本。为了使之有效，我们需要在项目的编译选项中进行设置，在项目的 Build Settings 中，找到 Swift Compiler - Custom Flags，并在其中的 Other Swift Flags 加上 -D FREE_VERSION 就可以了。