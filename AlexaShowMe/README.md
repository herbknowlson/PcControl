## Description
Control your PC with your voice or smart phone (Hubitat app). 

## Popular functions
Alexa show me the weather
Alexa show me Linda's music
Alexa move the mouse

## Uses
Windows PC batch file running a (Continuous loop) 
Alexa Hubitat skill 
Hubitat virtual switch
Visual basic script 
Hubitat Maker API

## How it works
Alexa or Hubitat app  change a  Virtual Switch (Alexa show me the weather)
The PC is running a continuous loop ( InterrogateLoop2.bat)
and calls VBS (RollCallWeather.vbs)
which uses  the device ID and the Hubitat Maker API to interrogate Virtual Switch (Alexa show me the weather)
when the  Virtual Switch is found ON then do something on the computer
weather.bat
- start "" /MAX "C:\Users\herbk\Desktop\MyRadar.lnk"