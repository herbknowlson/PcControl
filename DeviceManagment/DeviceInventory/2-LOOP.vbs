rem ==================================================================================
rem                  Produce a device Inventory
rem 
rem  Note: Use DATA.txt for know device IDs
rem
rem     rem Consider doing a sequential search                   
rem ==================================================================================
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "                   " & Wscript.ScriptName
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "Script path: " & Wscript.ScriptFullName

rem =============================================================================
rem                              Set the full path
rem =============================================================================
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")

rem Choose your path for testing
rem set myPath="D:\Dropbox"
rem myPath="C:\Users\herbk\Dropbox"

fullPath = myPath+"\PcControl\DeviceManagment\DeviceInventory"
rem WScript.Echo "fullPath = " + fullPath

Set oShell = WScript.CreateObject ("WScript.shell")
Set wshSystemEnv = oShell.Environment( "Process" )
wshSystemEnv("fullPath") = fullPath

rem =============================================================================
rem                              Write preliminary results
rem =============================================================================
fullPath = CreateObject("WScript.Shell").Environment("Process").Item("fullPath")
logFile = fullPath+"\3-MAIN.log"
WScript.Echo "logFile = " + logFile

rem 1 - read
rem 2 - write
rem 8 - append
rem true - create new file
Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(logFile,2,true)
objFileToWrite.WriteLine(FormatDateTime(Now))
objFileToWrite.Close
Set objFileToWrite = Nothing

rem ==================================================================================
rem                   Determine what fields to show values for
rem
rem  Note: Start with label
rem ==================================================================================

fieldName = "label"
attributeName = "battery"

rem ==================================================================================
rem                        Read data file for the device IDs
rem ==================================================================================
dataFile = fullPath+"\DATA3.txt"
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.OpenTextFile(dataFile)

rem ==================================================================================
rem                        M A I N     L O O P
rem ==================================================================================
Dim deviceCount
Do Until f.AtEndOfStream
  rem WScript.Echo f.ReadLine
  deviceID = f.ReadLine
  deviceCount = deviceCount + 1
  rem oShell.Run myPath+"\PcControl\DeviceManagment\GetValueInventory\GetDeviceValue.vbs "+deviceID+" "+fieldName+" "+attributeName,0,true
  oShell.Run fullPath+"\GetDeviceValue.vbs "+deviceID+" "+fieldName+" "+attributeName,0,true
  WScript.Sleep 100
Loop

f.Close

rem =============================================================================
rem                  Write the final results to a Google form/sheet
rem =============================================================================
rem WScript.Sleep 500

rem 1 - read
rem 2 - write
rem 8 - append
rem true - new file created

Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(logFile,8,true)

data = "deviceCount = " & deviceCount
objFileToWrite.WriteLine(data)
objFileToWrite.Close
Set objFileToWrite = Nothing

rem oShell.Run myPath+"\PcControl\DeviceManagment\GetValue\4-DONE.bat",0,false

rem ==================================================================================
rem                            Open the log file in notepad
rem ==================================================================================
rem WScript.Sleep 1000
oShell.Run("notepad.exe "+logFile)

                            