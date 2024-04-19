
param([string] $scope = "Process")

. scripts\utils.ps1

# CAUTION
# $env: only adresses variables of the current session:
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.1
# ${env:ENVVARNAME}
# -->
# $([System.Environment]::GetEnvironmentVariable('ENVVARNAME', $scope))


if([string]::IsNullOrEmpty([System.Environment]::GetEnvironmentVariable('CARLSIMPP_SUPERBUILD_INSTALL_PREFIX', $scope))) {
  Write-Host "superbuild install prefix is undefined, aborting..."
  return 
} else {
  echo "set env vars of superbuild for scope $scope"
}

# CARLsim++ defaults
Set-EnvVar CARLSIMPP_CLASS ""
Set-EnvVar CARLSIMPP_INST ""

# default roles overriden by node
Set-EnvVar CARLSIMPP_YARP 0
Set-EnvVar CARLSIMPP_EDGE 0
Set-EnvVar CARLSIMPP_DB 0
Set-EnvVar CARLSIMPP_GPU 0


# Default Yarp Variables
# http://www.yarp.it/yarp_env_variables.html
Set-EnvVar YARP_QUIET 1
Set-EnvVar YARP_VERBOSE 0
#Set-EnvVar YARP_LOGGER_STREAM stdout
#Set-EnvVar YARP_COLORED_OUTPUT 1

# 1: print filename and function
Set-EnvVar YARP_VERBOSE_OUTPUT 0
Set-EnvVar YARP_TRACE_ENABLE 1
Set-EnvVar YARP_DEBUG_ENABLE 1

# must be set to 0 on EDGE 
# must be set to 1 on YARP nodes for YarpLogger (elsewise no logs)
Set-EnvVar YARP_FORWARD_LOG_ENABLE 0


# Default Autostart
Set-EnvVar CARLSIMPP_YARPSERVER ""
Set-EnvVar CARLSIMPP_YARPLOGGER ""
Set-EnvVar CARLSIMPP_YARPRUN_EDGE ""
Set-EnvVar CARLSIMPP_YARPRUN_YARP ""
Set-EnvVar CARLSIMPP_YARPRUN_GPU ""
Set-EnvVar CARLSIMPP_YARPMANANGER ""

# Node Specific Overrides
 
if(test-path "node\setenv_overrides.ps1") {node\setenv_overrides.ps1 $scope} 


# set legacy variables  
Set-EnvVar CARLSIMPP_BIN "$([System.Environment]::GetEnvironmentVariable('CARLSIMPP_SUPERBUILD_SOURCE_DIR', $scope))" 
Set-EnvVar YARP_DIR "$([System.Environment]::GetEnvironmentVariable('CARLSIMPP_SUPERBUILD_INSTALL_PREFIX', $scope))"    
Set-EnvVar CARLSIMPP_CONFIG "$([System.Environment]::GetEnvironmentVariable('CARLSIMPP_SUPERBUILD_INSTALL_PREFIX', $scope))\config"
Set-EnvVar YARP_DATA_DIRS "$([System.Environment]::GetEnvironmentVariable('CARLSIMPP_CONFIG', $scope))\yarp;$([System.Environment]::GetEnvironmentVariable('CARLSIMPP_SUPERBUILD_INSTALL_PREFIX', $scope))\share\yarp"


# derive settings from env variables
Set-EnvVar CARLSIMPP_CLASS_SUFFIX "-$([System.Environment]::GetEnvironmentVariable('CARLSIMPP_CLASS', $scope))"
Set-EnvVar CARLSIMPP_INST_SUFFIX "-$([System.Environment]::GetEnvironmentVariable('CARLSIMPP_INST', $scope))"

# Set Yarpmanager XML Editor (Scope Process only)
Add-ItemToEnvVar PATH 'notepad.exe'


# Debug 

#REM http://www.yarp.it/yarp_env_variables.html
Set-EnvVar YARP_QUIET 1
Set-EnvVar YARP_VERBOSE 0

#REM SET YARP_LOGGER_STREAM=stdout
#REM SET YARP_COLORED_OUTPUT=1
#REM 1: print filename and function

Set-EnvVar YARP_VERBOSE_OUTPUT 0
Set-EnvVar YARP_TRACE_ENABLE 1
Set-EnvVar YARP_DEBUG_ENABLE 1
Set-EnvVar YARP_FORWARD_LOG_ENABLE 0



Write-Host "restart shell environments and check with" 
Write-Host "  dir env:carlsimpp*,env:yarp*,env:path"
