rem --------------------------------------------------
rem Look at each action
rem --------------------------------------------------
rem WScript.Echo "-----------------------"
rem WScript.Echo "Show me Roll Call"
rem WScript.Echo "-----------------------"
Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
rem Wscript.Echo myPath

Set oShell = WScript.CreateObject ("WScript.shell")
rem WScript.Sleep 10000

rem oShell.Run myPath+"\PcControl\AlexaShowMe\RollCallWeather.vbs",0,false
rem WScript.Sleep 1000
oShell.Run myPath+"\PcControl\AlexaShowMe\RollCallCameras.vbs",0,false
WScript.Sleep 1000
oShell.Run myPath+"\PcControl\AlexaShowMe\RollCallMusic.vbs",0,false
WScript.Sleep 1000
oShell.Run myPath+"\PcControl\AlexaShowMe\RollCallCalendar.vbs",0,false
WScript.Sleep 1000
oShell.Run myPath+"\PcControl\SecurityStatus\RollCallSecurityStatus.vbs",0,false

                   

