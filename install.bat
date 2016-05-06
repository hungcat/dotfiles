@echo off
echo %0: Running.

set PWD=%~dp0
cd %PWD%

if "%HOMEPATH%" equ "" (
  echo %0: Error. Please set HOME.
  goto FAIL
)

for /F %%f in ('dir /B ".?*"') do (
  setlocal
  if "%%f" equ ".git" (
    rem;
  ) else if "%%f" equ ".gitignore" (
    rem;
  ) else if "%%f" equ ".gitmodules" (
    rem;
  ) else (
    echo %0: symlink %HOMEPATH%\%%f -^> %PWD%%%f
    if exist %PWD%%%f\ (
      mklink /d %HOMEPATH%\%%f "%PWD%%%f"
    ) else (
      mklink %HOMEPATH%\%%f "%PWD%%%f"
    )
  )
)

echo %0: Complete!
pause
exit /b 0

:FAIL
echo %0: Failed.
pause
exit /b 1