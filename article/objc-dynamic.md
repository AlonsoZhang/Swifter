# @objc 和 dynamic

通过添加 {product-module-name}-Bridging-Header.h 文件，并在其中填写想要使用的头文件名称，我们就可以很容易地在 Swift 中使用 Objective-C 代码了。

OC导入 Swift：

	@import MySwiftKit;
	
如果想要在 Objective-C 里使用的是同一个项目中的 Swift 的源文件的话，可以直接导入自动生成的头文件 {product-module-name}-Swift.h 来完成。

在 Swift 类型文件中，我们可以将需要暴露给 Objective-C 使用的任何地方 (包括类，属性和方法等) 的声明前面加上 @objc 修饰符。

	import Foundation
	
	@objc(MyClass)
	class 我的类: NSObject {
	    @objc(greeting:)
	    func 打招呼(名字: String) {
	        print("哈喽，\(名字)")
	    }
	}
	
	我的类().打招呼("小明")
	
	