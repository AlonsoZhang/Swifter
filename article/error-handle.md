# 错误和异常处理

在 Objective-C 开发中，异常往往是由程序员的错误导致的 app 无法继续运行。

相对来说，由 NSError 代表的错误更多地是指那些“合理的”，在用户使用 app 中可能遇到的情况。

	NSError *error;
	BOOL success = [data writeToFile: path options: options error: &error];
	if(error) {
	    // 发生了错误
	}
	
Swift 中：

	public func writeToFile(path: String, options writeOptionsMask: NSDataWritingOptions) throws
	
使用要用 try catch 语句：

	let d = NSData()
	
	do {
	    try d.writeToFile("Hello", options: [])
	} catch let error as NSError {
	    print ("Error: \(error.domain)")
	}
	
对于我们新写的可抛出异常的 API，我们应当抛出一个实现了 ErrorType 的类型，enum 就非常合适。

	enum LoginError: ErrorType {
	    case UserNotFound, UserPasswordNotMatch
	}
	
	func login(user: String, password: String) throws {
	    let users = [String: String]()
	
	    if !users.keys.contains(user) {
	        throw LoginError.UserNotFound
	    }
	    
	    if users[user] != password {
	        throw LoginError.UserPasswordNotMatch
	    }
	    
	    print("Login successfully.")
	}
	
这样的 ErrorType 可以非常明确地指出问题所在。在调用时，catch 语句实质上是在进行模式匹配：
	
	do {
	    try login("onevcat", password: "123")
	} catch LoginError.UserNotFound {
	    print("UserNotFound")
	} catch LoginError.UserPasswordNotMatch {
	    print("UserPasswordNotMatch")
	}
	
	