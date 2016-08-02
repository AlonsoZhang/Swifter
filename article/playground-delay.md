# Playground 延时运行

	class MyClass {
	    @objc func callMe() {
	        print("Hi")
	    }
	}
	
	let object = MyClass()
	
	NSTimer.scheduledTimerWithTimeInterval(1, target: object,
	                selector: #selector(MyClass.callMe), userInfo: nil, repeats: true)
	                
print"Hi"不会执行。
                
为了使 Playground 具有延时运行的本领，我们需要引入 Playground 的 “扩展包” XCPlayground 框架。

	XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
	
网络请求：

	let url = NSURL(string: "http://httpbin.org/get")!
	
	let getTask = NSURLSession.sharedSession().dataTaskWithURL(url) {
	    (data, response, error) -> Void in
	    let dictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: [])
	    
	    print(dictionary)
	}
	
	getTask.resume()	
	
