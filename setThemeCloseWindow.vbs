Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run "rundll32.exe %SystemRoot%\system32\shell32.dll,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:""C:\Windows\Resources\Ease of Access Themes\basic.theme"""
For i = 1 To 10
WScript.Sleep 1000
If WshShell.AppActivate("Персонализация") Then
WshShell.Sendkeys "%{F4}"
Exit For
End If
Next
