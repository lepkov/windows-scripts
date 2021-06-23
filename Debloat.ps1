Get-AppxPackage -allusers | Remove-AppxPackage
Get-AppxPackage | Remove-AppxPackage
Get-AppXProvisionedPackage -online | Remove-AppxProvisionedPackage -online
"Debloating Done"  | Out-File -FilePath \\NETWORKSHARE\logs\$env:COMPUTERNAME.txt
