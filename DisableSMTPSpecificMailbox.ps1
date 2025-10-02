# List of mailbox email addresses
$mailboxes = @(
    "Chris.Temmel@tiohundra.se"
    # Add more as needed
)

# Loop through each mailbox and disable SMTP AUTH, ignoring any errors
foreach ($email in $mailboxes) {
    Set-CASMailbox -Identity $email -SmtpClientAuthenticationDisabled $true -ErrorAction SilentlyContinue
}

# Disconnect from Exchange Online
Disconnect-ExchangeOnline -Confirm:$false
