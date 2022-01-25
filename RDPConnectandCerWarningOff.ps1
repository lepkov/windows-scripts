#Certificate warning turn off
function Test-RegistryValue {
    param (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]$Path,
        
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]$Value
    )
    try {    
        Get-ItemProperty -Path $Path | Select-Object -ExpandProperty $Value -ErrorAction Stop | Out-Null
        return $true
    }
    catch {               
        return $false
    }        
}

$keyExists = Test-Path -Path 'HKCU:\Software\Microsoft\Terminal Server Client'  
if ($keyExists -eq $False) {
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client" 
    Write-Output "Key is absent. Created it."
}
else {
    Write-Output "Key exists. Nothing to do."
}

$valueExists = Test-RegistryValue -Path 'HKCU:\Software\Microsoft\Terminal Server Client' -Value 'AuthenticationLevelOverride'
if ($valueExists -eq $False) {
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client" /v "AuthenticationLevelOverride" /t "REG_DWORD" /d 0 /f 
    Write-Output "Value is absent. Created it."
}
else {
    Write-Output "Value exists. Nothing to do."
}
$Server = "192.168.1.1"
$User = "127.0.0.0\Administrator"
$Password = "password"
    
cmdkey /delete:"$Server" # probably not needed, just clears the credentials
cmdkey /generic:"$Server" /user:"$user" /pass:"$password"
    
mstsc /v:"$Server" /w:1920 /h:1080 /admin # /admin probably not needed either
