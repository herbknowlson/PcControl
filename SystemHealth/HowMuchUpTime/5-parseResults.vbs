rem ===========================================================================
rem                    Read local file in json and various formats and parse it
rem ===========================================================================
rem  theFile = "output.txt"
rem  theFile = "output1695.txt"
  theFile = "results.txt"
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set f = fso.OpenTextFile(theFile)

rem  Do Until f.AtEndOfStream
rem    WScript.Echo f.ReadLine
    strLine = f.ReadLine
    currentValue = strLine
    WScript.Echo "currentValue = " & currentValue
    rem ------------------=-----------------------------
    rem If the value is good turn the results switch ON
    rem ----------------------------------=-------------
    rem if currentValue > 100 Then
    rem   WScript.Echo "value looks good"
    rem  curlCommand = "curl "+ "http://192.168.1.64/apps/api/1376/devices/2073/on?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
    rem ------------------=-----------------------------
    rem Set the Variable in Hubitat
    rem Note: you will need the device(HowMuchUpTime) ID(2087)
    rem ----------------------------------=-------------     
    Set oShell = WScript.CreateObject ("WScript.shell")
    curlCommand = "curl http://192.168.1.64/apps/api/1376/devices/2087/setVariable/" + trim(currentValue) + "?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
    WScript.Echo curlCommand
    oShell.Exec(curlCommand)  

    f.Close
    
WScript.Quit