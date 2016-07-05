# 将 protocol 的方法声明为 mutating

Swift中protocol的功能比OC中强大很多，不仅能再class中实现，同时也适用于struct、enum。

使用 mutating 关键字修饰方法是为了能在该方法中修改 struct 或是 enum 的变量。

如果将ExampleProtocol中修饰方法的mutating去掉，编译器会报错说没有实现protocol。如果将struct中的mutating去掉，则会报错不能改变结构体的成员。