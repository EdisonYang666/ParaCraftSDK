echo off

set default_sdk_path=D:\lxzsrc\ParaEngine\ParaWorld
set /p SDK_PATH=������SDK·��.Enter��Ĭ�ϵ�%default_sdk_path%

if %SDK_PATH% eq "" (
	set SDK_PATH=%default_sdk_path%
)

xcopy %SDK_PATH%/src/*.*  .