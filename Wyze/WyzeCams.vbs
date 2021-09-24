rem -------------------------------------------------------------------------------------------------
rem     Use the Hubitat Maker API to set the value of an outlet (Wyze cam east outlet) (Wyze cam east outlet)
rem  Use curl in Windows to execute a URL for the specific device in Hubitat - device ID: 1650, 1651
rem  The results are a string that can be read from StdOut
rem -------------------------------------------------------------------------------------------------
rem WScript.Echo "-------------------------------------------------------------"
rem Wscript.Echo "            Script name: " & Wscript.ScriptName
rem WScript.Echo "-------------------------------------------------------------"
rem Wscript.Echo "Script path: " & Wscript.ScriptFullName

Set oShell = WScript.CreateObject ("WScript.shell")

myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
rem Wscript.Echo myPath
hubitatIp = CreateObject("WScript.Shell").Environment("Process").Item("hubitatIp")

oShell.Run myPath+"\PcControl\Wyze\DoingSomething.jpg"
  rem ----------------------------
  rem       Turn outlet off
  rem ----------------------------
  curlCommand = "curl " + hubitatIp + "apps/api/1376/devices/1650/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  rem Set oExec = oShell.Exec(curlCommand)
  oShell.Run "cmd /c " + curlCommand, 0, True

  curlCommand = "curl " + hubitatIp + "apps/api/1376/devices/1651/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  rem Set oExec = oShell.Exec(curlCommand)
  oShell.Run "cmd /c " + curlCommand, 0, True


  rem ----------------------------
  rem       wait 5 seconds
  rem ----------------------------
  WScript.Sleep 5000
  rem ----------------------------
  rem       Turn outlet on
  rem ----------------------------
  curlCommand = "curl " + hubitatIp + "apps/api/1376/devices/1650/on?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  rem Set oExec = oShell.Exec(curlCommand)
  oShell.Run "cmd /c " + curlCommand, 0, True

  curlCommand = "curl " + hubitatIp + "apps/api/1376/devices/1651/on?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  rem Set oExec = oShell.Exec(curlCommand) 
  oShell.Run "cmd /c " + curlCommand, 0, True

  
  oShell.Run myPath+"\PcControl\Wyze\4-DONE_WAITING.bat"
  rem -------------------------------------------
  rem       wait 40 seconds for camera to reboot
  rem -------------------------------------------  
  WScript.Sleep 40000
  rem WScript.Sleep 10000
  rem -------------------------------------------
  rem       run VLC
  rem ------------------------------------------- 
  oShell.Run myPath+"\PcControl\Wyze\rtsp-east.lnk"

WScript.Quit