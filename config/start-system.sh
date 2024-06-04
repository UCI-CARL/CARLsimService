
if [[ "$CARLSIMPP_YARPSERVER" -eq 1 ]]; then
  echo "start yarpserver"
  #yarpserver &
  lxterminal -e 'yarpserver; bash' 
  sleep 1
fi

# lxterminal -e bash -l -c 'yarpserver; bash'
# lxterminal -e bash -l -c 'yarp; bash'

#if($env:CARLSIMPP_YARPLOGGER ) { 
#  $yarplogger = start-process -FilePath yarplogger -ArgumentList '--start' -PassThru
#}
if [[ "$CARLSIMPP_YARPLOGGER" -eq 1 ]]; then
  echo "start yarplogger"
  lxterminal -e 'yarplogger --start; bash'
  # [ERROR] |yarp.os.Property| cannot read from yarprunLogger.ini
  sleep 1
fi

#if($env:CARLSIMPP_YARPRUN_EDGE) { 
#  $yarprun_edge = start-process -FilePath yarprun -ArgumentList '--server /win-edge --log /yarplogger' -PassThru
#} 
if [[ "$CARLSIMPP_YARPRUN_EDGE" -eq 1 ]]; then
  echo "start yarprun /win-edge"
  lxterminal -e "yarprun --server /win-edge --log /yarplogger; bash"
fi

#if($env:CARLSIMPP_YARPRUN_GPU ) { 
#  $yarprun_gpu = start-process -FilePath yarprun -ArgumentList '--server /win-gpu --log /yarplogger' -PassThru
#}
if [[ "$CARLSIMPP_YARPRUN_GPU" -eq 1 ]]; then
  echo "start yarprun /win-gpu"
  lxterminal -e "yarprun --server /win-gpu --log /yarplogger; bash"
fi

#if($env:CARLSIMPP_YARPRUN_YARP) { 
#  $yarprun_yarp = start-process -FilePath yarprun -ArgumentList '--server /win-yarp --log /yarplogger' -PassThru
#}
if [[ "$CARLSIMPP_YARPRUN_YARP" -eq 1 ]]; then
  echo "start yarprun /win-yarp"
  lxterminal -e "yarprun --server /win-yarp --log /yarplogger; bash"
fi


#if($env:CARLSIMPP_YARPMANANGER) { 
#  # if --WorkingDirectory 'yarp' is neccessary for yarpmanger to find its application then YARP_DATA_DIR is wrong 
#  $yarprun_yarpmanager = start-process -FilePath yarpmanager -ArgumentList "--from ymanager${env:CARLSIMPP_CLASS_SUFFIX}.ini" -PassThru
#}

if [[ "$CARLSIMPP_YARPMANANGER" -eq 1 ]]; then
  sleep 2
  echo "start yarpmanager"
  #lxterminal -e 'yarpmanager --from ymanager${CARLSIMPP_CLASS_SUFFIX}.ini; bash'
  #lxterminal -e "yarpmanager --from /home/ln/carlsimpp-t01/build/install/config/yarp/ymanager-t.ini; bash"
  #lxterminal -e "yarpmanager --from ymanager-t.ini"
  # lower case: ${CARLSIMPP_CLASS_SUFFIX,,}    
  # lxterminal -e "yarpmanager --from ymanager-${CARLSIMPP_CLASS_SUFFIX,,}.ini"
  # Fixed in setenv_ T vs t
  # Fixed in setenv_ suffix lacks -
  # YARP_DATA_DIR has no effect if set in calling shell
  lxterminal -e "yarpmanager --from ymanager${CARLSIMPP_CLASS_SUFFIX}.ini"
fi

 



