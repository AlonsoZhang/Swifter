# 柯里化 (Currying)

柯里化是一种量产相似方法的好办法，可以通过柯里化一个方法模板来避免写出很多重复代码，也方便了今后维护。

1.num + adder 的一个函数，先决定加几，再加到原来的 num 上。

	func addTo(adder: Int) -> Int -> Int {
	    return {
	        num in
	        return num + adder
	    }
	}
	let addTwo = addTo(2)    // addTwo: Int -> Int
	let result = addTwo(6)   // result = 8

2.比大小的函数

	func greaterThan(comparer: Int) -> Int -> Bool {
	    return { $0 > comparer }
	}
	let greaterThan10 = greaterThan(10);
	greaterThan10(13)    // => true
	greaterThan10(9)     // => false
	
3.selector章节后补上，待续……