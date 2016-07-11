# Sequence

我们传递给 for ... in 语法的，其实是一个 Array 类的实例。

 Array 类继承自一个叫做 CollectionType 的协议。
 
	 public protocol SequenceType {
	  ...
	}
 
 例子介绍了一个类如果实现了 SequenceType 和 GeneratorType 协议，那么他就可以使用 for ... in 语法进行遍历了。