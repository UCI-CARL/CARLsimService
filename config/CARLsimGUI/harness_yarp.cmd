REM Shortcut
REM Target: 	%SystemRoot%\system32\cmd.exe /E:ON /V:ON /k C:\Test\SpikeStream-0.3.0\harness_yarp.cmd
REM Start in: 	C:\Test\SpikeStream-0.3.0
@ECHO OFF
@ECHO Start Yarp Server 
start yarpserver
REM pause
@ECHO Startup YarpRun Server for UnitTesting (harness_nc) 
start yarprun --server /harness_nc 
 
@ECHO Start UnitTest
cd C:\Test\yarp-2.3.72.0-build\bin\Debug

set path=%path%;C:\Test\yarp-2.3.72.0-build\lib\yarp\Debug
echo %path%

REM harness_nc.exe verbose regression  FinSpikesTsTest FinSpikesTsE2eTest FinSpikesTsTestRandomWalk
REM harness_nc.exe verbose regression  TimestampTest FinGeneDbTest
harness_nc.exe verbose regression FinSpikesTsE2eTest

@ECHO  UnitTest returned %#
@ECHO  Start again with:
@ECHO  " "  
@ECHO     harness_nc.exe verbose regression  FinSpikesTsTest FinSpikesTsE2eTest
@ECHO  "  "

pause
REM exit



