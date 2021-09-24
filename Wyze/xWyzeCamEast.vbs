rem -------------------------------------------------------------------------------------------------
rem     Use the Hubitat Maker API to set the value of an outlet (Wyze cam east outlet)
rem  Use curl in Windows to execute a URL for the specific device in Hubitat - device ID: 1650
rem  The results are a string that can be read from StdOut
rem -------------------------------------------------------------------------------------------------
rem WScript.Echo "-------------------------------------------------------------"
rem Wscript.Echo "            Script name: " & Wscript.ScriptName
rem WScript.Echo "-------------------------------------------------------------"
rem Wscript.Echo "Script path: " & Wscript.ScriptFullName

Set oShell = WScript.CreateObject ("WScript.shell")

Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
rem Wscript.Echo myPath

  rem ----------------------------
  rem       Turn outlet off
  rem ----------------------------
  curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1650/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  Set oExec = oShell.Exec(curlCommand)
  rem ----------------------------
  rem       wait 5 seconds
  rem ----------------------------
  WScript.Sleep 5000
  rem ----------------------------
  rem       Turn outlet on
  rem ----------------------------
  curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1650/on?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  Set oExec = oShell.Exec(curlCommand)
   
  oShell.Run myPath+"\PcControl\Wyze\DoingSomething.jpg"
  oShell.Run myPath+"\PcControl\Wyze\4-DONE_WAITING.bat"
  rem -------------------------------------------
  rem       wait 40 seconds for camera to reboot
  rem -------------------------------------------  
  WScript.Sleep 40000
  rem WScript.Sleep 10000
  rem -------------------------------------------
  rem       run VLC
  rem ------------------------------------------- 
  rem oShell.Run "C:\Users\herbk\Desktop\VLC.lnk "
  rem oShell.Run "C:\Users\herbk\Desktop\rtsp - east.lnk"
  oShell.Run myPath+"\PcControl\Wyze\rtsp-east.lnk"


WScript.Quit