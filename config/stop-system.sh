
echo "stop yarp module manager"
pkill yarpmanger  
sleep 2

echo "stop yarp devices"
pkill yarpdev 
sleep 1
 
echo "stop yarprun shells"
pkill yarprun
sleep 1

echo "stop yarplogger"
pkill yarplogger
sleep 1

echo "stop other yarp processes"
pkill yarp.*
sleep 1

echo "final cleanup yarp"
pkill -9 yarp.*
sleep 1
 
#ps -elf | grep -i yarp 
