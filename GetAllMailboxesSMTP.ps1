# Get all user mailboxes and select only the necessary properties
Get-CASMailbox -ResultSize Unlimited | Select-Object Name, PrimarySmtpAddress, SmtpClientAuthenticationDisabled |
    Export-Csv -Path "C:\temp\tiohundra\Mailbox_SmtpAuth_Enabled_Mailboxes.csv" -NoTypeInformation

# Disconnect the session
Disconnect-ExchangeOnline -Confirm:$false
