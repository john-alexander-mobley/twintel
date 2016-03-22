::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::echo off
::set  Test[0]="test"
::set  Test[1]="test0"
::set  Test[2]="test1"
::set  Test[3]="test2"

::for /L %%a in (0,1,2) do call echo %%Test[%%a]%%
::pause
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::Populate an array with contents of tweets.txt, store in arrar local variable

@echo off &setlocal enabledelayedexpansion
for /F "delims=" %%a in (C:\a\aprilmaycarter.github.io\tweets.txt) do (
    set /A count+=1
    set "array[!count!]=%%a"
)
for /L %%i in (1,1,%count%) do echo !array[%%i]!

::count the lines in tweets.txt, store in %Count% environment Variable

for /f %%b in ('Find /V /C "" ^< C:\a\aprilmaycarter.github.io\tweets.txt') do set Count=%%b  
echo The file has %Count% lines.

::for each int c in %Count% environment Variable, create copy of file status.js of form tweet+c+.js

for /L %%c IN (1,1,%Count%) do call :docopy %%c

goto endcopy

:docopy
set FN=00%1
set FN=%FN:~-3%
copy main.js tweet%FN%.js 
::::@echo on
::::echo !array[%1]!
::::echo %%Test[%%a]%%
::::@echo off
::::pause
call :FindReplace "?" "!array[%1]!" tweet%FN%.js

:endcopy
goto break
@echo off
setlocal

::call :FindReplace "findstr" "replacestr" input.txt



:FindReplace <findstr> <replstr> <file>
set tmp="%temp%\tmp.txt"
If not exist %temp%\_.vbs call :MakeReplace
for /f "tokens=*" %%a in ('dir "%3" /s /b /a-d /on') do (
  for /f "usebackq" %%b in (`Findstr /mic:"%~1" "%%a"`) do (
    echo(&Echo Replacing "%~1" with "%~2" in file %%~nxa
    <%%a cscript //nologo %temp%\_.vbs "%~1" "%~2">%tmp%
    if exist %tmp% move /Y %tmp% "%%~dpnxa">nul
  )
)
del %temp%\_.vbs

:MakeReplace
>%temp%\_.vbs echo with Wscript
>>%temp%\_.vbs echo set args=.arguments
>>%temp%\_.vbs echo .StdOut.Write _
>>%temp%\_.vbs echo Replace(.StdIn.ReadAll,args(0),args(1),1,-1,1)
>>%temp%\_.vbs echo end with

:break

::pause