@echo off

rem disable Themes

rem sc config Themes start=disabled

rem net stop Themes

rem disable Aero

sc config uxsms start=disabled

net stop uxsms

rem max

rem reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects /va /f

rem reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects /v VisualFXSetting /t REG_DWORD /d 0x2 /f

rem set theme basic

rundll32.exe %SystemRoot%\system32\shell32.dll,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:"C:\Windows\Resources\Ease of Access Themes\basic.theme"
