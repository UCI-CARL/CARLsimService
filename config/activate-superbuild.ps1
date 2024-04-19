
if(-Not [string]::IsNullOrEmpty($env:CARLSIMPP_SUPERBUILD_INSTALL_PREFIX)) {
  Write-Host "superbuild '${env:CARLSIMPP_SUPERBUILD_INSTALL_PREFIX}' is already active, aborting..."
  return 
}

..\share\carlsimpp-superbuild\addPathsToUserEnvVariables.ps1

Write-Host "superbuild actived, restart shell environments"

