
import Foundation

let numbers = [1,2,3,4,5]
// numbers 的类型是 [Int]

let strings = ["hello", "world"]
// strings 的类型是 [String]

import UIKit

let mixed1: [Any] = [1, "two", 3]

// 如果不指明类型，由于 UIKit 的存在
// 将被推断为 [NSObject]
let objectArray = [1, "two", 3]

let any = mixed1[0]  // Any 类型
let nsObject = objectArray[0] // NSObject 类型

let mixed2: [CustomStringConvertible] = [1, "two", 3]

for obj in mixed2 {
    print(obj.description)
}

enum IntOrString {
    case IntValue(Int)
    case StringValue(String)
}

let mixed3 = [IntOrString.IntValue(1),
    IntOrString.StringValue("two"),
    IntOrString.IntValue(3)]

for value in mixed3 {
    switch value {
    case let .IntValue(i):
        print(i * 2)
    case let .StringValue(s):
        print(s.capitalizedString)
    }
}

// 输出：
// 2
// Two
// 6
