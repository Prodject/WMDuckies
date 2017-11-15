Set cfgDict = CreateObject("Scripting.Dictionary")
Set cfgFile = CreateObject("Scripting.FileSystemObject").OpenTextFile(PATH_ROOT & "lib\config.txt", 1)

Do Until cfgFile.AtEndOfStream
    line = cfgFile.ReadLine
	
	If Len(line) > 0 Then
		If Instr(line, "#") = 0 Then
			cfgVariable = Split(line, "=")
			cfgName = Trim(cfgVariable(0))
			cfgValue = Trim(cfgVariable(1))
			
			If cfgDict.Exists(cfgName) Then
				cfgDict(cfgName) = cfgDict(cfgName) & "," & cfgValue
			Else
				cfgDict.Add cfgName, cfgValue
			End If
		End If
	End If
Loop
cfgFile.Close