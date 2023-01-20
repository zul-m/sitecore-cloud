Param(
    [string] [Parameter(Mandatory = $true)] $certPfxFolder,
    [string] [Parameter(Mandatory = $true)] $secret
)
$today = Get-Date
$validUntil = $today.AddYears(10)
$thumbprint = (New-SelfSignedCertificate -notafter $validUntil -Subject "CN=xconnect-client" -Type SSLServerAuthentication -FriendlyName "xconnect-client").Thumbprint
if (!(Test-Path -Path $certPfxFolder)) {
    New-Item -Path $certPfxFolder -ItemType Directory
}
$certificateFilePath = Join-Path $certPfxFolder "$thumbprint.pfx"
$certPassword = ConvertTo-SecureString -String $secret -Force -AsPlainText
Export-PfxCertificate -cert cert:\LocalMachine\MY\$thumbprint -FilePath "$certificateFilePath" -Password $certPassword
[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes($certificateFilePath)) > "$($certPfxFolder)\cert_base64string.txt"