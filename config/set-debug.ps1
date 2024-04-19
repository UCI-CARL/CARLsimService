
param([string] $scope = "User")

. scripts\utils.ps1

if([string]::IsNullOrEmpty([System.Environment]::GetEnvironmentVariable('CARLSIMPP_SUPERBUILD_INSTALL_PREFIX', $scope))) {
  Write-Host "superbuild install prefix is undefined, aborting..."
  return 
} else {
  echo "set superbuid into debug mode for scope $scope"
}


# override path debug

Add-ItemToEnvVar PATH "$([System.Environment]::GetEnvironmentVariable('CARLSIMPP_SUPERBUILD_INSTALL_PREFIX', $scope))\debug\bin" -append $False

if($scope -eq 'Process') {
  echo "debug overrides"
  dir env:path
}
