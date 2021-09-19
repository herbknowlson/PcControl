rem -------------------------------------------------------------------------------------------------
rem  Use a file to hold dashboard variables like Loop1Counter etc.
rem -------------------------------------------------------------------------------------------------
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "            Script name: " & Wscript.ScriptName
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "Script path: " & Wscript.ScriptFullName

Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
Wscript.Echo myPath

rem =============================================================================
rem        Hard code for testing 
rem =============================================================================
rem currentValue = "forceRun"
rem myPath="D:\Dropbox"
rem myPath="C:\Users\herbk\Dropbox"

  rem 1 - read
  rem 2 - write
  rem 8 - append
  rem true - new file created

rem =============================================================================
rem                  Get Environmental Variable(s) from parent process
rem =============================================================================
Wscript.Echo " Got here - 1a"
Set oShell = WScript.CreateObject ("WScript.shell")
fileName = oShell.Environment("Process").Item("fileName")
Wscript.Echo "fileName = " + fileName

  rem ===========================================================================
  rem                    Read local file to get the action counter
  rem ===========================================================================
  rem actionCounterFile = myPath+"\PcControl\Dashboard\CounterFile.txt"

  Set fso = CreateObject("Scripting.FileSystemObject")
  Set f = fso.OpenTextFile(fileName)

  Do Until f.AtEndOfStream
    rem WScript.Echo f.ReadLine
    actionCounter = f.ReadLine
    WScript.Sleep 500
  Loop
  f.Close

  rem 1 - read
  rem 2 - write
  rem 8 - append
  rem true - new file created

  rem ==========================================================================
  rem            Write local file to save the actioncounter
  rem ==========================================================================
  Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(fileName,2,true)
  WScript.Echo "actionCounter = " & actionCounter
  actionCounter = actionCounter + 1

  objFileToWrite.WriteLine(actionCounter)
  objFileToWrite.Close
  Set objFileToWrite = Nothing

WScript.Quit