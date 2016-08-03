# 属性访问控制

Swift 中由低至高提供了 private，internal 和 public 三种访问控制的权限。

在 target 外只能调用到 public 的代码。

即使是两个毫不相关的类型，只要被写在同一个文件中，那么这个文件里的 private 就可以被相互访问到。

在类型中的属性默认情况下：

	class MyClass {
	    var name: String?
	}
	
可以在同一 module 中随意地读取或者设置这个变量。

对于那些我们只希望在当前文件中使用的属性来说，在声明前面加上 private 使其变为私有：

	class MyClass {
	    private var name: String?
	}

在类型之外也能够读取到这个类型，同时为了保证类型的封装和安全，只能在类型内部对其进行改变和设置。

将读取和设置的控制权限分开：
 
	class MyClass {
	    private(set) var name: String?
	}
	
因为 set 被限制为了 private，我们就可以保证 name 只会在当前文件被更改。

这种写法没有对读取做限制，相当于使用了默认的 internal 权限。

属性的访问控制可以通过两次的访问权限指定来实现。

	public class MyClass {
	    public private(set) var name: String?
	}
	
	