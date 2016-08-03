# 宏定义 define

Swift 中没有宏定义了。

Swift 中将宏定义彻底从语言中拿掉了，并且 Apple 给了我们一些替代的建议：

* 使用合适作用范围的 let 或者 get 属性来替代原来的宏定义值：

		var M_PI: Double { get } /* pi */
	
* 对于宏定义的方法，类似地在同样作用域写为 Swift 方法。

		// objc
		#define NSLocalizedString(key, comment) \
		[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]
		
		// Swift
		func NSLocalizedString(
		    key: String,
		    tableName: String? = default,
		    bundle: NSBundle = default,
		    value: String = default,
		    comment: String) -> String
		    
* 随着 #define 的消失，像 #ifdef 这样通过宏定义是否存在来进行条件判断并决定某些代码是否参与编译的方式也消失了。但是我们仍然可以使用 #if 并配合编译的配置来完成条件编译。

