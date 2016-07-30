# Toll-Free Bridging 和 Unmanaged

Cocoa 中 Toll-Free Bridging 的处理。

	import AudioToolbox
	
	let fileURL = NSURL(string: "SomeURL")
	var theSoundID: SystemSoundID = 0
	AudioServicesCreateSystemSoundID(fileURL!, &theSoundID)
	
	