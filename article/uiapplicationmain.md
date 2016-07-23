# @UIApplicationMain

Xcode 将帮我们准备好一个 main.m 文件，其中就有这个 main 函数：

	int main(int argc, char * argv[])
	{
	    @autoreleasepool {
	        return UIApplicationMain(argc, argv, nil,
	                   NSStringFromClass([AppDelegate class]));
	    }
	}

这个方法将根据第三个参数初始化一个 UIApplication 或其子类的对象并开始接收事件 (在这个例子中传入 nil，意味使用默认的 UIApplication)。

Swift 中唯一和 main 有关系的是在默认的 AppDelegate 类的声明上方有一个 @UIApplicationMain 的标签。

比如我们在删除 @UIApplicationMain 后，在项目中添加一个 main.swift 文件。

	import UIKit
	
	class MyApplication: UIApplication {
	    override func sendEvent(event: UIEvent!) {
	        super.sendEvent(event)
	        print("Event sent: \(event)");
	    }
	}
	
	UIApplicationMain(Process.argc, Process.unsafeArgv,
	    NSStringFromClass(MyApplication), NSStringFromClass(AppDelegate))
    
每次发送事件 (比如点击按钮) 时，都可以监听到这个事件。