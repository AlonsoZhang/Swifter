# func 的参数修饰

在声明一个 Swift 的方法的时候，我们一般不去指定参数前面的修饰符，而是直接声明参数：

	func incrementor1(variable: Int) -> Int {
	    return variable + 1
	}
	
默认为 let，所以会编译失败
	func incrementor(let variable: Int) -> Int {
	    return ++variable
	}
	
	
虽然我们将参数写作 var 后，在 Swift 2.2 中代码是可以通过编译并正确工作的，然而这将触发警告。在输入参数上添加 var 的做法已经被废弃了。

	func incrementor2(variable: Int) -> Int {
		    var num = variable
		    num += 1
		    return num
	}
	
在方法内部直接修改输入的值，可以使用 inout 来对参数进行修饰：

	func incrementor3(inout variable: Int) {
	    variable += 1
	}
	
	luckyNumber = 7
	incrementor3(&luckyNumber)
	
	print(luckyNumber) //输出8
	
外层的 makeIncrementor 的返回里也需要在参数的类型前面明确指出修饰词，以符合内部的定义，否则将无法编译通过。

	func makeIncrementor(addNumber: Int) -> ((inout Int) -> ()) {
    func incrementor(inout variable: Int) -> () {
        variable += addNumber;
    }
    return incrementor;
    }
	var input = 10
	let incrementor = makeIncrementor(2)
	incrementor(&input)
	print(input)
