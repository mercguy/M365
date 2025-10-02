# List of mailbox email addresses for which SMTP AUTH should be enabled
$mailboxes = @(
    "scanner@tiohundra.se"
    "RTG.SMS@tiohundra.se"
)

# Loop through each mailbox and explicitly enable SMTP AUTH
foreach ($email in $mailboxes) {
    Set-CASMailbox -Identity $email -SmtpClientAuthenticationDisabled $false -ErrorAction SilentlyContinue
}

# Disconnect from Exchange Online
Disconnect-ExchangeOnline -Confirm:$false
