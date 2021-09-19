rem -----------------------------------------------------------------------------------------------
rem Look at each action
rem Note: Synchronous/asynchronous execution is controlled by the 3rd parameter of the Run method 
rem       Set that parameter to True to run the command synchronously:
rem (2nd parameter controls the window style)
rem  Set to true to Avoid a quick OPEN / CLOSE reporting the CLOSE before the OPEN
rem ----------------------------------------------------------------------------------------------
Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
rem Wscript.Echo myPath
rem WScript.Echo "-----------------------"
rem WScript.Echo "Security Roll Call"
rem WScript.Echo "-----------------------"
Set oShell = WScript.CreateObject ("WScript.shell")
Dim sleepTime
sleepTime = 500
rem WScript.Sleep sleepTime
rem WScript.Sleep 10000
  oShell.Run myPath+"\PcControl\SecurityLog\FrontDoorOPEN.vbs",0,true
  oShell.Run myPath+"\PcControl\SecurityLog\FrontDoorCLOSED.vbs",0,false
  oShell.Run myPath+"\PcControl\SecurityLog\BackDoorOPEN.vbs",0,true
  oShell.Run myPath+"\PcControl\SecurityLog\BackDoorCLOSED.vbs",0,false
  oShell.Run myPath+"\PcControl\SecurityLog\GarageDoorOPEN.vbs",0,false
  oShell.Run myPath+"\PcControl\SecurityLog\GarageDoorCLOSED.vbs",0,false
  oShell.Run myPath+"\PcControl\SecurityLog\OutsideFrontMotionDETECTED.vbs",0,false
  oShell.Run myPath+"\PcControl\SecurityLog\OutsideFrontMotionSTOPPED.vbs",0,false
  oShell.Run myPath+"\PcControl\SecurityLog\OutsideBackMotionDETECTED.vbs",0,false
  oShell.Run myPath+"\PcControl\SecurityLog\OutsideBackMotionSTOPPED.vbs",0,false
