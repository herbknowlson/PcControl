rem -------------------------------------------------------------------------------------------------
rem                     Use a file to hold dashboard variables like Loop1Counter etc.
rem -------------------------------------------------------------------------------------------------
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "                   " & Wscript.ScriptName
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "Script path: " & Wscript.ScriptFullName

rem =============================================================================
rem                  Get Environmental Variable(s) from parent process
rem =============================================================================
Set oShell = WScript.CreateObject ("WScript.shell")
fileName = oShell.Environment("Process").Item("fileName")
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

rem 1 - read
rem 2 - write
rem 8 - append
rem true - new file created
rem ==========================================================================
rem            Write file to save the new count
rem ==========================================================================
Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(fileName,2,true)
WScript.Echo "count = " & count
count = 0
objFileToWrite.WriteLine(count)
objFileToWrite.Close
Set objFileToWrite = Nothing

WScript.Quit