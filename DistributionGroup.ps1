# Connect to Exchange Online (you may need to install the EXO V2 module if not already installed)
Connect-ExchangeOnline

# Set the distribution group identity (can be the name, alias, or email address)
$DistributionGroup = "pilotDLP@tiohundra.se"

# Import the CSV file
$Members = Import-Csv -Path "C:\temp\TioHundra\Roslagsgatan\Roslagsgatan_2025-4-23.csv"

# Add each user to the distribution group
foreach ($Member in $Members) {
    try {
        Add-DistributionGroupMember -Identity $DistributionGroup -Member $Member.userPrincipalName -ErrorAction Stop
        Write-Host "✅ Added $($Member.userPrincipalName) to $DistributionGroup"
    } catch {
        Write-Warning "⚠️ Failed to add $($Member.userPrincipalName): $_"
    }
}

# Disconnect the session
Disconnect-ExchangeOnline
