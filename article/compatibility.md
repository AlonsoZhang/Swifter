# 兼容性

Apple 通过将一个最小化的运行库集成打包到 app 中这样的方式来解决兼容性的问题。使用了 Swift 语言的项目在编译时会在 app 包中带有这一套运行时环境，并在启动时加载这些 dylib 包作为 Swift 代码的运行环境。

Xcode 会在编译 app 时判断在当前项目中是否含有 Swift 文件，如果存在的话，将自动为我们把运行时的 dylib 复制到 app 包中。

有些情况需要手动将项目 app target 的编译设置中 Build Options 下的 Embedded Content Contains Swift Code 设置为 Yes，以确保 Swift 的运行库被打包进 app 中。

