::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBZVXgqLAE+1BaAR7ebv/Nagq1k1QeADKNeKio6LMu8d71GpZZo40XNU1dwFAidRcxWXZww7p1ER5HzWZYmVsACB
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJgZksaHErTcWm/ErR8
::ZQ05rAF9IBncCkqN+0xwdVsEAlTMbCXrS7cZ/Omb
::ZQ05rAF9IAHYFVzEqQJgcEpuSRaNDGevAbwSiA==
::eg0/rx1wNQPfEVWB+kM9LVsJDFTabVG/FLos5P385uTJp1UYNA==
::fBEirQZwNQPfEVWB+kM9LVsJDFTabVG/FLos5P385uSiukgeQfY+eoPeug==
::cRolqwZ3JBvQF1fEqQIdKRJaDAGaOWivErQe5O276eWV4h1FBdg6aoDr1qGJKe5dig==
::dhA7uBVwLU+EWAncpRJwGxRSWBODLm7a
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBZVXgqLAE+/Fb4I5/jHv7LW8ncYRu0xfZuWyribJ+kdp1Lte6p9jitgndkDPBdNeRulIAosrA4=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@REM The code above is used for my Batch compiler.
@echo off
if /I "%1"=="--activate" goto activate
if /I "%1"=="-a" goto activate
if /I "%1"=="--deactivate" goto deactivate
if /I "%1"=="-d" goto deactivate
if /I "%1"=="--activate-site" goto activate-site
if /I "%1"=="-as" goto activate-site
if /I "%1"=="--download" goto download
if /I "%1"=="-dl" goto download
if "%1"=="" (%extd% /messagebox "081ZeroPlugin Error" "Error: No command specified!" & exit)
%extd% /messagebox "081ZeroPlugin Error" "Error: The command (%1) is not recognized!"
exit
:activate
if not "%2"=="" goto activate-site
start /wait "" "%0" -d
start "" "%~dp0bin\ZeroNet-CLI-win-dist-win64\zeronet-cli.exe"
exit
:activate-site
if "%2"=="" (
%extd% /messagebox "081ZeroPlugin Error" "Error: Can't activate site if no site is specified!"
)
set site-to-activate=%2
start "" "%~dp0bin\ZeroNet-CLI-win-dist-win64\zeronet-cli.exe" siteDownload %site-to-activate% || %extd% /messagebox "081ZeroPlugin Error" "Error: Can't activate site, did you specify it correctly?"
exit
:deactivate
taskkill /im zeronet-cli.exe && (
timeout /t 2
del /f /q "%~dp0bin\ZeroNet-CLI-win-dist-win64\data\lock.pid" || %extd% /messagebox "081ZeroPlugin Error" "Deactivation error: Couldn't delete lock.pid file!"
)  || %extd% /messagebox "081ZeroPlugin Error" "Deactivation error: Couldn't stop Zeronet-CLI.exe!"
exit
:download
if "%2"=="" (
%extd% /messagebox "081ZeroPlugin Error" "Error: Can't download file if no url is specified!"
)
set tofile=%3
if "%3"=="" (
%extd% /savefiledialog "Download file to" "" "All Files (*.*)|*.*"
set tofile=%result%
)
set fromurl=%2
%extd% /download http://127.0.0.1:2288/%fromurl% %tofile% || %extd% /messagebox "081ZeroPlugin Error" "Error: Can't download file, did you specify the command correctly?"
exit