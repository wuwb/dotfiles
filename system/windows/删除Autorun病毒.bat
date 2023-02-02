@echo off
TITLE 删除Autorun病毒_for_Windows XP_by_oicu
COLOR 3B
CLS
ECHO.
ECHO.
ECHO            删除Autorun病毒_打印店用_2006.11.14
ECHO           ***********************************************************
ECHO            可以删除以下病毒：
ECHO            开机跳出空白记事本、西南民族大学比肩BBS、RavMonE.exe、
ECHO            autorun风暴(开机弹出我的文档)、AdobeR.exe、rose.exe、
ECHO            explorer三好学生(不能打开魔兽3等游戏的文件夹)、sxs.exe、
ECHO            Setup.pif(winl0gon)、tel.xls.exe、fun.xls.exe
::::::只删除U盘上的SHE.exe、ctfmon.exe、winw0rd.exe病毒，未处理硬盘上的::::::
ECHO.
ECHO            特别说明：
ECHO            A.只适用于 Windows XP 系统。
ECHO            B.杀U盘病毒时一定要放到U盘根目录下运行，
ECHO              放到U盘运行可以同时杀掉硬盘上的病毒。
ECHO            C.不要放到硬盘分区根目录运行，否则会出
ECHO              错，比如放在桌面运行也可杀硬盘的病毒。
ECHO            D.运行后会关闭桌面进程。
ECHO            E.取消了删除硬盘各分区的_desktop.ini
ECHO.
ECHO                                          Copyright (C) 2006 oicu
ECHO           ***********************************************************
ECHO.
SET CHECK=
SET /P CHECK=           开始杀毒(Y/N)?
IF /I NOT "%CHECK%"=="Y" GOTO END
SETLOCAL
SET System=%SystemRoot%\system
SET System32=%SystemRoot%\system32
SET dllcache=%SystemRoot%\System32\dllcache
SET Start=%USERPROFILE%\「开始」菜单\程序\启动
SET Startup=%USERPROFILE%\Start Menu\Programs\Startup
SET AllStart=%ALLUSERSPROFILE%\「开始」菜单\程序\启动
SET AllStartup=%ALLUSERSPROFILE%\Start Menu\Programs\Startup
SET TASKKILL=TASKKILL /F /IM
SET ATTRIB=ATTRIB -R -A -S -H
CLS
ECHO =====清理临时文件夹：=================================
ECHO.
del /F /S /Q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
del /F /S /Q "%Temp%\*.*"
del /F /S /Q "%SystemRoot%\Prefetch\*.pf"
del /F /Q "%userprofile%\Recent\*.*"
CLS
ECHO Waiting. . .
ECHO.
ECHO =====正在结束病毒进程：===============================
ECHO.
::ntsd -c q -pn explorer.exe
TSKILL EXPLORER
FOR %%a IN (wincfgs KB20060111 winlog0n Toy systemnt mslogon SXS SVOHOST rose adober SocksA wsctf tel.xls algsrv WINL0GON fun.xls algsrvs) do (
    IF NOT %%aW==W (
	%TASKKILL% %%a.EXE /T 2>NUL
	TSKILL %%a >NUL 2>NUL
    )
)
::%windir%\EXPLORER.EXE
ECHO.
ECHO.
ECHO =====正在停止、删除病毒服务：=========================
net stop "Distributed Link Tracking Client logger" 2>NUL
sc stop "Distributed Link Tracking Client logger" >NUL 2>NUL
sc delete "Distributed Link Tracking Client logger" 2>NUL
ECHO.
ECHO.
::::::恢复启动文件夹的属性，必须放到删除之前::::::
IF EXIST "%Start%" %ATTRIB% "%Start%"
IF EXIST "%AllStart%" %ATTRIB% "%AllStart%"
::::::下面为英文XP系统使用::::::
IF EXIST "%Startup%" %ATTRIB% "%Startup%"
IF EXIST "%AllStartup%" %ATTRIB% "%AllStartup%"
ECHO =====正在删除硬盘里的病毒文件：=======================
ECHO.
IF EXIST "%Start%\windows.exe" (%ATTRIB% "%Start%\windows.exe" & DEL "%Start%\windows.exe" & ECHO 已删除病毒文件 "%Start%\windows.exe")
IF EXIST "%Start%\systemnt.exe" (%ATTRIB% "%Start%\systemnt.exe" & DEL "%Start%\systemnt.exe" & ECHO 已删除病毒文件 "%Start%\systemnt.exe")
IF EXIST "%Startup%\windows.exe" (%ATTRIB% "%Startup%\windows.exe" & DEL "%Startup%\windows.exe" & ECHO 已删除病毒文件 "%Startup%\windows.exe")
IF EXIST "%Startup%\systemnt.exe" (%ATTRIB% "%Startup%\systemnt.exe" & DEL "%Startup%\systemnt.exe" & ECHO 已删除病毒文件 "%Startup%\systemnt.exe")

