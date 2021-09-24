rem -------------------------------------------------------------------------------------------------
rem  Use the Hubitat Maker API to interrogate the value of virtual switch  (Security log - front door OPEN))
rem  Use curl in Windows to execute a URL for the specific device in Hubitat - device ID: 1627 
rem  The results are a string that can be read from StdOut
rem -------------------------------------------------------------------------------------------------
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "            Script name: " & Wscript.ScriptName
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "Script path: " & Wscript.ScriptFullName

myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
Wscript.Echo myPath
hubitatIp = CreateObject("WScript.Shell").Environment("Process").Item("hubitatIp")

Dim curlCMD
curlCommand = "curl "+ hubitatIp + "apps/api/1376/devices/1627?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
Set oShell = WScript.CreateObject ("WScript.shell")
Set oExec = oShell.Exec(curlCommand)

Do While oExec.Status = 0
  WScript.Sleep 100
Loop
Do While Not oExec.StdOut.AtEndOfStream
  strLine = oExec.StdOut.ReadLine
  iPos = InStr(1, strLine, "currentValue", 1)
  If iPos > 1 Then
    currentValue = Mid(strLine, iPos + 15,3)
    Exit Do
  End If
Loop
WScript.Echo "current value: " + currentValue
If currentValue = "off" Then
WScript.Echo "Nothing to do"
else
  WScript.Echo "Do something"
  curlCommand = "curl "+ hubitatIp + "apps/api/1376/devices/1627/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  oShell.Exec(curlCommand)
  oShell.Run myPath+"\PcControl\SecurityLog\FrontDoorOPEN.bat - Shortcut.lnk",0,true
  rem oShell.Run "D:\Dropbox\PcControl\SecurityLog\FrontDoorOPEN.bat"
End If

WScript.Quit