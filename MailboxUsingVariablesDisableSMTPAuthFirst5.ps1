# Define excluded mailboxes
$excludedMailboxes = @("rtg.sms@tiohundra.se", "scanner@tiohundra.se")

# Get all mailboxes except the excluded ones, take the first 5 (for testing)
$mailboxes = Get-ExoMailbox -ResultSize Unlimited | Where-Object {
    $excludedMailboxes -notcontains $_.UserPrincipalName.ToLower()
} | Select-Object -First 5

# Disable SMTP AUTH for the selected mailboxes
foreach ($mailbox in $mailboxes) {
    Set-CASMailbox -Identity $mailbox.UserPrincipalName -SmtpClientAuthenticationDisabled $true -ErrorAction SilentlyContinue
}

# Disconnect from Exchange Online
Disconnect-ExchangeOnline -Confirm:$false
