# TheCommandLineScanner
Scan pages into PDF to help minimizing your scanning jobs. Uses ImageMagick and wia-cmd-scanner.

## Background of this project
So basically, I'm in an online exam - and that time, I'm thinking about making a script that can scan my exam papers after exams. So, that's why this script is born.

## How's the process?
Workflow as below:
```
Scan to PNG (until scan complete) > Use ImageMagick to convert / package PNG files into PDF files
```

## External softwares used
 - wia-cmd-scanner by @nagimov
 - ImageMagick

## What you need
 - Scanner compatible with WIA

## How to use this?
### First-time setup
1. Install ImageMagick from https://imagemagick.org/script/download.php. If you don't know how to set it up, then run `installimagemagick.bat` after downloading the ZIP file from Releases.
2. Run `scanner.bat`.
   - Or, you can open CMD, point to the directory, then type scanner.
3. Follow the steps at the batch file to scan.

### How to change settings?
See `config.ini` to change settings.

## Other alternatives that I recommend
**NAPS2 (Not Another PDF Scanner 2)** - This one is technically a "GUI" version of this software, which it acts like the same thing used on this software. Plus, it also have TWAIN support, save to image support and OCR. Highly recommended if you want to get a graphical user interface for scanning. Download it on https://github.com/cyanfish/naps2/releases.
