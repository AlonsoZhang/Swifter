# protocol 组合

	protocol ProtocolD: ProtocolA, ProtocolB, ProtocolC {
	
	}
	
	protocol KittenLike {
    func meow() -> String
}

	protocol DogLike {
	    func bark() -> String
	}
	
	protocol TigerLike {
	    func aou() -> String
	}
	
	class MysteryAnimal: KittenLike, DogLike, TigerLike {
	    func meow() -> String {
	        return "meow"
	    }
	    
	    func bark() -> String {
	        return "bark"
	    }
	    
	    func aou() -> String {
	        return "aou"
	    }
	}
	
	typealias PetLike = protocol<KittenLike, DogLike>
	typealias CatLike = protocol<KittenLike, TigerLike>
	
	struct SoundChecker {
	    static func checkPetTalking(pet: PetLike) {
	        //...
	    }
	    
	    static func checkCatTalking(cat: CatLike) {
	        //...
	    }
	}
	
实现多个接口时接口内方法冲突的解决方法：

	protocol A {
	    func bar() -> Int
	}
	
	protocol B {
	    func bar() -> String
	}
	
	class Class: A, B {
	    func bar() -> Int {
	        return 1
	    }
	    
	    func bar() -> String {
	        return "Hi"
	    }
	}
	
调用前进行类型转换

	let instance = Class()
	
	let num = (instance as A).bar()  // 1
	let str = (instance as B).bar()  // "Hi"