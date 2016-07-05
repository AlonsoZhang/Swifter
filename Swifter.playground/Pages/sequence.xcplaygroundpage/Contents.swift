
import Foundation

// 先定义一个实现了 GeneratorType protocol 的类型
// GeneratorType 需要指定一个 typealias Element
// 以及提供一个返回 Element? 的方法 next()
class ReverseGenerator<T>: GeneratorType {
    typealias Element = T
    
    var array: [Element]
    var currentIndex = 0
    
    init(array: [Element]) {
        self.array = array
        currentIndex = array.count - 1
    }
    
    func next() -> Element? {
        if currentIndex < 0{
            return nil
        }
        else {
            let element = array[currentIndex]
            currentIndex -= 1
            return element
        }
    }
}

// 然后我们来定义 SequenceType
// 和 GeneratorType 很类似，不过换成指定一个 typealias Generator
// 以及提供一个返回 Generator? 的方法 generate()
struct ReverseSequence<T>: SequenceType {
    var array: [T]
    
    init (array: [T]) {
        self.array = array
    }
    
    typealias Generator = ReverseGenerator<T>
    func generate() -> Generator {
        return ReverseGenerator(array: self.array)
    }
}

let arr = [0,1,2,3,4]

// 对 SequenceType 可以使用 for...in 来循环访问
for i in ReverseSequence(array: arr) {
    print("Index \(i) is \(arr[i])")
}

let aaa = ReverseSequence(array: arr)
aaa.map { (Int) -> Int in
    return 1
}

//Book 类有两个属性，一个是书名，一个是价格，然后还有一个构造方法。
class Book {
    var name:String = ""
    var price:Float = 0.0
    init(name: String, price: Float) {
        self.name = name
        self.price = price
    }
}

//定义一个类 BookList，它实现了 SequenceType 协议，用来表示 Book 实例的列表。
class BookList: SequenceType {
    private var bookList:[Book]?
    init() {
        self.bookList = [Book]()
    }
    func addBook(book:Book){
        self.bookList?.append(book)
    }
    //定义了一个 typealias Generator 的属性，这个属性是一个继承自 GeneratorType 的类。
    typealias Generator = BookListGenerator
    //定义了一个 generate 方法，用于返回我们指定的 GeneratorType 类型。
    func generate() -> Generator {
        return BookListGenerator(bookList: self.bookList!)
    }
}

class BookListGenerator : GeneratorType {
    //定义了一个属性别名： typealias Element。 我们将 Book 类赋值给它，表示我们这个集合中存储的数据类型是 Book 类的实例。
    typealias Element = Book
    var currentIndex:Int = 0
    var bookList:[Book]?
    init(bookList: [Book]) {
        self.bookList = bookList
    }
    //定义了一个 next 方法。用于遍历这个集合，直到 next 方法返回 nil 的时候，遍历结束。
    func next() -> Element? {
        //先用 guard 关键字进行了一次判断，检查 bookList（也就是实际的数据是否为空），如果为空，就直接返回 nil。
        guard let list = bookList else { return  nil }
        //用了一个叫做 currentIndex 的属性表示当前所遍历到得索引，这个属性的初始值是 0，然后每遍历一个元素，就加 1，直到它的值超出 list.count 的值，就会返回 nil，宣告遍历完成~
        if currentIndex < list.count {
            let element = list[currentIndex]
            currentIndex += 1
            return element
        }else {
            return nil
        }
    }
}

let bookList = BookList()

bookList.addBook(Book(name: "Swift", price: 12.5))
bookList.addBook(Book(name: "iOS" , price: 10.5))
bookList.addBook(Book(name: "Objc", price: 20.0))

for book in bookList {
    print("\(book.name) 价格 ￥\(book.price)")
}
