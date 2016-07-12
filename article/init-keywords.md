# Designated，Convenience 和 Required

在 Objective-C 中，init 方法是非常不安全的：没有人能保证 init 只被调用一次，也没有人保证在初始化方法调用以后实例的各个变量都完成初始化，甚至如果在初始化里使用属性进行设置的话，还可能会造成各种问题。

一方面，Swift 强化了 designated 初始化方法的地位。Swift 中不加修饰的 init 方法都需要在方法中保证所有非 Optional 的实例变量被赋值初始化，而在子类中也强制 (显式或者隐式地) 调用 super 版本的 designated 初始化，所以无论如何走何种路径，被初始化的对象总是可以完成完整的初始化的。

与 designated 初始化方法对应的是在 init 前加上 convenience 关键字的初始化方法。这类方法是 Swift 初始化方法中的 “二等公民”，只作为补充和提供使用上的方便。

初始化方法永远遵循以下两个原则： 

1. 初始化路径必须保证对象完全初始化，这可以通过调用本类型的 designated 初始化方法来得到保证；
2. 子类的 designated 初始化方法必须调用父类的 designated 方法，以保证父类也完成初始化。

对于某些我们希望子类中一定实现的 designated 初始化方法，我们可以通过添加 required 关键字进行限制，强制子类对这个方法重写实现。