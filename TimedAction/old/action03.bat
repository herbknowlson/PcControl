@ECHO OFF
rem ---------------------------------------------------------------------
rem  Use Microsoft Edge to submit a Google form URL
rem
rem  Note: values are made available via the Environment
rem  %notesAction03%  
rem --------------------------------------------------------------------

start /min microsoft-edge:"https://docs.google.com/forms/d/e/1FAIpQLSeW8dBns-mmCd9iJV2zm1uauML2MibPeRcCrZq8-XrOLhRkPQ/formResponse?usp=pp_url&entry.1170193302=%notesAction03%&submit=Submit"
rem timeout 1
powershell (ps msedge).CloseMainWindow()



