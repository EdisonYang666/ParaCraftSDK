echo off

Set /p appname=������APP������:

mkdir apps\%appname%
mkdir apps\%appname%\script
mkdir apps\%appname%\script\%appname%

xcopy samples\HelloWorld\script\HelloWorld\  apps\%appname%\
xcopy samples\HelloWorld\script\HelloWorld  /C /E apps\%appname%\script\%appname%

echo ��ϲ���������: apps\%appname%

start explorer.exe "%CD%\apps\%appname%"