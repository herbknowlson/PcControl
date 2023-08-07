rem ---------------------------------------------------------------------
rem  Use Microsoft Edge to submit a Google form URL
rem --------------------------------------------------------------------
@ECHO OFF
start microsoft-edge:"https://docs.google.com/forms/d/e/1FAIpQLSdjkre0C6wB-ujB8tLyTnNGCST5K5tiVRONGE9dWLonDfZQJw/formResponse?usp=pp_url&entry.581660849=2023-08-06&entry.1060654619=01:33&entry.1446345927=78.3&submit=Submit"
timeout 3
powershell (ps msedge).CloseMainWindow()
rem exit