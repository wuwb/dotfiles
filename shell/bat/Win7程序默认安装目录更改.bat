title Win7程序默认安装目录更改    Code by Shuaicai  
mode con: cols=78 lines=25
echo off

:drive

set drive1=%SystemRoot:~0,2%

color 1f
cls
echo.
echo.请在Win7系统下 以管理员身份 运行本程序，使更改生效需重启
echo.
echo.请输入程序默认安装目录("%drive1%\Program Files")要更改到的分区的盘符
echo.
echo.如 D，即将程序默认安装目录更改为"D:\Program Files"
echo.
set drive2=
set /p drive2=若更改到D盘回车即可，否则请输入：
if "%drive2%"=="" set drive2=D
set drive2=%drive2:~0,1%:


if not exist %drive2%\nul (
color 4f
cls
echo.
echo.%drive2:~0,1%盘不存在
echo.
set /p t=按回车键重新输入盘符. . . 
goto :drive
)

:drive_ok




color 0f
cls




md "%drive2%\Program Files"



mklink /D "%drive2%\Program Files\DVD Maker" "%drive1%\Program Files\DVD Maker"
mklink /D "%drive2%\Program Files\Internet Explorer" "%drive1%\Program Files\Internet Explorer"
mklink /D "%drive2%\Program Files\Microsoft Games" "%drive1%\Program Files\Microsoft Games"
mklink /D "%drive2%\Program Files\MSBuild" "%drive1%\Program Files\MSBuild"
mklink /D "%drive2%\Program Files\Reference Assemblies" "%drive1%\Program Files\Reference Assemblies"
mklink /D "%drive2%\Program Files\Windows Defender" "%drive1%\Program Files\Windows Defender"
mklink /D "%drive2%\Program Files\Windows Journal" "%drive1%\Program Files\Windows Journal"
mklink /D "%drive2%\Program Files\Windows Mail" "%drive1%\Program Files\Windows Mail"
mklink /D "%drive2%\Program Files\Windows Media Player" "%drive1%\Program Files\Windows Media Player"
mklink /D "%drive2%\Program Files\Windows NT" "%drive1%\Program Files\Windows NT"
mklink /D "%drive2%\Program Files\Windows Photo Viewer" "%drive1%\Program Files\Windows Photo Viewer"
mklink /D "%drive2%\Program Files\Windows Portable Devices" "%drive1%\Program Files\Windows Portable Devices"
mklink /D "%drive2%\Program Files\Windows Sidebar" "%drive1%\Program Files\Windows Sidebar"


attrib +h "%drive2%\Program Files\DVD Maker" /l
attrib +h "%drive2%\Program Files\Internet Explorer" /l
attrib +h "%drive2%\Program Files\Microsoft Games" /l
attrib +h "%drive2%\Program Files\MSBuild" /l
attrib +h "%drive2%\Program Files\Reference Assemblies" /l
attrib +h "%drive2%\Program Files\Windows Defender" /l
attrib +h "%drive2%\Program Files\Windows Journal" /l
attrib +h "%drive2%\Program Files\Windows Mail" /l
attrib +h "%drive2%\Program Files\Windows Media Player" /l
attrib +h "%drive2%\Program Files\Windows NT" /l
attrib +h "%drive2%\Program Files\Windows Photo Viewer" /l
attrib +h "%drive2%\Program Files\Windows Portable Devices" /l
attrib +h "%drive2%\Program Files\Windows Sidebar" /l


md "%drive2%\Program Files\Common Files\SpeechEngines"

attrib +h "%drive2%\Program Files\Common Files"

mklink /D "%drive2%\Program Files\Common Files\microsoft shared" "%drive1%\Program Files\Common Files\microsoft shared"
mklink /D "%drive2%\Program Files\Common Files\Services" "%drive1%\Program Files\Common Files\Services"
mklink /D "%drive2%\Program Files\Common Files\SpeechEngines\Microsoft" "%drive1%\Program Files\Common Files\SpeechEngines\Microsoft"
mklink /D "%drive2%\Program Files\Common Files\System" "%drive1%\Program Files\Common Files\System"


reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion" /v "ProgramFilesDir" /t "REG_SZ" /d "%drive2%\Program Files" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion" /v "CommonFilesDir" /t "REG_SZ" /d "%drive2%\Program Files\Common Files" /f




color 1f
cls
echo.
echo.Win7程序默认安装目录更改已完成
echo.
echo.请重启以使更改生效
echo.
set /p t=按回车键将重启. . . 


shutdown -r -t 0
