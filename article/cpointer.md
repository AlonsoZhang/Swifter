# COpaquePointer 和 C convention

在 C 中有一类指针，你在头文件中无法找到具体的定义，只能拿到类型的名字，而所有的实现细节都是隐藏的。这类指针在 C 或 C++ 中被叫做不透明指针 (Opaque Pointer)，顾名思义，它的实现和表意对使用者来说是不透明的。

COpaquePointer，它用来表示那些在 Swift 中无法进行类型描述的 C 指针。

COpaquePointer 在 Swift 中扮演的是指针转换的中间人的角色，我们可以通过这个类型在不同指针类型减进行转换。

