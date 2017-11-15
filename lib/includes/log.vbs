' Subroutine to log exploit information.
Sub Log(status, desc)
	' Check if log is enabled.
	If cfgDict("LOG") = "true" Then
		' Create the File System Object
		Set fso = CreateObject("Scripting.FileSystemObject")
		newFile = False
		
		' Check if log file exists.
		If fso.FileExists(PATH_LOOT & "log.txt") = False Then
		   fso.CreateTextFile(PATH_LOOT & "log.txt")
		   newFile = True
		End If 

		' Write information to the log file.
		Set fileLog = fso.OpenTextFile(PATH_LOOT & "log.txt", 8, True)
		If newFile = True Then
			fileLog.WriteLine("Status" & vbTab & vbTab & "Description" & vbTab & vbTab & vbTab & vbTab & vbTab & vbTab & "Date")
			fileLog.WriteLine(status & vbTab & vbTab & desc & vbTab & vbTab & CDate(Now()))
		Else
			fileLog.WriteLine(status & vbTab & vbTab & desc & vbTab & vbTab & CDate(Now()))
		End If
		fileLog.Close
	End If
End Sub
