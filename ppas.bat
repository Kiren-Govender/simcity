@echo off
SET THEFILE=E:\30-39-development-repos\30-personal-testbed-repos\30.500-simcity\simcity.exe
echo Linking %THEFILE%
C:\lazarus\fpc\3.2.2\bin\x86_64-win64\ld.exe -b pei-x86-64  --gc-sections   --subsystem windows --entry=_WinMainCRTStartup    -o E:\30-39-development-repos\30-personal-testbed-repos\30.500-simcity\simcity.exe E:\30-39-development-repos\30-personal-testbed-repos\30.500-simcity\link2140.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
