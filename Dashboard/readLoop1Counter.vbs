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
rem =============================================================================
rem                  Pass parameters using Environmental variable(s)
rem =============================================================================
Set wshSystemEnv = oShell.Environment("Process")
wshSystemEnv("loop1Counter") = count
Wscript.Echo " Got here - 1c"


WScript.Quit