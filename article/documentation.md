# 文档注释


对于 Objective-C 来说，文档的自动生成工具有 Apple 标准的 HeaderDoc，以及第三方的 appledoc 或者 Doxygen 等。

	/**
	A demo method
	
	- parameter input: An Int number
	
	- returns: The string represents the input number
	*/
	func method(input: Int) -> String {
	    return String(input)
	}
	
	struct Person {
	    /// name of the person
	    var name: String
	}