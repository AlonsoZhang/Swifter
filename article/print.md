# print 和 debugPrint

对于一个普通的对象，我们在调用 print 对其进行打印时只能打印出它的类型：

	class MyClass {
	    var num: Int
	    init() {
	        num = 1
	    }
	}
	
	let obj = MyClass()
	print(obj)
	
打印一个 struct 实例的话，会列举出它所有成员的名字和值：

struct Meeting {
    var date: NSDate
    var place: String
    var attendeeName: String
}

let meeting = Meeting(date: NSDate(timeIntervalSinceNow: 86400),
    place: "会议室B1",
    attendeeName: "小明")
print(meeting)
// 输出:
// Meeting(date: 2016-08-02 02:36:55 +0000, place: "会议室B1", attendeeName: "小明")

使用 CustomStringConvertible 接口，这个接口定义了将该类型实例输出时所用的字符串。

extension Meeting: CustomStringConvertible {
    var description: String {
        return "于 \(self.date) 在 \(self.place) 与 \(self.attendeeName) 进行会议"
    }
}