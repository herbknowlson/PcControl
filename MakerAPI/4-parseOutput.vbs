rem ===========================================================================
rem                    Read local file in json and various formats and parse it
rem ===========================================================================
rem  theFile = "output.txt"
rem  theFile = "output1695.txt"
  theFile = "SpeedTestOutput.txt"
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set f = fso.OpenTextFile(theFile)

  Do Until f.AtEndOfStream
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
    searchFor = "Download"
rem    WScript.Echo strLine
    iPos = InStr(1, strLine, searchFor, 1)
rem    WScript.Echo "iPos = " & iPos
    If iPos > 1 Then
rem
rem  Then find "currentValue"
rem  Note: use the position of the colon and the comma to determine the length of the current value
rem
      startPos = InStr(iPos, strLine, ":", 1)
      WScript.Echo "startPos = " & startPos
      endPos = InStr(startPos, strLine, "Mbps", 1) rem
      WScript.Echo "endPos = " & endPos
rem
rem Mid(string,start[,length])
rem
      currentValue = Mid(strLine, startPos + 1, endPos - (startPos + 1))
      resultsFile="results.txt"
      Const ForReading = 1, ForWriting = 2, ForAppending = 8
      Set f2 = fso.OpenTextFile(resultsFile, ForWriting, true)
      f2.Write currentValue & vbCrLf
      f2.Close
      Exit Do
    Else 
      currentValue = "Not found"
    End If
    rem Exit Do
  Loop
  f.Close
  WScript.Echo "currentValue = " & currentValue
WScript.Quit