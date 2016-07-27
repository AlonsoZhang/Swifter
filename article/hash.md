# 哈希

我们需要为判等结果为相同的对象提供相同的哈希值，以保证在被用作字典的 key 时的确定性和性能。

Swift 类型中提供了一个叫做 Hashable 的接口，实现这个接口即可为该类型提供哈希支持：

	protocol Hashable : Equatable {
	    var hashValue: Int { get }
	}
	
Swift 的原生 Dictionary 中，key 一定是要实现了的 Hashable 接口的类型。像 Int 或者 String 这些 Swift 基础类型，已经实现了这个接口，因此可以用来作为 key 来使用。比如 Int 的 hashValue 就是它本身：

	let num = 19
	print(num.hashValue) // 19

