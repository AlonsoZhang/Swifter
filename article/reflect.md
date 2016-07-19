# Reflection 和 Mirror

通过 Mirror 初始化得到的结果中包含的元素的描述都被集合在 children 属性下。

	struct Person {
	    let name: String
	    let age: Int
	}
	
	let xiaoMing = Person(name: "XiaoMing", age: 16)
	let r = Mirror(reflecting: xiaoMing) // r 是 MirrorType
	
	print("xiaoMing 是 \(r.displayStyle!)")
	
	print("属性个数:\(r.children.count)")
	for i in r.children.startIndex..<r.children.endIndex {
	    print("属性名:\(r.children[i].0!)，值:\(r.children[i].1)")
	}
	
	// 输出：
	// xiaoMing 是 Struct
	// 属性个数:2
	// 属性名:name，值:XiaoMing
	// 属性名:age，值:16
	
使用 dump 方法来通过获取一个对象的镜像并进行标准输出的方式将其输出出来。

	dump(xiaoMing)
	// 输出：
	// ▿ Person
	//  - name: XiaoMing
	//  - age: 16
	
在运行时通过 Mirror 的手段了解一个 Swift 类型 (当然 NSObject 类也可以) 的实例的属性信息。

	func valueFrom(object: Any, key: String) -> Any? {
	    let mirror = Mirror(reflecting: object)
	    
	    for i in mirror.children.startIndex..<mirror.children.endIndex {
	        let (targetKey, targetMirror) = mirror.children[i]
	        if key == targetKey {
	            return targetMirror
	        }
	    }
	    
	    return nil
	}
	
	// 接上面的 xiaoMing
	if let name = valueFrom(xiaoMing, key: "name") as? String {
	    print("通过 key 得到值: \(name)")
	}
	
	// 输出：
	// 通过 key 得到值: XiaoMing