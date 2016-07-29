# Options

	[UIView animateWithDuration:0.3
	                      delay:0.0
	                    options:UIViewAnimationOptionCurveEaseIn |
	                            UIViewAnimationOptionAllowUserInteraction
	                 animations:^{
	    // ...
	} completion:nil];

我们可以使用 | 或者 & 这样的按位逻辑符对这些选项进行操作，这是因为一般来说在 Objective-C 中的 Options 的定义都是类似这样的按位错开的。

在 Swift 中，对于原来的枚举类型 NS_ENUM 我们有新的 enum 类型来对应。但是原来的 NS_OPTIONS 在 Swift 里显然没有枚举类型那样重要，并没有直接的原生类型来进行定义。

