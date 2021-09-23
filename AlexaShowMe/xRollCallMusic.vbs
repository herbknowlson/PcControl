rem -------------------------------------------------------------------------------------------------
rem  Use the Hubitat Maker API to interrogate the value of virtual switch  (show me the music)
rem  Use curl in Windows to execute a URL for the specific device in Hubitat - device ID: 1625 
rem  The results are a string that can be read from StdOut
rem -------------------------------------------------------------------------------------------------
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "            Script name: " & Wscript.ScriptName
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "Script path: " & Wscript.ScriptFullName

myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
Wscript.Echo myPath
hubitatIp = CreateObject("WScript.Shell").Environment("Process").Item("hubitatIp")

curlCommand = "curl " + hubitatIp + "api/1376/devices/1625?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
Set oShell = WScript.CreateObject ("WScript.shell")
Set oExec = oShell.Exec(curlCommand)
Wscript.Echo "Got here 1"
 
Do While oExec.Status = 0
  WScript.Sleep 500
Loop
Do While Not oExec.StdOut.AtEndOfStream 
  Wscript.Echo "Got here 2"
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
  curlCommand = "curl " + hubitatIp + "apps/api/1376/devices/1625/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  oShell.Exec(curlCommand)
  oShell.Run myPath+"\PcControl\AlexaShowMe\music.bat - Shortcut.lnk",0,false
End If

WScript.Quit