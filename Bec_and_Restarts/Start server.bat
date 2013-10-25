echo Starting Dayz Server
timeout 2
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