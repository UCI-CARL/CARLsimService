# stops all yarp processes in proper order
# 
# Usage from cmd:  powershell -file stop_system.ps1
#
$id = (Get-Process -name yarpmanager  -ErrorAction Ignore).id
if($id) {
  Stop-Process -Id $id -ErrorAction Ignore 
  Wait-Process -id $id -TimeOut 3 -ErrorAction SilentlyContinue
}  
Get-Process -name yarpdev -ErrorAction Ignore| Stop-Process
Get-Process -name yarp  -ErrorAction Ignore| Stop-Process
Get-Process -name yarprun  -ErrorAction Ignore| Stop-Process
$id = (Get-Process -name yarplogger    -ErrorAction Ignore).id
if($id) {
  Stop-Process -Id $id -ErrorAction Ignore 
  Wait-Process -id "$id" -TimeOut 3 -ErrorAction SilentlyContinue
}
Get-Process -name yarpserver  -ErrorAction Ignore| Stop-Process
# get rid of any survivers
Get-Process -name yarp*  -ErrorAction Ignore | Stop-Process -force

