@ECHO OFF
rem -------------------------------------------------------------------
rem  Note: values are made available via the Environment
rem
rem  %actionID%  %notesActionBegins%  
rem  %loop1Counter% %loop2Counter% %loop3Counter%
rem --------------------------------------------------------------------

start /MIN microsoft-edge:"https://docs.google.com/forms/d/e/1FAIpQLSeW8dBns-mmCd9iJV2zm1uauML2MibPeRcCrZq8-XrOLhRkPQ/formResponse?usp=pp_url&entry.1170193302=%actionID%&entry.2003268489=%notesActionBegins%&entry.1898766254=%loop1Counter%&entry.1200210196=%loop2Counter%&entry.1850835241=%loop3Counter%&submit=Submit"

rem CALL "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" https://docs.google.com/forms/d/e/1FAIpQLSeW8dBns-mmCd9iJV2zm1uauML2MibPeRcCrZq8-XrOLhRkPQ/formResponse?usp=pp_url&entry.1170193302=%actionID%&entry.2003268489=%notesActionBegins%&entry.1898766254=%loop1Counter%&entry.1200210196=%loop2Counter%&entry.1850835241=%loop3Counter%&submit=Submit"

timeout 2
powershell (ps msedge).CloseMainWindow()

rem PAUSE



