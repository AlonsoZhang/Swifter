# 隐式解包 Optional

在声明的时候，我们可以通过在类型后加上一个感叹号 (!) 这个语法糖来告诉编译器我们需要一个可以隐式解包的 Optional 值：

	var maybeObject: MyClass!
	
	