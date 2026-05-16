REM =======================================================
REM 7z-Mass-Compressor v1.1
REM Created by Cody Clowes (https://github.com/clowesc/7z-Mass-Compressor)
REM Licensed under MIT License
REM =======================================================
@echo off
setlocal DisableDelayedExpansion

set "zipExe=C:\Program Files\7-Zip\7z.exe"
set "successCount=0"

echo -------------------------------------------------------
echo 7-Zip Individual File Compressor (v1.2 - Thread Control)
echo -------------------------------------------------------
set /p "userInput=Enter Dictionary Size in MB (e.g., 128): "
set /p "threadsInput=Enter Number of CPU Cores/Threads (e.g., 2, 4, or * for max) [Default: *]: "

REM Handle the 'm' suffix safely without delayed expansion
set "tempSize=%userInput%"
set "dictSize=%tempSize:m=%"
set "dictSize=%dictSize%m"

REM Set default to '*' if the user just presses Enter for threads
set "threads=%threadsInput%"
if "%threads%"=="" set "threads=*"

REM We use a standard FOR loop but CALL a subroutine to handle the work.
REM This prevents filenames with symbols from breaking the loop logic.

for /r %%f in (*) do (
    if /I not "%%~xf"==".bat" if /I not "%%~xf"==".7z" (
        call :ProcessFile "%%f"
    )
)

echo.
echo -------------------------------------------------------
echo Done! %successCount% files were compressed successfully.
echo -------------------------------------------------------
goto ask

:ProcessFile
echo Compressing: %~nx1 with %dictSize% dictionary using %threads% thread(s)...
"%zipExe%" a -t7z "%~dpn1.7z" "%~1" -mx=9 -m0=lzma2 -md=%dictSize% -mmt=%threads%
if not errorlevel 1 (
    set /a successCount+=1
)
goto :eof

:ask
set /p "cleanup=Finished. Would you like to delete the original files? (Y/N): "
if /I "%cleanup%"=="Y" (
    for /r %%f in (*) do (
        if /I not "%%~xf"==".bat" if /I not "%%~xf"==".7z" del /f /q "%%f"
    )
    echo Originals deleted.
)
pause
