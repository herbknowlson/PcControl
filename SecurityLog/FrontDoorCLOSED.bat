rem ---------------------------------------------------------------------
rem  Use Microsoft Edge to submit a Google form URL
rem --------------------------------------------------------------------
@ECHO OFF
start /min microsoft-edge:"https://docs.google.com/forms/d/e/1FAIpQLSftxNX4N66xYvHmhB89cHNzls3bVdz4rVtbwlDHXe19Ts5AMA/formResponse?usp=pp_url&entry.1536138949=Notification+-+front+door&entry.829820091=CLOSED&submit=Submit"
timeout 1
powershell (ps msedge).CloseMainWindow()



