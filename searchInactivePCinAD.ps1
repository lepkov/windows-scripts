# Запрос учетных данных
$cred = Get-Credential
# Дата последнего использования учетной записи
$date = (Get-Date).AddDays(-365)
Get-ADComputer `
        -Server AD1 `
        -Credential $cred `
        -Filter * `
        -Properties LastLogonDate `
              | Where-Object LastLogonDate -lt $date `
              | Select-Object Name,LastLogonDate
