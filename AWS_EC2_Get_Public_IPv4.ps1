$IP = Invoke-WebRequest http://169.254.169.254/latest/meta-data/public-ipv4 | select -Expand Content
Write-Output "IP address is $IP"
