@echo off
cls
echo TheCommandLineScanner v1.0, made by weareblahs
echo This defaults the scan settings to 300 dpi, Black and White.
echo You can modify the script to change settings.
echo Initializing...
cd scans >nul
del *.png >nul
cd .. >nul
mkdir scans >nul
set /a result=0
echo When you're ready, press any key.
pause >nul
cls
goto start

:start
echo Scanning page...
:: Modify settings here
wia-cmd-scanner /w 0 /h 0 /dpi 300 /color BW /format PNG /output "scans\%date:~4,2%%date:~7,2%%date:~10,4%%time:~0,2%%time:~3,2%%time:~6,2%.png" >nul
echo Please wait until the scanner finalizes scanning...
timeout 2 >nul
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


:end
echo Scanning complete!
set /p pdf=Type the PDF location / filename (if same folder of script) of the resulting PDF file. Please include ".pdf" at the end of the filename:
cls
echo Saving...
magick scans\*.png "%pdf%"
echo Export to PDF complete!