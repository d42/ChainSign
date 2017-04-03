@echo off

set innopath="C:\Program Files (x86)\Inno Setup 5"
set pythonpath="buildreqs/WinPython-32bit-2.7.13.1Zero/python-2.7.13"

set python_exe=%pythonpath%\python.exe
set iscc_exe=%innopath%\ISCC.exe

echo - install requirements
%python_exe% -m pip install cx_freeze
%python_exe% -m pip install -r requirements.txt

echo - distutils cx_freeze build
%python_exe% setup.py build || goto :error

echo - cleanup
rd /S /Q build\exe.win32-2.7\PySide\examples
rd /S /Q build\exe.win32-2.7\PySide\translations
rd /S /Q build\exe.win32-2.7\PySide\docs
rd /S /Q build\exe.win32-2.7\PySide\scripts
rd /S /Q build\exe.win32-2.7\PySide\typesystems
del /Q build\exe.win32-2.7\PySide\*.exe
del /Q build\exe.win32-2.7\PySide\QtWebKit*
del /Q build\exe.win32-2.7\PySide\QtDesigner*
del /Q build\exe.win32-2.7\PySide\QtXmlPatterns*
del /Q build\exe.win32-2.7\PySide\Qt3Support4*

echo - Inno Setup build
%iscc_exe% "installer.iss" || goto :error

echo - Finished!
pause
exit 0

:error
echo - Failed!
pause
exit 1
