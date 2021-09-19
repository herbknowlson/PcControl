rem -------------------------------------------------------------------------------------------------
rem          Read a file using paramters passed thru the Environment from the parent process
rem -------------------------------------------------------------------------------------------------
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "            Script name: " & Wscript.ScriptName
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "Script path: " & Wscript.ScriptFullName

rem =============================================================================
rem        Get the current path
rem =============================================================================
Dim myPath
myPath = CreateObject("WScript.Shell").Environment("ParentProcess").Item("myPath")
Wscript.Echo myPath

rem =============================================================================
rem                          Values hard coded for testing 
rem =============================================================================
rem currentValue = "forceRun"
rem myPath="D:\Dropbox"
rem myPath="C:\Users\herbk\Dropbox"
rem fileName = myPath+"\PcControl\Dashboard\CounterFile.txt"


rem =============================================================================
rem                  Get Environmental Variable(s) from parent process
rem =============================================================================
Wscript.Echo " Got here - 1a"
Set oShell = WScript.CreateObject ("WScript.shell")
fileName = oShell.Environment("Process").Item("fileName")
Wscript.Echo "fileName = " + fileName
rem 1 - read
rem 2 - write
rem 8 - append
rem true - new file created
rem ===========================================================================
rem                    Read local file
rem ===========================================================================

Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.OpenTextFile(fileName)

Do Until f.AtEndOfStream
  rem WScript.Echo f.ReadLine
  valueRead = f.ReadLine
  WScript.Sleep 500
Loop
f.Close
Set objFileToWrite = Nothing
Wscript.Echo " Got here - 1b"
Wscript.Echo "valueRead = " + valueRead

rem =============================================================================
rem                  Pass parameters using Environmental variable(s)
rem =============================================================================
Set wshSystemEnv = oShell.Environment("ParentProcess")
wshSystemEnv("valueRead") = valueRead
Wscript.Echo " Got here - 1c"
WScript.Quit