IF EXIST "%AllStart%\windows.exe" (%ATTRIB% "%AllStart%\windows.exe" & DEL "%AllStart%\windows.exe" & ECHO 已删除病毒文件 "%AllStart%\windows.exe")
IF EXIST "%AllStart%\systemnt.exe" (%ATTRIB% "%AllStart%\systemnt.exe" & DEL "%AllStart%\systemnt.exe" & ECHO 已删除病毒文件 "%AllStart%\systemnt.exe")
IF EXIST "%AllStartup%\windows.exe" (%ATTRIB% "%AllStartup%\windows.exe" & DEL "%AllStartup%\windows.exe" & ECHO 已删除病毒文件 "%AllStartup%\windows.exe")
IF EXIST "%AllStartup%\systemnt.exe" (%ATTRIB% "%AllStartup%\systemnt.exe" & DEL "%AllStartup%\systemnt.exe" & ECHO 已删除病毒文件 "%AllStartup%\systemnt.exe")

IF EXIST %windir%\KB20060111.exe (%ATTRIB% %windir%\KB20060111.exe & DEL %windir%\KB20060111.exe & ECHO 已删除病毒文件 "%windir%\KB20060111.exe")
IF EXIST %windir%\AdobeR.exe (%ATTRIB% %windir%\AdobeR.exe & DEL %windir%\AdobeR.exe & ECHO 已删除病毒文件 "%windir%\AdobeR.exe")
IF EXIST %windir%\SXS.EXE (%ATTRIB% %windir%\SXS.EXE & DEL %windir%\SXS.EXE & ECHO 已删除病毒文件 "%windir%\SXS.EXE")
IF EXIST %windir%\SVOHOST.EXE (%ATTRIB% %windir%\SVOHOST.EXE & DEL %windir%\SVOHOST.EXE & ECHO 已删除病毒文件 "%windir%\SVOHOST.EXE")
IF EXIST %windir%\WINSCOK.DLL (%ATTRIB% %windir%\WINSCOK.DLL & DEL %windir%\WINSCOK.DLL & ECHO 已删除病毒文件 "%windir%\WINSCOK.DLL")
IF EXIST %windir%\ufdata2000.log (%ATTRIB% %windir%\ufdata2000.log & DEL %windir%\ufdata2000.log & ECHO 已删除病毒文件 "%windir%\ufdata2000.log")

FOR %%b IN (run.reg systemdate.ini wincfgs.exe winlog0n.exe mslogon.exe autorun.vbs autorun.bin autorun.bat autorun.reg autorun.txt autorun.wsh SXS.EXE SVOHOST.EXE WINSCOK.DLL algsrv.exe SocksA.exe FileKan.exe wsctf.exe wsctf.exe.exe EXPLORER.EXE WINL0GON.exe algsrvs.exe msfun80.exe msime82.exe) do (
    IF NOT %%bW==W (
	IF EXIST "%System32%\%%b" (
	    %ATTRIB% "%System32%\%%b"
	    DEL "%System32%\%%b"
	    ECHO 已删除病毒文件 "%System32%\%%b"
	)
    )
)

IF EXIST %System%\SXS.EXE (%ATTRIB% %System%\SXS.EXE & DEL %System%\SXS.EXE & ECHO 已删除病毒文件 "%System%\SXS.EXE")
IF EXIST %System%\SVOHOST.EXE (%ATTRIB% %System%\SVOHOST.EXE & DEL %System%\SVOHOST.EXE & ECHO 已删除病毒文件 "%System%\SVOHOST.EXE")
IF EXIST %System%\WINSCOK.DLL (%ATTRIB% %System%\WINSCOK.DLL & DEL %System%\WINSCOK.DLL & ECHO 已删除病毒文件 "%System%\WINSCOK.DLL")

IF EXIST %dllcache%\SXS.EXE (%ATTRIB% %dllcache%\SXS.EXE & DEL %dllcache%\SXS.EXE & ECHO 已删除病毒文件 "%dllcache%\SXS.EXE")
IF EXIST %dllcache%\SVOHOST.EXE (%ATTRIB% %dllcache%\SVOHOST.EXE & DEL %dllcache%\SVOHOST.EXE & ECHO 已删除病毒文件 "%dllcache%\SVOHOST.EXE")
IF EXIST %dllcache%\WINSCOK.DLL (%ATTRIB% %dllcache%\WINSCOK.DLL & DEL %dllcache%\WINSCOK.DLL & ECHO 已删除病毒文件 "%dllcache%\WINSCOK.DLL")

