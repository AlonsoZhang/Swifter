# Swift 命令行工具

Swift 的 REPL (Read-Eval-Print Loop) 环境可以让我们使用 Swift 进行简单的交互式编程。

我们甚至还可以在 .swift 文件最上面加上命令行工具的路径，然后将文件权限改为可执行，之后就可以直接执行这个 .swift 文件了：

	#!/usr/bin/env swift
	print("hello")

	// Terminal
	> chmod 755 hello.swift
	> ./hello.swift
	
	// 输出：
	hello
	
相对于直接用 swift 命令执行，Swift 命令行工具的另一个常用的地方是直接脱离 Xcode 环境进行编译和生成可执行的二进制文件。

	// MyClass.swift
	class MyClass {
	    let name = "XiaoMing"
	    func hello() {
	        print("Hello \(name)")
	    }
	}
	
	// main.swift
	let object = MyClass()
	object.hello()
	
	> swiftc MyClass.swift main.swift

将生成一个名叫 main 的可执行文件。运行之：

	> ./main
	// 输出：
	// Hello XiaoMing
	
swift --help 以及 swiftc --help 来查看具体还有哪些参数可以使用。