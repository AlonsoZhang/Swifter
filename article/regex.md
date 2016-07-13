# 正则表达式

Swift 至今为止并没有在语言层面上支持正则表达式。

	struct RegexHelper {
	    let regex: NSRegularExpression
	    
	    init(_ pattern: String) throws {
	        try regex = NSRegularExpression(pattern: pattern,
	            options: .CaseInsensitive)
	    }
	    
	    func match(input: String) -> Bool {
	        let matches = regex.matchesInString(input,
	                    options: [],
	                    range: NSMakeRange(0, input.characters.count))
	        return matches.count > 0
	    }
	}

匹配一个邮箱地址：

	let mailPattern =
	"^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
	
	let matcher: RegexHelper
	do {
	    matcher = try RegexHelper(mailPattern)
	}
	
	let maybeMailAddress = "onev@onevcat.com"
	
	if matcher.match(maybeMailAddress) {
	    print("有效的邮箱地址")
	}
	// 输出:
	// 有效的邮箱地址


[正则表达式30分钟入门教程](http://deerchao.net/tutorials/regex/regex.htm)

[8 Regular Expressions You Should Know](http://code.tutsplus.com/tutorials/8-regular-expressions-you-should-know--net-6149)

实现操作符和重载操作符：

	infix operator =~ {
	associativity none
	precedence 130
	}
	
	func =~(lhs: String, rhs: String) -> Bool {
	    do {
	        return try RegexHelper(rhs).match(lhs)
	    } catch _ {
	        return false
	    }
	}

正则匹配：

	if "onev@onevcat.com" =~
	    "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$" {
	        print("有效的邮箱地址")
	}
	// 输出:
	// 有效的邮箱地址
	
	