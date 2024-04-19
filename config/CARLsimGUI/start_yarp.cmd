REM Shortcut
REM Target: 	%SystemRoot%\system32\cmd.exe /E:ON /V:ON /k C:\Test\SpikeStream-0.3.0\start_yarp.cmd
REM Start in: 	C:\Test\SpikeStream-0.3.0
@ECHO OFF
ECHO Startup the Yarp System 
start yarpserver
REM wait 10
ECHO Startup the NC Financial Genes DB (OLAP)
start yarpdev -v --device NcFinGeneDb --schema test20130726
ECHO Startup the FinSpikes TradeServer (MT5 Compatible Mode)
start yarpdev -v --device FinSpikesTs
REM wait 10
yarp connect --persist /mt5w/1.1 /finspikes/inbound/ticks     
yarp connect --persist /mt5w/1.1 /finspikes/inbound/tickinds  
yarp connect --persist /mt5w/1.1 /finspikes/inbound/books     
yarp connect --persist /mt5w/1.1 /finspikes/inbound/barinds   
yarp connect --persist /mt5w/1.1 /finspikes/inbound/bars   
yarp connect --persist /mt5w/1.1 /nc/tick/debugger
yarp connect --persist /mt5w/1.1 /finspikes/ts/inbound
yarp connect --persist /finspikes/ts/outbound /finspikes/inbound/trades    
REM pause
exit



