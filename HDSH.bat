@echo off 
if [%1]==[] (
echo %~n0.exe : ^(c^)Ahmed Abied : medooped020@gmail.com
echo Version: 0.0.1 
echo.
echo Usage: %~n0.exe [Path] [Show / Hide ^(Defult^)]
echo. 
echo Show  : Show a hidden File/Folder 
echo Hide  : Hide a visible File/Folder 
echo.
echo Description:
echo    CMD tool to hide and deny the user access for the file or the folder 
echo.
echo Examples:
echo   %~n0 D:\*.jpg show  
echo.
echo Note:
echo   The tool is still under development
goto end 
) 
if not exist "%1" (
echo. 
echo Cant find the file specfied 
goto end
) 
if [%2]==[] goto hide 
if [%2]==[show] goto show 
if [%2]==[hide] goto hide 
:hide 
if not exist "%1" (
echo.
echo Can't find the file specified 
goto end
) 
if not exist "%1\*" (
Attrib +s +h +r +i +a /s /d /l "%1" >nul 
icacls "%1" /deny Everyone:f >nul
echo. 
echo File Hidden
goto end 
)
if exist "%1\* (
attrib +s +h +r +i +a /s /d /l * "%1" >nul 
icacls "%1" /deny Everyone:F /t >nul
echo.
Echo folder hidden  
goto :end 
)
:show 
if not exist "%1" ( 
echo.
echo Can't find the file specified
goto end 
) 
if not exist "%1\*" (
attrib -s -h -r -i -a /s /d /l "%1" >nul 
icacls "%1" /grant Everyone:F >nul 
echo.
echo File visible
goto end 
)
if exist "%1\*" (
attrib -s -h -r -i -a /s /d /l %1 >nul 
icacls %1 /grant Everyone:F /t >nul 
echo.
echo folder visible
goto end 
)
:end 
