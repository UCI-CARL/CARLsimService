
param([string] $scope = "User")

. scripts\utils.ps1

if([string]::IsNullOrEmpty([System.Environment]::GetEnvironmentVariable('CARLSIMPP_SUPERBUILD_INSTALL_PREFIX', $scope))) {
  Write-Host "superbuild install prefix is undefined, aborting..."
  return 
} else {
  echo "unset debug mode in scope $scope"
}


Remove-ItemFromEnvVar PATH "$([System.Environment]::GetEnvironmentVariable('CARLSIMPP_SUPERBUILD_INSTALL_PREFIX', $scope))\debug\bin" 
                                                                                                                          
if($scope -eq "Process") {
  echo "debug overrides"
  dir env:path
}
