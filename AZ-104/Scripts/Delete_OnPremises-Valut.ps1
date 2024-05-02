
Write-Host "WARNING: Please ensure that you have at least PowerShell 7 before running this script. Visit https://go.microsoft.com/fwlink/?linkid=2181071 for the procedure." -ForegroundColor Yellow
$RSmodule = Get-Module -Name Az.RecoveryServices -ListAvailable
$NWmodule = Get-Module -Name Az.Network -ListAvailable
$RSversion = $RSmodule.Version.ToString()
$NWversion = $NWmodule.Version.ToString()

if($RSversion -lt "5.3.0")
{
	Uninstall-Module -Name Az.RecoveryServices
	Set-ExecutionPolicy -ExecutionPolicy Unrestricted
	Install-Module -Name Az.RecoveryServices -Repository PSGallery -Force -AllowClobber
}

if($NWversion -lt "4.15.0")
{
	Uninstall-Module -Name Az.Network
	Set-ExecutionPolicy -ExecutionPolicy Unrestricted
	Install-Module -Name Az.Network -Repository PSGallery -Force -AllowClobber
}
