$TG_TOKEN = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
$TG_CHAT_ID = "XXXXXXXXXX
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$MESSAGE = "Hello"
$Response = Invoke-RestMethod -Uri "https://api.telegram.org/bot$($TG_TOKEN)/sendMessage?chat_id=$($TG_CHAT_ID)&text=$($MESSAGE)"
