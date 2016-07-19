# 多重 Optional

	var string: String? = "string"
	var anotherString: String?? = string
	
anotherString 是 Optinal<Optional<String>>

也可以将直接的字面量值赋给它：

	var literalOptional: String?? = "string"
	
与 anotherString 是等效的。

	var aNil: String? = nil
	
	var anotherNil: String?? = aNil
	var literalNil: String?? = nil
	
	if let a = anotherNil {
	    print("anotherNil")
	}
	
	if let b = literalNil {
	    print("literalNil")
	}
