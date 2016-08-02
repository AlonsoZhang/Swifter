# Playground 与项目协作

1. Playground 必须加入到项目之中，单独的 Playground 是不能使用项目中的已有代码的。
2. 想要使用的代码必须是通过 Cocoa (Touch) Framework 以一个单独的 target 的方式进行组织的。
3. 编译结果的位置需要保持默认位置，即在 Xcode 设置中的 Locations 里 Derived Data 保持默认值。
4. 如果是 iOS 应用，这个框架必须已经针对 iPhone 5s Simulator 这样的 64 位的模拟器作为目标进行过编译。

在满足这些条件后，你就可以在 Playground 中通过 import 你的框架 module 名字来导入代码，然后进行使用了。