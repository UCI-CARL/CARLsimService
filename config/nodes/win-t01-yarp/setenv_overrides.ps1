#
# dir env:
# $env:path
#
param([string] $scope = "Process")

echo "setnode called for scope $scope"

# Node 
[System.Environment]::SetEnvironmentVariable("CARLSIMPP_CLASS", "T", $scope)
[System.Environment]::SetEnvironmentVariable("CARLSIMPP_INST", "T01", $scope)

# The Role of the node in the CARLsim++ Enterprise
[System.Environment]::SetEnvironmentVariable("CARLSIMPP_YARP", "1", $scope)

# must be set to 1 on YARP nodes for YarpLogger
[System.Environment]::SetEnvironmentVariable("YARP_FORWARD_LOG_ENABLE", "1", $scope)

# Node Autostart
[System.Environment]::SetEnvironmentVariable("CARLSIMPP_YARPSERVER", "1", $scope)
[System.Environment]::SetEnvironmentVariable("CARLSIMPP_YARPLOGGER", "1", $scope)
[System.Environment]::SetEnvironmentVariable("CARLSIMPP_YARPMANANGER", "1", $scope)
[System.Environment]::SetEnvironmentVariable("CARLSIMPP_YARPRUN_YARP", "1", $scope)
[System.Environment]::SetEnvironmentVariable("CARLSIMPP_YARPRUN_EDGE", "1", $scope)
[System.Environment]::SetEnvironmentVariable("CARLSIMPP_YARPRUN_GPU", "1", $scope)



