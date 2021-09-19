rem ==================================================================================
rem                        Prepare the log file
rem ==================================================================================
Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
logFile = myPath+"\PcControl\DeviceManagment\GetValueBatteryLevel\3-MAIN.log"

rem 1 - read
rem 2 - write
rem 8 - append
rem true - create new file

Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(logFile,2,true)

objFileToWrite.WriteLine(FormatDateTime(Now))
objFileToWrite.Close
Set objFileToWrite = Nothing

rem ==================================================================================
rem                    Get the battery level for various devices
rem ==================================================================================

Set oShell = WScript.CreateObject ("WScript.shell")
fieldName = "label"
attributeName = "battery"

rem ==================================================================================
rem                        Read data file for the device IDs
rem ==================================================================================
dataFile = myPath+"\PcControl\DeviceManagment\GetValueBatteryLevel\DATA2.txt"

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
  rem oShell.Run myPath+"\PcControl\DeviceManagment\GetValueBatteryLevel\GetDeviceValue.vbs "+deviceID+" "+fieldName+" "+attributeName

rem ------------------------------------------------------------------  
rem     Note: 3 values are passed using Environmental variables
rem ------------------------------------------------------------------
  Set wshSystemEnv = oShell.Environment( "Process" )
  wshSystemEnv("deviceID") = deviceID
  wshSystemEnv("fieldName") = fieldName
  wshSystemEnv("attributeName") = attributeName

  oShell.Run myPath+"\PcControl\DeviceManagment\GetValueBatteryLevel\GetDeviceValue.vbs",0,true
  WScript.Sleep 500
Loop

f.Close

rem =============================================================================
rem                              Write the final results
rem =============================================================================
rem WScript.Sleep 500
rem logFile = myPath+"\PcControl\DeviceManagment\GetValueBatteryLevel\3-MAIN.log"

rem 1 - read
rem 2 - write
rem 8 - append
rem true - new file created

rem Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(logFile,8,true)

rem data = "deviceCount = " & deviceCount
rem objFileToWrite.WriteLine(data)
rem objFileToWrite.Close
rem Set objFileToWrite = Nothing

rem oShell.Run myPath+"\PcControl\DeviceManagment\GetValueBatteryLevel\4-DONE.bat",0,false


rem ==================================================================================
rem                       Open the log file in notepad
rem ==================================================================================
rem WScript.Sleep 1000
rem oShell.Run("notepad.exe "+myPath+"\PcControl\DeviceManagment\GetValueBatteryLevel\3-MAIN.log")

                            