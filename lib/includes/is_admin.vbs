' Function to very UAC.
Function IsAdmin()
	On Error Resume Next
	
	' Check if the registry key is readable.
	isAdmin = False
	adminKey = CreateObject("WScript.Shell").RegRead("HKEY_USERS\S-1-5-19\Environment\TEMP")
	If err.number = 0 Then 
		isAdmin = True 
	Else
		Log "WARNING", "The exploit was denied administrative access." 
	End If
	
	On Error Goto 0
End Function