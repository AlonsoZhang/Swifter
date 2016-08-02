# 安全的资源组织方式

iOS 开发中有很多使用字符串来指定某个资源的用法。

	let image = UIImage(name: "my_image")
	
	performSegueWithIdentifier("my_segue", sender: self)

非常容易出现由于代码中的资源名字没有更新而使得运行时出现错误的问题。

在 Objective-C 时代，我们一般通过宏定义来缓解这个问题。通过将资源名字设置为宏定义，这样就可以在相对集中的地方来管理和修改它们。

在 Swift 中是没有宏定义的，取而代之，我们可以灵活地使用 rawValue 为 String 的 enum 类型来字符串，然后通过为资源类型添加合适的 extension 来让编译器帮助我们在资源名称修改时能在代码中作为对应的改变。

	enum ImageName: String {
	    case MyImage = "my_image"
	}
	
	enum SegueName: String {
	    case MySegue = "my_segue"
	}
	
	extension UIImage {
	    convenience init!(imageName: ImageName) {
	        self.init(named: imageName.rawValue)
	    }
	}
	
	extension UIViewController {
	    func performSegueWithSegueName(segueName: SegueName, sender: AnyObject?) {
	        performSegueWithIdentifier(segueName.rawValue, sender: sender)
	    }
	}
	
	let image = UIImage(imageName: .MyImage)
	
	performSegueWithSegueName(.MySegue, sender: self)