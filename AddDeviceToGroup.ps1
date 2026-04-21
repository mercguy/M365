Import-Module Microsoft.Graph

Connect-MgGraph -Scopes "Device.Read.All","GroupMember.ReadWrite.All"

$GroupId = "cb3810b3-64b9-4cad-8cb3-b55308a71c68"

$DeviceNames = @(
    "Win-Shared-E1tX"
)

foreach ($DeviceName in $DeviceNames) {
    $Device = Get-MgDevice -Filter "displayName eq '$($DeviceName.Replace("'","''"))'"

    if ($Device -and $Device.Count -gt 0) {
        $DeviceId = $Device[0].Id

        New-MgGroupMemberByRef -GroupId $GroupId -BodyParameter @{
            "@odata.id" = "https://graph.microsoft.com/v1.0/directoryObjects/$DeviceId"
        }

        Write-Host "Added device: $DeviceName"
    }
    else {
        Write-Warning "Device not found: $DeviceName"
    }
}