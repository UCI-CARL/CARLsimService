Write-Host "superbuild: $env:CARLSIMPP_SUPERBUILD_INSTALL_PREFIX"
Write-Host "path entries (desc):"
$currVar = [System.Environment]::GetEnvironmentVariable('PATH');
$items = $currVar.Split(';')
$items | Where-Object { $_ -match "carlsimpp|yarp" } 
Write-Host "environment variables:"
dir env:carlsimpp*,env:yarp*

