$Username = "AdminAccount";
$Password = 'PASSWORD' | ConvertTo-SecureString -AsPlainText -Force;
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username, $Password;
 
#Join the server to the domain.
Add-Computer -DomainName "lepkov.ru" -Credential $Credential -Restart;
