# 局部 scope

OC中代码构建 UI：

	-(void)loadView {
	    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
	
	    UILabel *titleLabel = [[UILabel alloc]
	            initWithFrame:CGRectMake(150, 30, 20, 40)];
	    titleLabel.textColor = [UIColor redColor];
	    titleLabel.text = @"Title";
	    [view addSubview:titleLabel];
	
	    UILabel *textLabel = [[UILabel alloc]
	            initWithFrame:CGRectMake(150, 80, 20, 40)];
	    textLabel.textColor = [UIColor redColor];
	    textLabel.text = @"Text";
	    [view addSubview:textLabel];
	
	    self.view = view;
	}
	
用局部 scope分隔开：

	-(void)loadView {
	    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
	
	    {
	        UILabel *titleLabel = [[UILabel alloc]
	                initWithFrame:CGRectMake(150, 30, 20, 40)];
	        titleLabel.textColor = [UIColor redColor];
	        titleLabel.text = @"Title";
	        [view addSubview:titleLabel];
	    }
	
	    {
	        UILabel *textLabel = [[UILabel alloc]
	                initWithFrame:CGRectMake(150, 80, 20, 40)];
	        textLabel.textColor = [UIColor redColor];
	        textLabel.text = @"Text";
	        [view addSubview:textLabel];
	    }
	
	    self.view = view;
	}
	
在 Swift 中，直接使用大括号的写法是不支持的，因为这和闭包的定义产生了冲突。

定义一个接受 ()->() 作为函数的全局方法，然后执行它：

	func local(closure: ()->()) {
	    closure()
	}

利用尾随闭包的特性模拟局部 scope：

	override func loadView() {
	    let view = UIView(frame: CGRectMake(0, 0, 320, 480))
	
	    local {
	        let titleLabel = UILabel(frame: CGRectMake(150, 30, 20, 40))
	        titleLabel.textColor = UIColor.redColor()
	        titleLabel.text = "Title"
	        view.addSubview(titleLabel)
	    }
	
	    local {
	        let textLabel = UILabel(frame: CGRectMake(150, 80, 20, 40))
	        textLabel.textColor = UIColor.redColor()
	        textLabel.text = "Text"
	        view.addSubview(textLabel)
	    }
	    
Swift2.0，使用 do 来分隔代码：

	do {
	    let textLabel = UILabel(frame: CGRectMake(150, 80, 20, 40))
	    //...
	}

OC 中使用 GNU C 的声明扩展来在限制局部作用域的时候同时进行赋值：

	self.titleLabel = ({
	    UILabel *label = [[UILabel alloc]
	            initWithFrame:CGRectMake(150, 30, 20, 40)];
	    label.textColor = [UIColor redColor];
	    label.text = @"Title";
	    [view addSubview:label];
	    label;
	});
	
Swift 类似地使用匿名的闭包：

	titleLabel = {
	    let label = UILabel(frame: CGRectMake(150, 30, 20, 40))
	    label.textColor = UIColor.redColor()
	    label.text = "Title"
	    self.view.addSubview(label)
	    return label
	}()