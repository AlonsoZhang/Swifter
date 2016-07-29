# 调用 C 动态库

涉及到压缩的话我们很可能会借助于 libz.dylib，而像 xml 的解析的话一般链接 libxml.dylib。

计算某个字符串的 MD5 这样简单地需求，在以前我们直接使用 CommonCrypto 中的 CC_MD5 就可以了，但是现在因为我们在 Swift 中无法直接写 #import <CommonCrypto/CommonCrypto.h> 这样的代码，这些动态库暂时也没有 module 化，因此快捷的方法就只有借助于通过 Objective-C 来进行调用了。因为 Swift 是可以通过 {product-module-name}-Bridging-Header.h 来调用 Objective-C 代码的，于是 C 作为 Objective-C 的子集，自然也一并被解决了。

