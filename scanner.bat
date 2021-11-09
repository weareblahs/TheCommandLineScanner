@echo off
:: Program init
echo Initialization in progress...
:: Bring in the config.ini properties
for /f "delims=" %%i in ('ini config.ini BasicSettings ScannerPDFDir') do set output=%%i >nul
for /f "delims=" %%i in ('ini config.ini BasicSettings ScannerDPI') do set dpi=%%i >nul
for /f "delims=" %%i in ('ini config.ini BasicSettings ScannerWidth') do set width=%%i >nul
for /f "delims=" %%i in ('ini config.ini BasicSettings ScannerHeight') do set height=%%i >nul
for /f "delims=" %%i in ('ini config.ini BasicSettings ScannerColor') do set color=%%i >nul
for /f "delims=" %%i in ('ini config.ini BasicSettings ScannerTempDir') do set tempdir=%%i >nul
for /f "delims=" %%i in ('ini config.ini BasicSettings ScannerTempOutFormat') do set fmt=%%i >nul
for /f "delims=" %%i in ('ini config.ini TimerScanSettings Timer') do set timer=%%i >nul
for /f "delims=" %%i in ('ini config.ini BasicSettings WaitTime') do set waittime=%%i >nul
for /f "delims=" %%i in ('ini config.ini TimerScanSettings Pages') do set pages=%%i >nul
:: Reset counter
set /a result=0
set /a pagecounter=0
goto startup

:: Program startup
:startup
cls
echo TheCommandLineScanner v1.2, made by weareblahs
echo Modify your settings in the config.ini file.
echo [1]: Normal Scan
echo [2]: Scan with timer
set /p check=Please select an option: 
if %check%== 1 goto start
if %check%== 2 goto start_timer
pause >nul
cls
goto start

:start
echo Scanning page...
wia-cmd-scanner /w %width% /h %height% /dpi %dpi% /color %color% /format %fmt% /output "temp\%date:~4,2%%date:~7,2%%date:~10,4%%time:~0,2%%time:~3,2%%time:~6,2%.png" >nul
echo Please wait until the scanner finalizes scanning...
timeout %waittime% >nul
cls
set /a result=%result%+1
echo %result% pages scanned.
echo Do you have any other pages to scan?
echo [Y]: Continue scanning - Please put the next page / paper
echo [N]: Complete scan
set /p check=
if %check%== Y goto start
if %check%== y goto start
if %check%== N goto end
if %check%== n goto end

:start_timer
cls
echo Pages can be set at config.ini at the "Pages" property.
echo Press any key to start scanning.
pause >nul
goto autoscan

:autoscan
cls
echo Scanning page...
wia-cmd-scanner /w %width% /h %height% /dpi %dpi% /color %color% /format %fmt% /output "temp\%date:~4,2%%date:~7,2%%date:~10,4%%time:~0,2%%time:~3,2%%time:~6,2%.png" >nul
echo Please wait until the scanner finalizes scanning...
timeout %waittime% >nul
cls
set /a result=%result%+1
set /a pagecounter=%pagecounter%+1
echo %result% of %pages% pages scanned.
echo Waiting for timer to finish...
echo Currently, it is set to %timer% seconds.
timeout %timer% >nul
if %pagecounter%==%pages% goto end
goto autoscan

:end
echo Scanning complete!
set /p pdf=Type the PDF location / filename without the PDF file extension. The file will be saved in your selected directory at the config.ini file.: 
cls
echo Saving...
magick temp\*.png "%ScannerPDFDir%\%pdf%.pdf"
echo Export to PDF complete!
echo Press any key to exit.
pause >nul
echo Deleting temp files...
cd scans >nul
del *.png >nul
del *.bmp >nul
del *.tif >nul
del *.tiff >nul
del *.jpg >nul