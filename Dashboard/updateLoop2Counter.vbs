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
rem Set oShell = WScript.CreateObject ("WScript.shell")
rem fileName = oShell.Environment("Process").Item("fileName")
fileName = "C:\Users\herbk\Desktop\counters\loop2Counter.txt"
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

count = count + 1
WScript.Echo "count = " & count
objFileToWrite.WriteLine(count)
objFileToWrite.Close
Set objFileToWrite = Nothing

WScript.Quit