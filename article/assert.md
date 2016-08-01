# 断言

断言 (assertion) 在 Cocoa 开发里一般用来在检查输入参数是否满足一定条件，并对其进行“论断”。

	let absoluteZeroInCelsius = -273.15
	
	func convertToKelvin(celsius: Double) -> Double {
	    assert(celsius > absoluteZeroInCelsius, "输入的摄氏温度不能低于绝对零度")
	    return celsius - absoluteZeroInCelsius
	}
	
	let roomTemperature = convertToKelvin(27)
	// roomTemperature = 300.15
	
	let tooCold = convertToKelvin(-300)
	// 运行时错误:
	// assertion failed:
	// 输入的摄氏温度不能低于绝对零度 : file {YOUR_FILE_PATH}, line {LINE_NUMBER}