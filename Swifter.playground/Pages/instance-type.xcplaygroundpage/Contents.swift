
import Foundation

let date1 = NSDate()
let name1: AnyClass! = object_getClass(date1)
print(name1)
// 输出：
// __NSDate


let date2 = NSDate()
let name2 = date2.dynamicType
print(name2)
// 输出：
// __NSDate

let string = "Hello"
let name = string.dynamicType
print(name)
debugPrint(name)
// 输出：
// Swift.String