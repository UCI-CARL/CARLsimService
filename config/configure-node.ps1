param([string] $node_name)

# check the effective environment variable, not User scope like setenv
if([string]::IsNullOrEmpty($env:CARLSIMPP_SUPERBUILD_INSTALL_PREFIX)) {
  Write-Host "superbuild install prefix is currently undefined, aborting..."
  return 
} elseif([string]::IsNullOrEmpty($node_name)) {
  Write-Host "Usage: provide a nodename as first argument"
  return
} else 
{
  Write-Host "create symbolic links for '$node_name' in '$env:CARLSIMPP_SUPERBUILD_SOURCE_DIR'"
  Write-Host "configure node once after git/install" 
}

$target = "${env:CARLSIMPP_SUPERBUILD_INSTALL_PREFIX}\config\nodes\$node_name"
if(-Not (Test-Path $target)) {
  Write-Host "Usage: node $node_name must exit in configuration node list"
  return
}
if(Test-Path 'node') {
  (Get-Item 'node').Delete()
}
#New-Item -ItemType SymbolicLink -Path 'node' -Target $target 
cmd.exe /c mklink /D node "%CARLSIMPP_SUPERBUILD_INSTALL_PREFIX%\config\nodes\$node_name"

$contexts = "yarp\contexts"
if(Test-Path $contexts) {
  (Get-Item $contexts).Delete()
}
#New-Item -ItemType SymbolicLink -Path $contexts -Target ${target}\contexts
cmd.exe /c mklink /D yarp\contexts "%CARLSIMPP_SUPERBUILD_INSTALL_PREFIX%\config\nodes\$node_name\contexts"


 
