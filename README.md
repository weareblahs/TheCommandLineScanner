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
