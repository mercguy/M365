# Set mailbox to check
$mailbox = "RTG.SMS@tiohundra.se"

# Get the mailbox and check SMTP AUTH setting
Get-CASMailbox -Identity $mailbox | Select-Object Name, SmtpClientAuthenticationDisabled

# Optional interpretation
$casMailbox = Get-CASMailbox -Identity $mailbox

if ($casMailbox.SmtpClientAuthenticationDisabled -eq $true) {
    Write-Output "SMTP AUTH is DISABLED for $mailbox"
} elseif ($casMailbox.SmtpClientAuthenticationDisabled -eq $false) {
    Write-Output "SMTP AUTH is ENABLED for $mailbox"
} else {
    Write-Output "SMTP AUTH setting is undefined for $mailbox"
}
