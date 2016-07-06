
import Foundation

func logIfTrue(predicate: () -> Bool) {
    if predicate() {
        print("True")
    }
}

logIfTrue({return 2 > 1})
logIfTrue({2 > 1})
logIfTrue{2 > 1}


func logIfTrue2(@autoclosure predicate: () -> Bool) {
    if predicate() {
        print("2True")
    }
}

logIfTrue2(2 > 1)

let level = true
let startLevel = false
let currentLevel = level && startLevel