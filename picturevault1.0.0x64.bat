@ECHO OFF
COLOR 33
TITLE PictureVault
:start
ECHO NOTE: You need 7-zip to run this program 
ECHO -------------------------------
set /p Disk=Disk to put the folder:
ECHO -------------------------------
set /p FolderName=name of the folder:
ECHO -------------------------------
set /p FileNeedHidden1=file that need hidden 1:
ECHO -------------------------------
set /p FileNeedHidden2=file that need hidden 2:
ECHO -------------------------------
set /p ImageInputName=the image you want to contain files:
ECHO -------------------------------
set /p ImageOutputName=The image that appears after the process, contain files:
ECHO -------------------------------
set /p CompressName=compress name for your files you want to hide:
ECHO -------------------------------
set /p ExtensionsHidden=you need 2 files have the same extension. example: *.extension:
ECHO -------------------------------
ECHO.
ECHO If you finished type in forms please press any Key to continue.
PAUSE >NUL

REM Make the folder
MKDIR %Disk%\%FolderName%

REM zip 2 files using 7-Zip
for /f "tokens=3,2,4 delims=/- " %%x in ("%hidfiles%") do set h=%%y%%x%%z
set hidfiles=%h%
"C:\Program Files\7-Zip\7z.exe" a -tzip "%Disk%\%FolderName%\%CompressName%%h%.rar" "%Disk%\%FolderName%\%ExtensionsHidden%"

REM Delete files that need hidden after have the .rar compress
del /f %FileNeedHidden1%
del /f %FileNeedHidden2%

REM Hide files in the picture "cheemsborgir.jpg" 
cd %Disk%/%FolderName%
copy /b %ImageInputName%.jpg + %CompressName%.rar %ImageOutputName%.jpg
msg * The progress is complete 
PAUSE 

REM Ask user want to out or continue using the program
ECHO Continue using the program? (TYPE YES/NO)
set /p continue?
IF %continue?%==NO exit 
IF %continue?%==YES goto start




