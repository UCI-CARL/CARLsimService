
# CARLsim++ defaults
export CARLSIMPP_CLASS=""
export CARLSIMPP_INST=""

# default roles overriden by node
export CARLSIMPP_ARP=0
export CARLSIMPP_EDGE=0
export CARLSIMPP_DB=0
export CARLSIMPP_GPU=0

# Default Yarp Variables
# http://www.yarp.it/yarp_env_variables.html
export YARP_QUIET=1
export YARP_VERBOSE=0
#Set-EnvVar YARP_LOGGER_STREAM stdout
#Set-EnvVar YARP_COLORED_OUTPUT 1

# 1: print filename and function
export YARP_VERBOSE_OUTPUT=0
export YARP_TRACE_ENABLE=1
export YARP_DEBUG_ENABLE=1

# must be set to 0 on EDGE 
# must be set to 1 on YARP nodes for YarpLogger (elsewise no logs)
export YARP_FORWARD_LOG_ENABLE=0


# Default Autostart
export CARLSIMPP_YARPSERVER=""
export CARLSIMPP_YARPLOGGER=""
export CARLSIMPP_YARPRUN_EDGE=""
export CARLSIMPP_YARPRUN_YARP=""
export CARLSIMPP_YARPRUN_GPU=""
export CARLSIMPP_YARPMANANGER=""


# Node Specific Overrides
#if(test-path "node\setenv_overrides.ps1") {node\setenv_overrides.ps1 $scope} 
if test -f "$CARLSIMPP_SUPERBUILD_INSTALL_PREFIX/config/node/setenv_overrides.sh";
then  
export CARLSIMPP_OVERRIDES="executed"
 . $CARLSIMPP_SUPERBUILD_INSTALL_PREFIX/config/node/setenv_overrides.sh
fi 

# set legacy variables  
export CARLSIMPP_BIN=$CARLSIMPP_SUPERBUILD_SOURCE_DIR 
export YARP_DIR=$CARLSIMPP_SUPERBUILD_INSTALL_PREFIX    
export CARLSIMPP_CONFIG=$CARLSIMPP_SUPERBUILD_INSTALL_PREFIX/config
export YARP_DATA_DIRS=$YARP_DATA_DIRS:$CARLSIMPP_SUPERBUILD_INSTALL_PREFIX/share/yarp



# derive settings from env variables
# Lnx: prefix class and translate to lower case
# Bash4
#export CARLSIMPP_CLASS_SUFFIX="-${CARLSIMPP_CLASS,,}"
#export CARLSIMPP_INST_SUFFIX="-${CARLSIMPP_INST,,}"
export CARLSIMPP_CLASS_SUFFIX="-$(echo "$CARLSIMPP_CLASS" | tr '[:upper:]' '[:lower:]')"
export CARLSIMPP_INST_SUFFIX="-$(echo "$CARLSIMPP_INST" | tr '[:upper:]' '[:lower:]')"


# Set Yarpmanager XML Editor (Scope Process only)
#Add-ItemToEnvVar PATH 'notepad.exe

# Debug 

#REM http://www.yarp.it/yarp_env_variables.html
export YARP_QUIET=1
export YARP_VERBOSE=0

#REM SET YARP_LOGGER_STREAM=stdout
#REM SET YARP_COLORED_OUTPUT=1
#REM 1: print filename and function

export YARP_VERBOSE_OUTPUT=0
export YARP_TRACE_ENABLE=1
export YARP_DEBUG_ENABLE=1
export YARP_FORWARD_LOG_ENABLE=0
