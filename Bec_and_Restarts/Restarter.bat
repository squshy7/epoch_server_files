@echo off
echo.
echo KILL arma2oaserver.exe
set serverkill="C:\Dayz Server Nom"
cd /d %serverkill%
taskkill /im arma2oaserver.exe
echo.
echo Kill Bec.exe
set beckill="C:\Bec"
cd /d %beckill%
taskkill /im bec.exe
 
timeout 10
 
echo.
echo Starting Dayz Server
:: start the server..
set dayzpath="C:\Dayz Server Nom"
cd /d %dayzpath%
start "" "DayZ_Epoch_instance_11_Chernarus.bat"
echo.
echo Starting Bec
timeout 15
:: start bec
set becpath="C:\Bec"
cd /d %becpath%
start "" "bec.exe" -f Config.cfg
echo.
echo Server Started 100%
 
cls
@exit