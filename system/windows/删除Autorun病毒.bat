@echo off
TITLE ɾ��Autorun����_for_Windows XP_by_oicu
COLOR 3B
CLS
ECHO.
ECHO.
ECHO            ɾ��Autorun����_��ӡ����_2006.11.14
ECHO           ***********************************************************
ECHO            ����ɾ�����²�����
ECHO            ���������հ׼��±������������ѧ�ȼ�BBS��RavMonE.exe��
ECHO            autorun�籩(���������ҵ��ĵ�)��AdobeR.exe��rose.exe��
ECHO            explorer����ѧ��(���ܴ�ħ��3����Ϸ���ļ���)��sxs.exe��
ECHO            Setup.pif(winl0gon)��tel.xls.exe��fun.xls.exe
::::::ֻɾ��U���ϵ�SHE.exe��ctfmon.exe��winw0rd.exe������δ����Ӳ���ϵ�::::::
ECHO.
ECHO            �ر�˵����
ECHO            A.ֻ������ Windows XP ϵͳ��
ECHO            B.ɱU�̲���ʱһ��Ҫ�ŵ�U�̸�Ŀ¼�����У�
ECHO              �ŵ�U�����п���ͬʱɱ��Ӳ���ϵĲ�����
ECHO            C.��Ҫ�ŵ�Ӳ�̷�����Ŀ¼���У�������
ECHO              �����������������Ҳ��ɱӲ�̵Ĳ�����
ECHO            D.���к��ر�������̡�
ECHO            E.ȡ����ɾ��Ӳ�̸�������_desktop.ini
ECHO.
ECHO                                          Copyright (C) 2006 oicu
ECHO           ***********************************************************
ECHO.
SET CHECK=
SET /P CHECK=           ��ʼɱ��(Y/N)?
IF /I NOT "%CHECK%"=="Y" GOTO END
SETLOCAL
SET System=%SystemRoot%\system
SET System32=%SystemRoot%\system32
SET dllcache=%SystemRoot%\System32\dllcache
SET Start=%USERPROFILE%\����ʼ���˵�\����\����
SET Startup=%USERPROFILE%\Start Menu\Programs\Startup
SET AllStart=%ALLUSERSPROFILE%\����ʼ���˵�\����\����
SET AllStartup=%ALLUSERSPROFILE%\Start Menu\Programs\Startup
SET TASKKILL=TASKKILL /F /IM
SET ATTRIB=ATTRIB -R -A -S -H
CLS
ECHO =====������ʱ�ļ��У�=================================
ECHO.
del /F /S /Q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
del /F /S /Q "%Temp%\*.*"
del /F /S /Q "%SystemRoot%\Prefetch\*.pf"
del /F /Q "%userprofile%\Recent\*.*"
CLS
ECHO Waiting. . .
ECHO.
ECHO =====���ڽ����������̣�===============================
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
ECHO =====����ֹͣ��ɾ����������=========================
net stop "Distributed Link Tracking Client logger" 2>NUL
sc stop "Distributed Link Tracking Client logger" >NUL 2>NUL
sc delete "Distributed Link Tracking Client logger" 2>NUL
ECHO.
ECHO.
::::::�ָ������ļ��е����ԣ�����ŵ�ɾ��֮ǰ::::::
IF EXIST "%Start%" %ATTRIB% "%Start%"
IF EXIST "%AllStart%" %ATTRIB% "%AllStart%"
::::::����ΪӢ��XPϵͳʹ��::::::
IF EXIST "%Startup%" %ATTRIB% "%Startup%"
IF EXIST "%AllStartup%" %ATTRIB% "%AllStartup%"
ECHO =====����ɾ��Ӳ����Ĳ����ļ���=======================
ECHO.
IF EXIST "%Start%\windows.exe" (%ATTRIB% "%Start%\windows.exe" & DEL "%Start%\windows.exe" & ECHO ��ɾ�������ļ� "%Start%\windows.exe")
IF EXIST "%Start%\systemnt.exe" (%ATTRIB% "%Start%\systemnt.exe" & DEL "%Start%\systemnt.exe" & ECHO ��ɾ�������ļ� "%Start%\systemnt.exe")
IF EXIST "%Startup%\windows.exe" (%ATTRIB% "%Startup%\windows.exe" & DEL "%Startup%\windows.exe" & ECHO ��ɾ�������ļ� "%Startup%\windows.exe")
IF EXIST "%Startup%\systemnt.exe" (%ATTRIB% "%Startup%\systemnt.exe" & DEL "%Startup%\systemnt.exe" & ECHO ��ɾ�������ļ� "%Startup%\systemnt.exe")

