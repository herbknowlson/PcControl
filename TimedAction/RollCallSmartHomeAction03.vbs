rem -------------------------------------------------------------------------------------------------
rem  Use the Hubitat Maker API to interrogate the value of virtual switch  (Smart home action needed)
rem  Use curl in Windows to execute a URL for the specific device in Hubitat - device ID: 1658
rem  The results are a string that can be read from StdOut
rem -------------------------------------------------------------------------------------------------
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "            Script name: " & Wscript.ScriptName
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "Script path: " & Wscript.ScriptFullName

Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
Wscript.Echo myPath

Dim curlCMD
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1658?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
Set oShell = WScript.CreateObject ("WScript.shell")
Set oExec = oShell.Exec(curlCommand)
rem WScript.Sleep 10000 'Sleeps for 10 seconds
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
rem force it to do something
rem currentValue = "on"
notes = "Script name: " & Wscript.ScriptName

rem =============================================================================
rem Format the results for Google sheets   (replace spaces with +)
rem =============================================================================

Dim newNotes
For pos = 1 to len(notes)
  c = Mid(notes, pos, 1)
  If c = " " Then
    c = "+"
  End If
  newNotes = newNotes + c
Next 


Set wshSystemEnv = oShell.Environment( "Process" )
wshSystemEnv("notesAction03") = newNotes


WScript.Echo "current value: " + currentValue
If currentValue = "off" Then
  WScript.Echo "Nothing to do"
else
  WScript.Echo "Do something"
  oShell.Run "C:\Users\herbk\Dropbox\PcControl\SmartHomeTimer\action03.bat",0,false
  curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1658/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  oShell.Exec(curlCommand)
End If

WScript.Quit