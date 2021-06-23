Always On VPN Working Script here.

**Prerequisites:**

 -- Configured AD CS 
 -- Issued Machine Certificate
 -- Created folder C:\AOVPN with Mark Russinovich utilities (https://docs.microsoft.com/en-us/sysinternals/downloads/psexec) and .ps1 script file and XML profile file in it


**Steps:**

Open PowerShell with Admin Priveleges

Set-ExecutionPolicy Unrestricted

cd C:\AOVPN

.\PsExec.exe -s -i cmd

In the PowerShell terminal that was open from PsExec, run the following.

powershell.exe

cd C:\AOVPN

.\aovpn.lepkov.ru.ps1 -xmlFilePath "C:\AOVPN\aovpn.lepkov.ru.xml" -ProfileName "aovpn.lepkov.ru";

**Check if that worked** 

Get-VpnConnection -AllUserConnection
