@echo off
echo make sure Everything.exe is signed before calling.
call c:\dev\everything\set1.5version.bat

SET WIX_PLATFORM=x64
SET WIX_PROGRAMNAME=Everything %EVERYTHING_VERSION% (%WIX_PLATFORM%)
SET WIX_UPGRADECODE=429071B2-0162-45AA-84AD-28F047E15638
SET WIX_WIN64=yes
SET WIX_PLATFORMPROGRAMFILESFOLDER=ProgramFiles64Folder
SET WIX_EVERYTHINGEXESOURCE=C:\dev\everything\x64\Debug\Everything.exe

del *.wixobj

REM: ignore ICE30 if all possible conditions are handled. (we do with: with_service and no_service)
"C:\Program Files (x86)\WiX Toolset v3.11\bin\candle.exe" *.wxs -ext WixUtilExtension
"C:\Program Files (x86)\WiX Toolset v3.11\bin\light.exe" *.wixobj -o Everything-%EVERYTHINGVERSION%.%WIX_PLATFORM%-Setup.msi -ext WixUIExtension -ext WixUtilExtension -cultures:en-us -dWixUILicenseRtf=C:\dev\Everything\License.rtf -dWixUIBannerBmp=C:\dev\everything\msi\wix.banner.rle.bmp
 
pause