# TheCommandLineScanner
Scan pages into PDF to help minimizing your scanning jobs. Uses ImageMagick and wia-cmd-scanner.

## Background of this project
So basically, I'm in an online exam that time I was thinking about this project. Tools like NAPS2 can help me, but you have to manually press "Scan" after scanning every pages. So, I decided to make this project, which allows users to change paper after several seconds.

## How's the process?
Workflow as below:
```
Type in how many pages you want to scan > scan page > Wait 5s > scan page > (until all 5 pages has been scanned) > type output file directory > complete
```

## External softwares used
 - wia-cmd-scanner by @nagimov
 - ImageMagick

## How to use this?
### First-time setup
1. Install ImageMagick from https://imagemagick.org/script/download.php. If you don't know how to set it up, then run `installimagemagick.bat` after downloading the ZIP file from Releases.
2. Run `scanner.bat`.
   - Or, you can open CMD, point to the directory, then type scanner.
3. Follow the steps at the batch file to scan.

### How to change settings?
Open `scanner.bat` then modify this line:
```batch
wia-cmd-scanner /w 0 /h 0 /dpi 300 /color BW /format PNG /output "scans\%date:~4,2%%date:~7,2%%date:~10,4%%time:~0,2%%time:~3,2%%time:~6,2%.png" >nul
```
`/w`: Width.  
`/h`: Height.  
 - If used `/w 0 /h 0`, that means that it will scan the entire printer / scanner's scan size.
`/color`: Select color options for scanning. Available options:
 - `BW`: Black and White (default)
 - `GRAY`: Grayscale
 - `RGB`: Full color
`/format`: Output image format before it repackages to PDF.
 - Available formats are BMP, PNG, GIF, JPG and TIF.
