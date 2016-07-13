# ... 和 ..

0...3 就表示从 0 开始到 3 为止并包含 3 这个数字的范围，我们将其称为全闭合的范围操作。

0..<3 不包含3

	for i in 0...3 {
	    print(i, terminator: "")
	}
	//输出 0123

确认一个单词里的全部字符都是小写英文字母：

	let test = "helLo"
	let interval = "a"..."z"
	for c in test.characters {
	    if !interval.contains(String(c)) {
	        print("\(c) 不是小写字母")
	    }
	}
	
	//L 不是小写字母
