	rem -------------------------------------------------------------------------------------------------
rem  Use the Hubitat Maker API to interrogate the value of virtual switch  (Smart home action needed)
rem  Use curl in Windows to execute a URL for the specific device in Hubitat - device ID: 1658
rem  The results are a string that can be read from StdOut
rem -------------------------------------------------------------------------------------------------
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "                  " & Wscript.ScriptName
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "Script path: " & Wscript.ScriptFullName

Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
Wscript.Echo myPath

rem Choose your path:
rem myPath = "D:\Dropbox"
rem myPath = "C:\Users\herbk\Dropbox"

rem -------------------------------------------------------------------------------------------------
rem                                     Get current value from Hubitat API
rem ------------------------------------------------------------------------------------------------
Dim curlCMD
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1658?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
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

rem WScript.Echo "current value: " + currentValue
If currentValue = "off" Then
  WScript.Echo "Nothing to do"
else
  WScript.Echo "Do something"
rem =============================================================================
rem                     Use curl to turn the virtual switch off
rem =============================================================================
  curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1658/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  oShell.Exec(curlCommand)
  prepareForAction
  oShell.Run myPath+"\PcControl\TimedAction\actionLogging.bat - Shortcut",0,true
End If

rem =============================================================================
rem =============================================================================
rem                              Prepare for Action
rem =============================================================================
rem =============================================================================
Sub prepareForAction
  rem =============================================================================
  rem         Format the results for Google sheets   (replace spaces with +)
  rem =============================================================================
  scriptName = "Script name: " & Wscript.ScriptName
  If currentValue = "forceRun" Then
    scriptName = "(forceRun) " + scriptName
  End If
  Dim formatedScriptName
  For pos = 1 to len(scriptName)
    c = Mid(scriptName, pos, 1)
    If c = " " Then
      c = "+"
    End If
    formatedScriptName = formatedScriptName + c
  Next 

  rem ===========================================================================
  rem                    Read local file to get the action ID/Counter
  rem
  rem Note: move counters to Desktop to avoid Dropbox activity
  rem ===========================================================================
  rem timedActionCountFile = myPath+"\PcControl\TimedAction
  actionIdFile = "C:\Users\herbk\Desktop\counters\actionID.txt"
 
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set f = fso.OpenTextFile(actionIdFile)

  Do Until f.AtEndOfStream
    rem WScript.Echo f.ReadLine
    actionID = f.ReadLine
    WScript.Sleep 500
  Loop
  f.Close

  rem 1 - read
  rem 2 - write
  rem 8 - append
  rem true - new file created

  rem ==========================================================================
  rem            Write local file to save the action ID/counter
  rem ==========================================================================
  Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(actionIdFile,2,true)
  rem WScript.Echo "actionCounter = " & actionCounter
  newActionID = actionID + 1

  objFileToWrite.WriteLine(newActionID)
  objFileToWrite.Close
  Set objFileToWrite = Nothing

  rem =============================================================================
  rem         set Environmental variables for next action
  rem =============================================================================
  Set wshSystemEnv = oShell.Environment("Process")
  wshSystemEnv("notesActionBegins") = formatedScriptName
  wshSystemEnv("actionID") = actionID

  rc = loopCounter ("C:\Users\herbk\Desktop\counters\loop1Counter.txt", "loop1Counter")
  rc = loopCounter ("C:\Users\herbk\Desktop\counters\loop2Counter.txt", "loop2Counter")
  rc = loopCounter ("C:\Users\herbk\Desktop\counters\loop3Counter.txt", "loop3Counter")

End Sub  

rem =============================================================================
rem
rem =============================================================================
Function loopCounter (fileName, nameOfEnvironmentalVariable)
  rem =============================================================================
  rem                  Get Environmental Variable(s) from parent process
  rem =============================================================================
  Set oShell = WScript.CreateObject ("WScript.shell")
  Wscript.Echo " Got here - 1a"
  Wscript.Echo "fileName = " + fileName
  rem ===========================================================================
  rem                    Read file to get the count
  rem ===========================================================================
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set f = fso.OpenTextFile(fileName)

  Do Until f.AtEndOfStream
    rem WScript.Echo f.ReadLine
    count = f.ReadLine
    WScript.Sleep 500
  Loop
  f.Close
  Wscript.Echo " Got here - 1b"
  WScript.Echo "count = " & count
  rem =============================================================================
  rem                  Pass parameters using Environmental variable(s)
  rem =============================================================================
  Set wshSystemEnv = oShell.Environment("Process")
  wshSystemEnv (nameOfEnvironmentalVariable) = count
  Wscript.Echo " Got here - 1c"
  Wscript.Echo "nameOfEnvironmentalVariable = " + nameOfEnvironmentalVariable
End Function


WScript.Quit