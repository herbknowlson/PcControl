rem -------------------------------------------------------------------------------------------------
rem  Use the Hubitat Maker API to interrogate the value of virtual switch (DoSomething)
rem  Use curl in Windows to execute a URL for the specific device in Hubitat - device ID: 1667
rem  The results are a string that can be read from StdOut
rem -------------------------------------------------------------------------------------------------
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "                  " & Wscript.ScriptName
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "Script path: " & Wscript.ScriptFullName

Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
Wscript.Echo myPath

rem -------------------------------------------------------------------------------------------------
rem                                     Get current value from Hubitat API
rem ------------------------------------------------------------------------------------------------
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1667?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
Set oShell = WScript.CreateObject ("WScript.shell")
Set oExec = oShell.Exec(curlCommand)

Do While oExec.Status = 0
  WScript.Sleep 100

Loop
rem -------------------------------------------------------------------------------------------------
rem                  Note: The results are a long string that can be read from StdOut
rem
rem {"id":"1658","name":"Smart home action needed","label":"Smart home action needed","type":"Virtual Switch","attributes":[{"name":"switch","currentValue":"off","dataType":"ENUM","values":["on","off"]}],"capabilities":["Switch",{"attributes":[{"name":"switch","dataType":null}]},"Refresh"],"commands":["off","on","refresh"]}
rem -------------------------------------------------------------------------------------------------
Do While Not oExec.StdOut.AtEndOfStream
  strLine = oExec.StdOut.ReadLine
rem -------------------------------------------------------------------------------------------------------------------------------
rem  You need to look for a particular string "currentValue" that occurs just before the value you want "off" in the above example
rem -------------------------------------------------------------------------------------------------------------------------------
  iPos = InStr(1, strLine, "currentValue", 1)
  If iPos > 1 Then
    currentValue = Mid(strLine, iPos + 15,3)
    Exit Do
  End If
Loop
rem =============================================================================
rem         For testing force it to do something 
rem =============================================================================
rem currentValue = "forceRun"
WScript.Echo "current value: " + currentValue
If currentValue = "off" Then
  WScript.Echo "Nothing to do"
else
  WScript.Echo "Do something"
  rem =============================================================================
  rem                     Use curl to turn the virtual switch off
  rem =============================================================================
  curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1667/off?access_token=6c5d7775-2d6a-4786-ae45- 3942346fd0d5"
  oShell.Exec(curlCommand)
  
rem -----------------------------------------------
rem                NOW DO SOMETHING
rem -----------------------------------------------
  oShell.Run myPath+"3-DO_SOMETHING.vbs",0,false

End If                        