IF EXIST C:\system32\rose.exe DEL /F/A:S C:\system32\rose.exe >NUL 2>NUL
IF EXIST C:\system.sys DEL /F/A:S C:\system.sys >NUL 2>NUL
IF EXIST D:\systemdate.ini DEL /F/A:S D:\systemdate.ini >NUL 2>NUL
IF EXIST D:\systemfile.com DEL /F/A:S D:\systemfile.com >NUL 2>NUL
ECHO.
ECHO.
::ECHO 请等待，正在删除_desktop.ini病毒文件：
::FOR %%i IN (C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO IF EXIST %%i:\ DEL /F /S /Q /A %%i:\_desktop.ini
::ECHO.
ECHO =====正在删除各盘根目录的病毒文件：===================
FOR %%c IN (C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO (
    FOR %%d IN (AutoRun.inf sxs.exe rose.exe AutoRun.vbs tel.xls.exe fun.xls.exe) DO (
	IF EXIST %%c:\%%d (
	    %ATTRIB% %%c:\%%d
	    DEL %%c:\%%d
	    ECHO 已删除病毒文件 "%%c:\%%d"
	)
    )
)
ECHO.
ECHO.
ECHO =====清理注册表：=====================================
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL" /v "CheckedValue" /f >NUL 2>NUL
REG DELETE "HKCU\Software\Microsoft\Windows\ShellNoRoam\MUICache" /v "%System32%\wincfgs.exe" /f 2>NUL
REG DELETE "HKCU\Software\Microsoft\Windows\ShellNoRoam\MUICache" /v "%windir%\KB20060111.exe" /f 2>NUL
REG DELETE "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows" /v "load" /f 2>NUL
REG DELETE "HKLM\SOFTWARE\Microsoft\Shared Tools\MSConfig\startupreg\Load" /f 2>NUL
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\SoundMam" /f 2>NUL
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SoundMam" /f 2>NUL
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "RavAV" /f 2>NUL
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "dll" /f 2>NUL
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "ASocksrv" /f 2>NUL
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "IMJPMIG8.2" /f 2>NUL
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "BSserver" /f 2>NUL
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "MsServer" /f 2>NUL
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "EXPLORER.EXE" /f 2>NUL
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "wsctf.exe" /f 2>NUL
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\HideFileExt" /v "UncheckedValue" /t REG_DWORD /d "0x00000000" /f >NUL 2>NUL
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL" /v "CheckedValue" /t REG_DWORD /d "00000001" /f >NUL 2>NUL
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Userinit" /t REG_SZ /d "%System32%\userinit.exe," /f >NUL 2>NUL
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d "0x000000ff" /f >NUL 2>NUL
ECHO.
ECHO.
ECHO =====删除U盘/Mp3里的病毒文件：========================
ECHO.
IF EXIST .\RECYCLER (%ATTRIB% .\RECYCLER /S /D & %ATTRIB% .\RECYCLER\* /S & DEL /S /Q .\RECYCLER\* & RD /S /Q .\RECYCLER & ECHO 已删除病毒文件夹RECYCLER)
FOR %%e IN (AutoRun.inf autorun.bat autorun.bin autorun.reg autorun.txt autorun.wsh autorun.vbs Toy.exe msvcr71.dll RavMonE.exe SHE.exe ctfmon.exe AdobeR.exe AdobeR.exe.log winw0rd.exe tel.xls.exe EXPLORER.EXE Setup.pif fun.xls.exe) do (
    IF NOT %%eW==W (
	IF EXIST .\%%e (
	    %ATTRIB% .\%%e
	    DEL .\%%e
	    ECHO 已删除病毒文件 "%%e"
	)
    )
)
ECHO.
ECHO.
ECHO 杀毒结束. . .
ECHO.
ECHO 注意：退出U盘/Mp3再接入才能正常使用！
ECHO.
ECHO 如果杀毒后硬盘分区不能双击打开，建议重启电脑。
ECHO.
ECHO 有其他问题请到 http://virus.lsxk.org/ 咨询。
ECHO.
ECHO 请按任意键退出. . .
ECHO.
pause >NUL 2>NUL
:END
IF EXIST .\AUTORUN.INF.txt (ATTRIB -R -A -S -H .\AUTORUN.INF.txt & COPY /Y .\AUTORUN.INF.txt .\AUTORUN.INF >NUL 2>NUL & ATTRIB +S +H .\AUTORUN.INF.txt >NUL 2>NUL)
IF EXIST .\AUTORUN.INF ATTRIB +S +H .\AUTORUN.INF >NUL 2>NUL
::::::结束cmd里管理输入法的进程::::::
%TASKKILL% conime.exe >NUL 2>NUL
TSKILL conime >NUL 2>NUL
ENDLOCAL
exit