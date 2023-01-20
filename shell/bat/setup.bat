@echo off
@echo =========================
@echo author 独孤逸辰
@echo blog:http://blog.meituo.net
@echo email:cuijiudai@gmail.com
@echo update:2011-05-19
@echo =========================
@echo 添加任务
SCHTASKS /Create /SC DAILY /ST 23:00:00 /TN "auto update SVN" /TR  "%~sdp0autosvn.bat" /F
