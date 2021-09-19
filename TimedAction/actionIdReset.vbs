rem -------------------------------------------------------------------------------------------------
rem                                          Reset the Action ID
rem -------------------------------------------------------------------------------------------------
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "                  " & Wscript.ScriptName
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "Script path: " & Wscript.ScriptFullName

Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
Wscript.Echo myPath

rem =============================================================================
rem         For testing force it to do something 
rem =============================================================================
rem currentValue = "forceRun"
rem myPath="D:\Dropbox"
rem myPath="C:\Users\herbk\Dropbox"

  rem 1 - read
  rem 2 - write
  rem 8 - append
  rem true - new file created

  rem ==========================================================================
  rem            Write local file to save the action ID/counter
  rem ==========================================================================
  actionIdFile = "C:\Users\herbk\Desktop\counters\actionID.txt"
 
  Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(actionIdFile,2,true)
  newActionID = 1

  objFileToWrite.WriteLine(newActionID)
  objFileToWrite.Close
  Set objFileToWrite = Nothing

  rem =============================================================================
  rem         set Environmental variables for next action
  rem =============================================================================
  Set oShell = WScript.CreateObject ("WScript.shell")
  Set wshSystemEnv = oShell.Environment("Process")
  wshSystemEnv("actionID") = newActionID

WScript.Quit