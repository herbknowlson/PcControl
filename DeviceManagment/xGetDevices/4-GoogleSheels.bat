@ECHO OFF
rem ---------------------------------------------------------------------
rem  Use Microsoft Edge to submit a Google form URL
rem 
rem  Note: values are made available via the Environment
rem  %deviceID%   %label%  %value%
rem --------------------------------------------------------------------

start /min microsoft-edge:"https://docs.google.com/forms/d/e/1FAIpQLScceog-Z4gO7fYBbsYk14AmcQ1Z2nS7sydC-O63MPl8Pfnp9g/formResponse?usp=pp_url&entry.1845045135=%deviceID%&entry.921408092=%label%&entry.1343337442=%value%&submit=Submit"

remtimeout 1
rem powershell (ps msedge).CloseMainWindow()
rem pause
rem timeout 30


