@echo off

for /L %%i IN (,,00) do call :docopy %%i
goto end

:docopy
set FN=00%
set FN=%FN:~-3%

copy status.js tweet%FN%.js

:end