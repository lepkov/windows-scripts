            # Turn off Legal Notice
            New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name LegalNoticeCaption -Value '' -PropertyType STRING -Force
            New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name LegalNoticeText -Value '' -PropertyType STRING -Force
            New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system' -Name LegalNoticeCaption -Value '' -PropertyType STRING -Force
            New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system' -Name LegalNoticeText -Value '' -PropertyType STRING -Force

            # Turn On Auto LogOn
            reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultDomainName" /t "REG_SZ" /d 127.0.0.1 /f
            reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultUserName" /t "REG_SZ" /d Administrator /f
            reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultPassword" /t "REG_SZ" /d $pw /f
            reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /t "REG_SZ" /d 1 /f
