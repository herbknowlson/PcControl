rem ===========================================================================
rem                    Read local file in json and various formats and parse it
rem ===========================================================================
rem  theFile = "output.txt"
rem  theFile = "output1695.txt"
  theFile = "results.txt"
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set f = fso.OpenTextFile(theFile)
    strLine = f.ReadLine
    currentValue = Replace(strLine," ","+")
    rem WScript.Echo "currentValue = " & currentValue
    rem ------------------=-----------------------------
    rem Set the Variable in Hubitat
    rem Note: you will need the device(HowMuchUpTime) ID(2087)
    rem ----------------------------------=-------------     
    Set oShell = WScript.CreateObject ("WScript.shell")
    curlCommand = "curl http://192.168.1.64/apps/api/1376/devices/2089/setVariable/" + currentValue + "?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
    rem curlCommand = "curl http://192.168.1.64/apps/api/1376/devices/2087/setVariable/testing?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
    rem WScript.Echo curlCommand
    oShell.Exec(curlCommand)  
    rem
    rem -------------------------
    rem turn the results switch ON
    rem -------------------------
    curlCommand = "curl http://192.168.1.64/apps/api/1376/devices/2073/on?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"  
    oShell.Exec(curlCommand)
    f.Close
  WScript.Quit