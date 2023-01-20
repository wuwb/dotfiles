net stop iphlpsvc
net stop BITS

robocopy "C:\Users" "D:\Users" /E /COPYALL /XJ
rmdir "C:\Users" /S /Q
mklink /J "C:\Users" "D:\Users"
mklink /J "C:\Users\Default User" "D:\Users\Default"

robocopy "C:\Program Files (x86)" "D:\Program Files (x86)" /E /COPYALL /XJ
rmdir "C:\Program Files (x86)" /S /Q
mklink /J "C:\Program Files (x86)" "D:\Program Files (x86)"

robocopy "C:\Program Files" "D:\Program Files" /E /COPYALL /XJ
rmdir "C:\Program Files" /S /Q
mklink /J "C:\Program Files" "D:\Program Files"

robocopy "C:\ProgramDate" "D:\ProgramDate" /E /COPYALL /XJ
rmdir "C:\ProgramDate" /S /Q
mklink /J "C:\ProgramDate" "D:\ProgramDate
