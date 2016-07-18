# lazy 修饰符和 lazy 方法

延时加载或者说延时初始化。

OC 中：

	// ClassA.h
	@property (nonatomic, copy) NSString *testString;
	
	// ClassA.m
	- (NSString *)testString {
	     if (!_testString) {
	         _testString = @"Hello";
	        NSLog(@"只在首次访问输出");
	     }
	     return _testString;
	}
	
Swift 中：

	class ClassA {
	    lazy var str: String = {
	        let str = "Hello"
	        print("只在首次访问输出")
	        return str
	    }()
	}
	
在使用 lazy 作为属性修饰符时，只能声明属性是变量。另外我们需要显式地指定属性类型，并使用一个可以对这个属性进行赋值的语句来在首次访问属性时运行。

	//简便写法：
	lazy var str: String = "Hello”
	
例子：

	let data1 = 1...3
	let result1 = data1.map {
	    (i: Int) -> Int in
	    print("正在处理 \(i)")
	    return i * 2
	}
	
	print("准备访问结果")
	for i in result1 {
	    print("操作后结果为 \(i)")
	}
	
	print("操作完毕")

	//正在处理 1
	//正在处理 2
	//正在处理 3
	//准备访问结果
	//操作后结果为 2
	//操作后结果为 4
	//操作后结果为 6
	//操作完毕
	
	let data2 = 1...3
	let result2 = data2.lazy.map {
	    (i: Int) -> Int in
	    print("正在处理 \(i)")
	    return i * 2
	}
	
	print("准备访问结果")
	for i in result2 {
	    print("操作后结果为 \(i)")
	}
	
	print("操作完毕")
	
	//准备访问结果
	//正在处理 1
	//操作后结果为 2
	//正在处理 2
	//操作后结果为 4
	//正在处理 3
	//操作后结果为 6
	//操作完毕