$LocalTempDir = $env:TEMP; 
$ChromeInstaller = "ChromeInstaller.msi"; 
(new-object System.Net.WebClient).DownloadFile('http://dl.google.com/dl/chrome/install/googlechromestandaloneenterprise.msi', "$LocalTempDir\$ChromeInstaller"); 
$MSIArguments = @(
    "/i"
    "$LocalTempDir\$ChromeInstaller"
    "/qn"
    "/norestart"
)
Start-Process "msiexec.exe" -ArgumentList $MSIArguments -Wait -NoNewWindow 
Remove-Item "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose
