@ECHO OFF
rem ---------------------------------------------------------------------
rem  Use Microsoft Edge to submit a Google form URL
rem --------------------------------------------------------------------

start microsoft-edge:"https://docs.google.com/forms/d/e/1FAIpQLSftxNX4N66xYvHmhB89cHNzls3bVdz4rVtbwlDHXe19Ts5AMA/formResponse?usp=pp_url&entry.1536138949=Notification+-+front+door&entry.829820091=OPEN&submit=Submit"
timeout 1
rem the next command didn't work
rem taskkill /F /IM MicrosoftEdge.exe
rem powershell (Get-Process)
rem pause
powershell (ps msedge).CloseMainWindow()
rem pause
rem timeout 30


