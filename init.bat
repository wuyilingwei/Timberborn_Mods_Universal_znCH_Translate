@echo off
title Initializator

echo [Init info] Initializator started

echo [Init info] Initializate Python Openai Lib
pip install openai
if %errorlevel% neq 0 (
    echo [Init error] Error while installing Openai Lib
    echo [Init info] You must installed python 3.6 or higher
    echo [Init info] Initializator will close in 5 seconds.
    timeout /t 5 /nobreak >nul
    exit
)

echo [Init info] Initializate SteamCMD
mkdir steamcmd >nul 2>&1
cd steamcmd
curl -s https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip -o steamcmd.zip
tar -xf steamcmd.zip
del /q steamcmd.zip
steamcmd +quit

echo [Init info] Initializated SteamCMD
echo [Init info] Done! Environment is ready.
echo [Init info] Check the logs for any errors. Next step will start in 5 seconds.
timeout /t 5 /nobreak >nul
cls

echo [Init info] Setting up secrets

echo [Init info] Please enter your Openai API key:
set /p openai_key=
echo [Init info] Openai API key set
echo [Init info] Please enter your Steam username:
set /p steam_username=
echo [Init info] Steam username set
echo [Init info] We will try to login to Steam in 5 seconds
echo [Init info] If you have Steam Guard enabled, you will need to enter the two-factor code
echo [Init info] It can find in your email or in your phone show the code
echo [Init info] This is a one-time process, your password will not be saved
timeout /t 5 /nobreak >nul
steamcmd +login %steam_username% +quit

cd ..
mkdir secrets
attrib +h secrets
echo %openai_key% > secrets/openai_key.txt
echo %steam_username% > secrets/steam_username.txt
echo [Init info] Secrets set
echo [Init info] Never share your secrets folder and steamcmd folder with anyone

echo [Init info] Initializator will close in 5 seconds.
timeout /t 5 /nobreak >nul
exit