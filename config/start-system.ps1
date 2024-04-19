

if($env:CARLSIMPP_YARPSERVER) { 
  $yarpserver = start-process -FilePath yarpserver -PassThru 
}  

if($env:CARLSIMPP_YARPLOGGER ) { 
  $yarplogger = start-process -FilePath yarplogger -ArgumentList '--start' -PassThru
}

if($env:CARLSIMPP_YARPRUN_EDGE) { 
  $yarprun_edge = start-process -FilePath yarprun -ArgumentList '--server /win-edge --log /yarplogger' -PassThru
} 

if($env:CARLSIMPP_YARPRUN_GPU ) { 
  $yarprun_gpu = start-process -FilePath yarprun -ArgumentList '--server /win-gpu --log /yarplogger' -PassThru
}

if($env:CARLSIMPP_YARPRUN_YARP) { 
  $yarprun_yarp = start-process -FilePath yarprun -ArgumentList '--server /win-yarp --log /yarplogger' -PassThru
}

if($env:CARLSIMPP_YARPMANANGER) { 
  # if --WorkingDirectory 'yarp' is neccessary for yarpmanger to find its application then YARP_DATA_DIR is wrong 
  $yarprun_yarpmanager = start-process -FilePath yarpmanager -ArgumentList "--from ymanager${env:CARLSIMPP_CLASS_SUFFIX}.ini" -PassThru
}

 



