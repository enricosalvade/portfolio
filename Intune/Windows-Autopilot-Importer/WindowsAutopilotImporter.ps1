# CONFIGURATION
$TenantId = "<TENANT_ID>"
$ClientId = "<CLIENT_ID>"
$ClientSecret = "<CLIENT_SECRET>"
$GroupTag = "AUTOMATION"

# Collect mandatory autopilot import properties in .CSV file
$csvPath = "$env:TEMP\autopilot.csv"

Get-WindowsAutopilotInfo.ps1 -OutputFile $csvPath

#Store info in variables
$device = Import-Csv $csvPath #autopilot info

$serial = $device."Device Serial Number" #retrieve SN
$hash = $device."Hardware Hash" #retrieve hardware hash

# Get Graph Token
$body = @{
    grant_type    = "client_credentials" #set app authentication method
    scope         = "https://graph.microsoft.com/.default" #graph permissions
    client_id     = $ClientId
    client_secret = $ClientSecret
}

$token = Invoke-RestMethod `
    -Uri "https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token" `
    -Method Post `
    -Body $body

$accessToken = $token.access_token

$headers = @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Build Autopilot Import
$import = @{
    serialNumber = $serial
    hardwareIdentifier = $hash
    groupTag = $GroupTag
} | ConvertTo-Json

# Import device
Invoke-RestMethod `
    -Uri "https://graph.microsoft.com/beta/deviceManagement/importedWindowsAutopilotDeviceIdentities" `
    -Headers $headers `
    -Method Post `
    -Body $import

Write-Host "Device imported in Autopilot"
