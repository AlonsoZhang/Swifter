# 模式匹配

虽然在 Swift 中没有内置的正则表达式支持，但是一个和正则匹配有些相似的特性其实是内置于 Swift 中的，那就是模式匹配。

switch 的几种常见用法：

1.可以判等的类型的判断

	let password = "akfuv(3"
	switch password {
	    case "akfuv(3": print("密码通过")
	    default:        print("验证失败")
	}

2.对 Optional 的判断

	let num: Int? = nil
	switch num {
	    case nil: print("没值")
	    default:  print("\(num!)")
	}
	
3.对范围的判断

	let x = 0.5
	switch x {
	    case -1.0...1.0: print("区间内")
	    default: print("区间外")
	}
	
重载 ~= 操作符：

	func ~=(pattern: NSRegularExpression, input: String) -> Bool {
	    return pattern.numberOfMatchesInString(input,
	        options: [],
	        range: NSRange(location: 0, length: input.characters.count)) > 0
	}
	
	prefix operator ~/ {}

	prefix func ~/(pattern: String) throws -> NSRegularExpression {
	    return try NSRegularExpression(pattern: pattern, options: [])
	}
	
	let contact = ("http://onevcat.com", "onev@onevcat.com")

	let mailRegex: NSRegularExpression
	let siteRegex: NSRegularExpression
	
	mailRegex = try ~/"^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
	siteRegex = try ~/"^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"
	
	switch contact {
	    case (siteRegex, mailRegex): print("同时拥有有效的网站和邮箱")
	    case (_, mailRegex): print("只拥有有效的邮箱")
	    case (siteRegex, _): print("只拥有有效的网站")
	    default: print("嘛都没有")
	}
	
	// 输出
	// 同时拥有网站和邮箱