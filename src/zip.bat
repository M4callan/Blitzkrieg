@echo off
set ZIP=C:\PROGRA~1\7-Zip\7z.exe a -tzip -y -r
set REPO=blitzkrieg
set VERSION=0.0.5

fsum -r -jm -md5 -d%REPO% * > checksum.md5
move checksum.md5 %REPO%/checksum.md5

echo from .main import * >>%REPO%/__init__.py

quick_manifest.exe "Blitzkrieg: Advanced Browser Sidebar" "%REPO%" >%REPO%/manifest.json

echo %VERSION% >%REPO%/VERSION

cd %REPO%
%ZIP% ../%REPO%_v%VERSION%_Anki21.ankiaddon *