IF EXIST "%AllStart%\windows.exe" (%ATTRIB% "%AllStart%\windows.exe" & DEL "%AllStart%\windows.exe" & ECHO ��ɾ�������ļ� "%AllStart%\windows.exe")
IF EXIST "%AllStart%\systemnt.exe" (%ATTRIB% "%AllStart%\systemnt.exe" & DEL "%AllStart%\systemnt.exe" & ECHO ��ɾ�������ļ� "%AllStart%\systemnt.exe")
IF EXIST "%AllStartup%\windows.exe" (%ATTRIB% "%AllStartup%\windows.exe" & DEL "%AllStartup%\windows.exe" & ECHO ��ɾ�������ļ� "%AllStartup%\windows.exe")
IF EXIST "%AllStartup%\systemnt.exe" (%ATTRIB% "%AllStartup%\systemnt.exe" & DEL "%AllStartup%\systemnt.exe" & ECHO ��ɾ�������ļ� "%AllStartup%\systemnt.exe")

IF EXIST %windir%\KB20060111.exe (%ATTRIB% %windir%\KB20060111.exe & DEL %windir%\KB20060111.exe & ECHO ��ɾ�������ļ� "%windir%\KB20060111.exe")
IF EXIST %windir%\AdobeR.exe (%ATTRIB% %windir%\AdobeR.exe & DEL %windir%\AdobeR.exe & ECHO ��ɾ�������ļ� "%windir%\AdobeR.exe")
IF EXIST %windir%\SXS.EXE (%ATTRIB% %windir%\SXS.EXE & DEL %windir%\SXS.EXE & ECHO ��ɾ�������ļ� "%windir%\SXS.EXE")
IF EXIST %windir%\SVOHOST.EXE (%ATTRIB% %windir%\SVOHOST.EXE & DEL %windir%\SVOHOST.EXE & ECHO ��ɾ�������ļ� "%windir%\SVOHOST.EXE")
IF EXIST %windir%\WINSCOK.DLL (%ATTRIB% %windir%\WINSCOK.DLL & DEL %windir%\WINSCOK.DLL & ECHO ��ɾ�������ļ� "%windir%\WINSCOK.DLL")
IF EXIST %windir%\ufdata2000.log (%ATTRIB% %windir%\ufdata2000.log & DEL %windir%\ufdata2000.log & ECHO ��ɾ�������ļ� "%windir%\ufdata2000.log")

FOR %%b IN (run.reg systemdate.ini wincfgs.exe winlog0n.exe mslogon.exe autorun.vbs autorun.bin autorun.bat autorun.reg autorun.txt autorun.wsh SXS.EXE SVOHOST.EXE WINSCOK.DLL algsrv.exe SocksA.exe FileKan.exe wsctf.exe wsctf.exe.exe EXPLORER.EXE WINL0GON.exe algsrvs.exe msfun80.exe msime82.exe) do (
    IF NOT %%bW==W (
	IF EXIST "%System32%\%%b" (
	    %ATTRIB% "%System32%\%%b"
	    DEL "%System32%\%%b"
	    ECHO ��ɾ�������ļ� "%System32%\%%b"
	)
    )
)

IF EXIST %System%\SXS.EXE (%ATTRIB% %System%\SXS.EXE & DEL %System%\SXS.EXE & ECHO ��ɾ�������ļ� "%System%\SXS.EXE")
IF EXIST %System%\SVOHOST.EXE (%ATTRIB% %System%\SVOHOST.EXE & DEL %System%\SVOHOST.EXE & ECHO ��ɾ�������ļ� "%System%\SVOHOST.EXE")
IF EXIST %System%\WINSCOK.DLL (%ATTRIB% %System%\WINSCOK.DLL & DEL %System%\WINSCOK.DLL & ECHO ��ɾ�������ļ� "%System%\WINSCOK.DLL")

