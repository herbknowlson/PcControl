rem -------------------------------------------------------------------------------------------------
rem  Use the Hubitat Maker API to interrogate the value of virtual switch  (Alexa show me the dashboard)
rem  Use curl in Windows to execute a URL for the specific device in Hubitat - device ID: 1673
rem  The results are a string that can be read from StdOut
rem  Parse the string to find the current value
rem  If the switch is not off then do something
rem -------------------------------------------------------------------------------------------------
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "            Script name: " & Wscript.ScriptName
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "Script path: " & Wscript.ScriptFullName

myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
Wscript.Echo myPath
hubitatIp = CreateObject("WScript.Shell").Environment("Process").Item("hubitatIp")

curlCommand = "curl " + hubitatIp + "apps/api/1376/devices/1673?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
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
  curlCommand = "curl " + hubitatIp + "apps/api/1376/devices/1673/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  oShell.Exec(curlCommand)
  WScript.Echo "Do something"
  oShell.Run myPath+"\PcControl\AlexaShowMe\dashboard.bat - Shortcut.lnk",0
End If

WScript.Quit