
param([string] $scope = "Process")

. scripts\utils.ps1

if([string]::IsNullOrEmpty([System.Environment]::GetEnvironmentVariable('CARLSIMPP_SUPERBUILD_INSTALL_PREFIX', $scope))) {
  Write-Host "superbuild install prefix is undefined, aborting..."
  return 
} else {
  echo "unset superbuid env vars in scope $scope"
}


# CARLsim++ defaults
Unset-EnvVar CARLSIMPP_CLASS
Unset-EnvVar CARLSIMPP_INST

# default roles overriden by node
Unset-EnvVar CARLSIMPP_YARP
Unset-EnvVar CARLSIMPP_EDGE
Unset-EnvVar CARLSIMPP_DB
Unset-EnvVar CARLSIMPP_GPU


# Default Yarp Variables
# http://www.yarp.it/yarp_env_variables.html
Unset-EnvVar YARP_QUIET
Unset-EnvVar YARP_VERBOSE
#Unset-EnvVar YARP_LOGGER_STREAM
#Unset-EnvVar YARP_COLORED_OUTPUT

# 1: print filename and function
Unset-EnvVar YARP_VERBOSE_OUTPUT
Unset-EnvVar YARP_TRACE_ENABLE
Unset-EnvVar YARP_DEBUG_ENABLE

# must be set to 0, on MT5, .. nodes elsewise MT5 hangs (but yarprun is not registered as well) 
# must be set to 1 on YARP nodes for YarpLogger (elsewise no logs)
Unset-EnvVar YARP_FORWARD_LOG_ENABLE


# Default Autostart
Unset-EnvVar CARLSIMPP_YARPSERVER
Unset-EnvVar CARLSIMPP_YARPLOGGER
Unset-EnvVar CARLSIMPP_YARPRUN_EDGE
Unset-EnvVar CARLSIMPP_YARPRUN_YARP
Unset-EnvVar CARLSIMPP_YARPRUN_GPU
Unset-EnvVar CARLSIMPP_YARPMANANGER


# Set Legacy variables  
Unset-EnvVar CARLSIMPP_BIN
Unset-EnvVar CARLSIMPP_CONFIG

# System variables
Unset-EnvVar YARP_DIR
Unset-EnvVar YARP_DATA_DIRS

# deriveed settings from env variables
Unset-EnvVar CARLSIMPP_CLASS_SUFFIX
Unset-EnvVar CARLSIMPP_INST_SUFFIX


# Set Yarpmanager XML Editor (Scope Process only)
#if($scope -eq "Process") {
## Unset-EnvVar PATH", "C:\Program Files\Notepad++;${env:PATH}", $scope)
#}

Remove-ItemFromEnvVar PATH 'C:\Program Files\Notepad++'

#DEBUG 
#REM http://www.yarp.it/yarp_env_variables.html
Unset-EnvVar YARP_QUIET
Unset-EnvVar YARP_VERBOSE

#REM SET YARP_LOGGER_STREAM=stdout
#REM SET YARP_COLORED_OUTPUT=1
#REM 1: print filename and function

Unset-EnvVar YARP_VERBOSE_OUTPUT
Unset-EnvVar YARP_TRACE_ENABLE
Unset-EnvVar YARP_DEBUG_ENABLE
Unset-EnvVar YARP_FORWARD_LOG_ENABLE

# TODO apply YCM helper
#Unset-EnvVar PATH", $path+";"+[System.Environment]::GetEnvironmentVariable("PATH",$scope), $scope)


Write-Host "restart shell environments and check with" 
Write-Host "dir env:carlsimpp*,env:yarp*,env:path"