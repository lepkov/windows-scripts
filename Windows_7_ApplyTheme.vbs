On Error Resume Next
Dim currentTheme,ReadTheme
Set WshShell = WScript.CreateObject("WScript.Shell") 
currentTheme = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\CurrentTheme"
ReadTheme = WSHShell.RegRead(currentTheme)
'---Reading Reg Values
WSHShell.RegRead(currentTheme)


'---Echo Values for debug
'WScript.Echo WshShell.RegRead(currentTheme)

If Err Then
'---Applying theme if error occured
ApplyBasicTheme()	
Else
	If ReadTheme = "C:\Windows\resources\Ease of Access Themes\basic.theme" Then
	'WScript.Echo "It's basic" & WshShell.RegRead(currentTheme) & ", nothing to do" ' debug
	Else
	ApplyBasicTheme()		
	End If
End If

Function ApplyBasicTheme()
	'Msgbox "Not basic" & WshShell.RegRead(currentTheme) & ", changing", vbExclamation ' debug
	WshShell.Run "rundll32.exe %SystemRoot%\system32\shell32.dll,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:""%windir%\Resources\Ease of Access Themes\basic.theme"""
	Do Until GetWnd(oWnd) ' Wait until Personalisation Window appears
		WScript.Sleep 10
	Loop
	'sLocationName = oWnd.LocationName ' debug
	oWnd.Quit ' Close Personalisation Window
	'WScript.Echo sLocationName & " Closed" ' debug
End function

Function GetWnd(oShellWnd)
	On Error Resume Next
	GetWnd = False
		For Each oShellWnd In CreateObject("Shell.Application").Windows
			With oShellWnd
			If InStr(LCase(TypeName(.Document)), "ishell") = 0 Then ' is explorer window, but not internet explorer
			Else
				If InStr(.Document.Folder.Self.Path, "::{26EE0668-A00A-44D7-9371-BEB064C98683}") = 0 Then ' any control panel window
			Else
			GetWnd = True
		Exit For
				End If
			End If
			End With
	Next
End Function
WScript.Quit
