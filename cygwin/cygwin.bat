@echo off

C:
chdir C:\cygwin\bin

REM bash --login -i
rxvt -fg white -bg black  +ls -sr -sl 40000 -fn "Courier New-16" --geometry 128x32 -e bash -l -i 
