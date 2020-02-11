@echo off 
if not exist "npl_packages" ( mkdir npl_packages )

pushd "npl_packages"

CALL :BuddlePackage 
CALL :InstallPackage paracraft https://github.com/NPLPackages/paracraft
CALL :InstallPackage main https://github.com/NPLPackages/main

popd

EXIT /B %ERRORLEVEL%

rem install function here
:InstallPackage
if exist "%1\README.md" (
    pushd %1
	git reset --hard
    git pull
    popd
) else (
    rmdir /s /q "%CD%\%1"
    git clone %2
)
EXIT /B 0