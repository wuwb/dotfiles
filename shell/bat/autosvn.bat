@echo off
@echo =========================
@echo author 独孤逸辰
@echo blog:http://blog.meituo.net
@echo email:cuijiudai@gmail.com
@echo update:2011-05-19
@echo =========================
set svn_home=C:\Program Files\TortoiseSVN\bin
set svn_work=D:\wwwroot\static
set setup_path=D:\conf\autosvn
@echo 正在更新目录 %svn_work%
if exist %svn_work% GOTO :gengxin else GOTO :MK
:MK
@echo 请检查您的工作目录是否正确
echo & pause GOTO :END
@echo 更新完成退出
goto :END
:END
exit
:gengxin
if exist "%setup_path%"\autoUpdate.log (echo update: %date% %time%  >> "%setup_path%"\autoUpdate.log) else echo create: %date% %time% >"%setup_path%"\autoUpdate.log
"%svn_home%"\TortoiseProc.exe/command:update /path:"%svn_work%" /notempfile /closeonend:1
exit
