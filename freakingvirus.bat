@echo off
title virus.bat

:: Create a VBScript to show the confirmation message box
echo X=MsgBox("Confirm run this program?", 4 + 32, "virus.bat") > %temp%\confirm.vbs

:: Run the VBScript and capture the result
cscript //nologo %temp%\confirm.vbs
set "result=%errorlevel%"

:: Clean up the VBScript file
del %temp%\confirm.vbs

:: Check the result of the message box
:: 6 is the return code for "Yes"
:: 7 is the return code for "No"
if "%result%" == "6" (
    goto :RunPopups
) else if "%result%" == "7" (
    goto :ExitScript
) else (
    :: Handle unexpected results (e.g., closing the message box)
    goto :ExitScript
)

:RunPopups
:: Define some random words
set "word[1]=Hello"
set "word[2]=World"
set "word[3]=Random"
set "word[4]=Batch"
set "word[5]=Script"
set "word[6]=Pop-up"
set "word[7]=Window"
set "word[8]=Fun"
set "word[9]=Code"
set "word[10]=Test"
set "word[11]=Example"
set "word[12]=Learn"
set "word[13]=Computer"
set "word[14]=Programming"
set "word[15]=Awesome"
set "word[16]=Creative"
set "word[17]=Experiment"
set "word[18]=System"
set "word[19]=Taskbar"
set "word[20]=Desktop"

:: Get the number of words
set "num_words=20"

:: Loop 20 times to create pop-ups
for /l %%i in (1, 1, 20) do (
    :: Generate a random index
    set /a "random_index=(%random% %% %num_words%) + 1"
    setlocal enabledelayedexpansion
    set "random_word=!word[%random_index%]!"
    endlocal
    :: Create a VBScript to show a small message box with the random word
    echo X=MsgBox("%random_word%", 0, "Popup %%i of 20") > %temp%\popup.vbs
    :: Run the VBScript in a new, detached process
    start "" cscript //nologo %temp%\popup.vbs
    :: Clean up the VBScript file (optional, but good practice)
    :: del %temp%\popup.vbs
    :: Add a small delay to make the pop-ups appear sequentially
    timeout /t 0 >nul
)

:: Clean up the last popup VBScript file
del %temp%\popup.vbs

goto :EndScript

:ExitScript
echo You chose not to run the program. Exiting.
:: Taskkill the current batch file process
taskkill /f /fi "WINDOWTITLE eq virus.bat" /im cmd.exe

:EndScript
exit