$path = 'C:\Users\User\Desktop\develop'
# Delete -WhatIf to actually delete folders, with this switch it will only output what is it going to do
Get-ChildItem $path -Recurse -Force -Directory -Include 'Temp', 'History', 'Thumbnails' | Remove-Item -Recurse -Confirm:$false -Force -WhatIf
