echo off

Set /p appname=������APP������:

mkdir apps\%appname%
mkdir apps\%appname%\source
mkdir apps\%appname%\source\%appname%

xcopy "%~dp0samples\1. HelloWorld\*.*"  "%~dp0apps\%appname%"
xcopy "%~dp0samples\1. HelloWorld\source\HelloWorld" "%~dp0apps\%appname%\source\%appname%" /C /E


REM  create the Run.bat file
Set RunFileName="%~dp0apps\%appname%\Run.bat"
del %RunFileName%
echo @echo off >> %RunFileName%
echo pushd "%%~dp0../../redist/" >> %RunFileName%
echo call "log.txt" >> %RunFileName%
echo call "ParaEngineClient.exe" bootstrapper="source/%appname%/main.lua" single="false" mc="true" noupdate="true" dev="%%~dp0"  >> %RunFileName%
echo popd >> %RunFileName%


echo ��ϲ���������: apps\%appname%

start explorer.exe "%~dp0apps\%appname%"