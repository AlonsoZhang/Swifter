# 可选接口和接口扩展

Objective-C 中的 protocol 里存在 @optional 关键字，被这个关键字修饰的方法并非必须要被实现。

原生的 Swift protocol 里没有可选项，所有定义的方法都是必须实现的。如果我们想要像 Objective-C 里那样定义可选的接口方法，就需要将接口本身定义为 Objective-C 的，也即在 protocol 定义之前加上 @objc。

