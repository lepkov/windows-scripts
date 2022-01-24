$Server="192.168.1.1"
$User="localhost\Administrator"
$Password="pasword123"
$SecurePassword = $Password | ConvertTo-SecureString -AsPlainText -Force

cmdkey /generic:$Server /user:$User /pass:$SecurePassword
mstsc /v:$Server /w:1920 /h:1080 