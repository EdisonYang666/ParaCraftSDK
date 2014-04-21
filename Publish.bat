REM  Publish App in the Redist folder
echo off
echo.
Set pub_dir=%~dp0published\
Set redist_dir=%~dp0redist\
Set bin_dir=%~dp0bin\
Set start_filename=����.bat
Set /p appname=������Ҫ������APP���֣��ձ�ʾΪ��Ʒ����:

pushd %redist_dir%
echo ��������%redist_dir%�е���ʱ�ļ�
del asset.log
del log.txt
del perf.txt
del *.mem.exe
del database\creator_profile.db
del database\localserver.*
del database\userdata.*
del database\app.*


rd "Screen Shots" /s /q
rd "log" /s /q
rd "Update" /s /q
rd "temp/apps" /s /q
rd "temp/composeface" /s /q
rd "temp/composeskin" /s /q
rd "temp/tempdatabase" /s /q
rd "temp/webcache" /s /q
rd "temp/tempdownloads" /s /q
rd "temp/mybag" /s /q
echo ��ϲ��%redist_dir%�������
echo ���Լ��� %redist_dir% worldsĿ¼�ֹ�����. 

REM application related files
rd "apps" /s /q
del *.bat
popd

REM ���������ļ�
Set RunFileName="%redist_dir%\%start_filename%"
del %RunFileName%
if "%appname%" NEQ "" (
	mkdir "%redist_dir%apps"
	mkdir "%redist_dir%apps\%appname%"
	xcopy "%~dp0apps\%appname%" "%redist_dir%apps\%appname%" /C /E
	echo �ɹ���"%~dp0apps\%appname%" ��������appsĿ¼
	
	REM  create the Run.bat file
	echo @echo off >> %RunFileName%
	echo pushd "%%~dp0" >> %RunFileName%
	echo call "ParaEngineClient.exe" bootstrapper="source/%appname%/main.lua" single="false" mc="true" noupdate="true" dev="%%~dp0apps\%appname%"  >> %RunFileName%
	echo popd >> %RunFileName%
) else (
	echo call "%%~dp0ParaCraft.exe" >> %RunFileName%
	echo call "%%~dp0ParaEngineClient.exe" single="false" mc="true" noupdate="true">> %redist_dir%\��������.bat
)

echo ��ϲ���������
echo ���Լ��� %redist_dir% ���������. 

Set /p tmp=�Ƿ�redistĿ¼���Ϊzip�ļ���ȷ�ϰ�Y��
if '%tmp%'=='Y' (
	call "%bin_dir%7z.exe" a ParaCraft%appname%%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%.zip %redist_dir%
) else (
	pause
	start explorer.exe "%redist_dir%"
)