IF EXIST %dllcache%\SXS.EXE (%ATTRIB% %dllcache%\SXS.EXE & DEL %dllcache%\SXS.EXE & ECHO ��ɾ�������ļ� "%dllcache%\SXS.EXE")
IF EXIST %dllcache%\SVOHOST.EXE (%ATTRIB% %dllcache%\SVOHOST.EXE & DEL %dllcache%\SVOHOST.EXE & ECHO ��ɾ�������ļ� "%dllcache%\SVOHOST.EXE")
IF EXIST %dllcache%\WINSCOK.DLL (%ATTRIB% %dllcache%\WINSCOK.DLL & DEL %dllcache%\WINSCOK.DLL & ECHO ��ɾ�������ļ� "%dllcache%\WINSCOK.DLL")

IF EXIST C:\system32\rose.exe DEL /F/A:S C:\system32\rose.exe >NUL 2>NUL
IF EXIST C:\system.sys DEL /F/A:S C:\system.sys >NUL 2>NUL
IF EXIST D:\systemdate.ini DEL /F/A:S D:\systemdate.ini >NUL 2>NUL
IF EXIST D:\systemfile.com DEL /F/A:S D:\systemfile.com >NUL 2>NUL
ECHO.
ECHO.
::ECHO ��ȴ�������ɾ��_desktop.ini�����ļ���
::FOR %%i IN (C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO IF EXIST %%i:\ DEL /F /S /Q /A %%i:\_desktop.ini
::ECHO.
ECHO =====����ɾ�����̸�Ŀ¼�Ĳ����ļ���===================
FOR %%c IN (C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO (
    FOR %%d IN (AutoRun.inf sxs.exe rose.exe AutoRun.vbs tel.xls.exe fun.xls.exe) DO (
	IF EXIST %%c:\%%d (
	    %ATTRIB% %%c:\%%d
	    DEL %%c:\%%d
	    ECHO ��ɾ�������ļ� "%%c:\%%d"
	)
    )
)
ECHO.
ECHO.
ECHO =====����ע���=====================================
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
ECHO =====ɾ��U��/Mp3��Ĳ����ļ���========================
ECHO.
IF EXIST .\RECYCLER (%ATTRIB% .\RECYCLER /S /D & %ATTRIB% .\RECYCLER\* /S & DEL /S /Q .\RECYCLER\* & RD /S /Q .\RECYCLER & ECHO ��ɾ�������ļ���RECYCLER)
FOR %%e IN (AutoRun.inf autorun.bat autorun.bin autorun.reg autorun.txt autorun.wsh autorun.vbs Toy.exe msvcr71.dll RavMonE.exe SHE.exe ctfmon.exe AdobeR.exe AdobeR.exe.log winw0rd.exe tel.xls.exe EXPLORER.EXE Setup.pif fun.xls.exe) do (
    IF NOT %%eW==W (
	IF EXIST .\%%e (
	    %ATTRIB% .\%%e
	    DEL .\%%e
	    ECHO ��ɾ�������ļ� "%%e"
	)
    )
)
ECHO.
ECHO.
ECHO ɱ������. . .
ECHO.
ECHO ע�⣺�˳�U��/Mp3�ٽ����������ʹ�ã�
ECHO.
ECHO ���ɱ����Ӳ�̷�������˫���򿪣������������ԡ�
ECHO.
ECHO �����������뵽 http://virus.lsxk.org/ ��ѯ��
ECHO.
ECHO �밴������˳�. . .
ECHO.
pause >NUL 2>NUL
:END
IF EXIST .\AUTORUN.INF.txt (ATTRIB -R -A -S -H .\AUTORUN.INF.txt & COPY /Y .\AUTORUN.INF.txt .\AUTORUN.INF >NUL 2>NUL & ATTRIB +S +H .\AUTORUN.INF.txt >NUL 2>NUL)
IF EXIST .\AUTORUN.INF ATTRIB +S +H .\AUTORUN.INF >NUL 2>NUL
::::::����cmd��������뷨�Ľ���::::::
%TASKKILL% conime.exe >NUL 2>NUL
TSKILL conime >NUL 2>NUL
ENDLOCAL
exit