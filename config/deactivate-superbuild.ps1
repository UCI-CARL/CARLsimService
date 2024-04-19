
if([string]::IsNullOrEmpty($env:CARLSIMPP_SUPERBUILD_INSTALL_PREFIX)) {
  Write-Host "superbuild is not active, aborting..."
  return 
}

..\share\carlsimpp-superbuild\removePathsFromUserEnvVariables.ps1

Write-Host "superbuild deactived, restart shell environments"

