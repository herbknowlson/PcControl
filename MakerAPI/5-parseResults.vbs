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
rem -------------------------------------------------------------------------------------------------------------------------------
rem  You need to look for a particular string "currentValue" that occurs just before the value you want 
rem  {"name":"temperature","currentValue":78.92,"dataType":"NUMBER"}
rem
rem  InStr([start,]string1,string2[,compare])
rem   Parameter	Description
rem   start	Optional. Specifies the starting position for each search. 
rem             The search begins at the first character position (1) by default. 
rem             This parameter is required if compare is specified
rem   string1	Required. The string to be searched
rem   string2	Required. The string expression to search for
rem  compare	Optional. Specifies the string comparison to use. Default is 0
rem  Can have one of the following values:
rem    0 = vbBinaryCompare - Perform a binary comparison
rem    1 = vbTextCompare - Perform a textual comparison
rem -------------------------------------------------------------------------------------------------------------------------------
rem
rem  
rem   Speedtest by Ookla
rem
rem      Server: Spectrum - Austin, TX (id: 16965)
rem         ISP: Spectrum
rem Idle Latency:    41.75 ms   (jitter: 9.97ms, low: 33.72ms, high: 48.77ms)
rem
rem    Download:   117.55 Mbps (data used: 142.9 MB)                                                   
rem                158.66 ms   (jitter: 50.29ms, low: 26.95ms, high: 248.07ms)
rem
rem -------------------------------------------------------------------------------------------------------------------------------
rem  First find "temperature", "battery", "Download"
rem
rem    searchFor = "temperature"
rem  searchFor = "battery"
rem    searchFor = "Download"
rem    WScript.Echo strLine
    currentValue = strLine
    rem ------------------=-----------------------------
    rem If the value is good turn the results switch ON
    rem ----------------------------------=-------------
    if currentValue > 100 Then
      WScript.Echo "value looks good"
      curlCommand = "curl "+ "http://192.168.1.64/apps/api/1376/devices/2073/on?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
      
      Set oShell = WScript.CreateObject ("WScript.shell")
       oShell.Exec(curlCommand) 
       curlCommand = "curl "+ "http://192.168.1.64/apps/api/1376/devices/2086/setVariable/" + trim(currentValue) + "?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
rem      curlCommand = "curl http://192.168.1.64/apps/api/1376/devices/2086/setVariable/118.19?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
      WScript.Echo curlCommand
      oShell.Exec(curlCommand)  
       
    End If
rem    iPos = InStr(1, strLine, searchFor, 1)
rem    WScript.Echo "iPos = " & iPos
rem    If iPos > 1 Then
rem
rem  Then find "currentValue"
rem  Note: use the position of the colon and the comma to determine the length of the current value
rem
rem      startPos = InStr(iPos, strLine, ":", 1)
rem      WScript.Echo "startPos = " & startPos
rem      endPos = InStr(startPos, strLine, "Mbps", 1) rem
rem      WScript.Echo "endPos = " & endPos
rem
rem Mid(string,start[,length])
rem
rem      currentValue = Mid(strLine, startPos + 1, endPos - (startPos + 1))
rem      resultsFile="results.txt"
rem      Const ForReading = 1, ForWriting = 2, ForAppending = 8
rem      Set f2 = fso.OpenTextFile(resultsFile, ForWriting, true)
rem      f2.Write currentValue & vbCrLf
rem      f2.Close
rem      Exit Do
rem    Else 
rem      currentValue = "Not found"
rem    End If
    rem Exit Do
rem  Loop
  f.Close
  WScript.Echo "currentValue = " & currentValue
WScript.Quit