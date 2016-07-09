# 字面量转换

所谓字面量，就是指像特定的数字，字符串或者是布尔值这样，能够直截了当地指出自己的类型并为变量进行赋值的值。

在 Swift 中，Array 和 Dictionary 在使用简单的描述赋值的时候，使用的也是字面量。

	let anArray = [1,2,3]
	let aDictionary = ["key1": "value1", "key2": "value2"]
	
一系列接口，用来将字面量转换为特定的类型：

	typealias ALC = ArrayLiteralConvertible
	typealias BLC = BooleanLiteralConvertible
	typealias DLC = DictionaryLiteralConvertible
	typealias FLC = FloatLiteralConvertible
	typealias NLC = NilLiteralConvertible
	typealias ILC = IntegerLiteralConvertible
	typealias SLC = StringLiteralConvertible
	
	