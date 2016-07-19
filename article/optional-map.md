# Optional Map

map的使用：

	let arr = [1,2,3]
	let doubled = arr.map{
	    $0 * 2
	}
	print(doubled)
	// 输出：
	// [2,4,6]
	
map方法能让我们很方便地对一个 Optional 值做变化和操作，而不必进行手动的解包工作。

	let num: Int? = 3
	let result = num.map {
	    $0 * 2
	}
	result