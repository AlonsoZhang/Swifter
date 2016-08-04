# 列举 enum 类型

通过对于一副扑克牌的花色和牌面大小的 enum 类型，凑出一套不含大小王的扑克牌的数组。

	enum Suit: String {
	    case Spades = "黑桃"
	    case Hearts = "红桃"
	    case Clubs = "草花"
	    case Diamonds = "方片"
	}
	
	enum Rank: Int, CustomStringConvertible {
	    case Ace = 1
	    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
	    case Jack, Queen, King
	    var description: String {
	        switch self {
	        case .Ace:
	            return "A"
	        case .Jack:
	            return "J"
	        case .Queen:
	            return "Q"
	        case .King:
	            return "K"
	        default:
	            return String(self.rawValue)
	        }
	    }
	}

利用 static 的属性来获取一个可以进行循环的数据结构：

	protocol EnumeratableEnumType {
	    static var allValues: [Self] {get}
	}
	
	extension Suit: EnumeratableEnumType {
	    static var allValues: [Suit] {
	        return [.Spades, .Hearts, .Clubs, .Diamonds]
	    }
	}
	
	extension Rank: EnumeratableEnumType {
	    static var allValues: [Rank] {
	        return [.Ace, .Two, .Three,
	            .Four, .Five, .Six,
	            .Seven, .Eight, .Nine,
	            .Ten, .Jack, .Queen, .King]
	    }
	}
	
在这里我们使用了一个接口来更好地定义适用的接口。

	for suit in Suit.allValues {
	    for rank in Rank.allValues {
	        print("\(suit.rawValue)\(rank)")
	    }
	}
	
	// 输出：
	// 黑桃A
	// 黑桃2
	// 黑桃3
	// ...
	// 方片K