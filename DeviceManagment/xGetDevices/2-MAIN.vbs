rem ==================================================================================
rem                  Produce a device Inventory                
rem ==================================================================================
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "                   " & Wscript.ScriptName
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "Script path: " & Wscript.ScriptFullName

rem ------------------------------------------------------------------------
rem                         Get the path for this process
rem ------------------------------------------------------------------------
Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath") 
logFile = myPath+"\PcControl\DeviceManagment\GetDevices\3-MAIN.log"

rem =============================================================================
rem                            Write preliminary results
rem =============================================================================
rem 1 - read
rem 2 - write
rem 8 - append
rem true - create new file

Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(logFile,2,true)
objFileToWrite.WriteLine(FormatDateTime(Now))
objFileToWrite.Close
Set objFileToWrite = Nothing

rem ==================================================================================
rem                        Select what data you want
rem ==================================================================================
rem                   Determine what fields to show values for
rem  Note: Start with label
rem 
rem  Consider doing a sequential search
rem ==================================================================================
rem fieldName = "label"
rem attributeName = "battery"
rem ==================================================================================
rem                        Read input data file for the device IDs
rem ==================================================================================
rem dataFile = myPath+"\PcControl\DeviceManagment\GetDevices\InputDATA.txt"
rem Set fso = CreateObject("Scripting.FileSystemObject")
rem Set f = fso.OpenTextFile(dataFile)

rem ==================================================================================
rem                               M A I N     L O O P  
rem ==================================================================================
rem ------------------------------------------------------
rem    Call VBS to get main results
rem ------------------------------------------------------
  Set oShell = WScript.CreateObject ("WScript.shell")
rem -----------------------------------------------------------------------------------------------
rem Synchronous/asynchronous execution is controlled by the 3rd parameter of the Run method 
rem (2nd parameter controls the window style). Set that parameter to True to run the command synchronously:
rem -----------------------------------------------------------------------------------------------
  oShell.Run myPath+"\PcControl\DeviceManagment\GetDevices\GetDevices.vbs",0,true 
rem Loop

rem =============================================================================
rem                              Write final results
rem =============================================================================
WScript.Sleep 500

rem 1 - read
rem 2 - write
rem 8 - append
rem true - new file created

rem Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(logFile,8,true)

rem data = "deviceCount = " & deviceCount
data = "--------- Final Results ----------------"
rem objFileToWrite.WriteLine(data)
rem objFileToWrite.Close
rem Set objFileToWrite = Nothing

rem oShell.Run myPath+"\PcControl\DeviceManagment\GetValue\4-DONE.bat",0,false


rem ==================================================================================
rem                       Open the log file in notepad
rem ==================================================================================
rem WScript.Sleep 1000
oShell.Run("notepad.exe "+logFile)

WScript.Quit

                            