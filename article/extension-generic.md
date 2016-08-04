# 泛型扩展

在扩展中实现一个 random 方法来随机地取出 Array 中的一个元素：

	var random: Element? {
	        return self.count != 0 ?
	            self[Int(arc4random_uniform(UInt32(self.count)))] :
	        nil
	    }
	    
	let languages = ["Swift","ObjC","C++","Java"]
	languages.random!
	// 随机输出是这四个字符串中的某个
	
	let ranks = [1,2,3,4]
	ranks.random!
	// 随机输出是这四个数字中的某个
	
在扩展中是不能添加整个类型可用的新泛型符号的，但是对于某个特定的方法来说，我们可以添加 T 以外的其他泛型符号。

	func appendRandomDescription
	        <U: CustomStringConvertible>(input: U) -> String {
	            
	            if let element = self.random {
	                return "\(element) " + input.description
	            } else {
	                return "empty array"
	            }
	    }

	languages.appendRandomDescription(ranks.random!)
	// 随机组合 languages 和 ranks 中的各一个元素，然后输出