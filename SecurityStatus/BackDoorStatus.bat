@ECHO OFF
rem ---------------------------------------------------------------------
rem  Use Microsoft Edge to submit a Google form URL
rem --------------------------------------------------------------------
rem echo %1
start /min microsoft-edge:"https://docs.google.com/forms/d/e/1FAIpQLSftxNX4N66xYvHmhB89cHNzls3bVdz4rVtbwlDHXe19Ts5AMA/formResponse?usp=pp_url&entry.1536138949=Security+status+-+back+door&entry.829820091=%BackDoorStatus%&submit=Submit"
rem timeout 1
powershell (ps msedge).CloseMainWindow()



