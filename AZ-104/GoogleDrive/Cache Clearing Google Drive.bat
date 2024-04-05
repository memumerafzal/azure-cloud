@echo off
setlocal

REM Specify the folder to delete
set "folderToDelete=C:\Users\Admin\AppData\Local\Google\DriveFS\117315649499303846559\content_cache"

REM Check if the folder exists
if exist "%folderToDelete%" (
    echo Deleting folder: %folderToDelete%
    rmdir /s /q "%folderToDelete%"
    if errorlevel 1 (
        echo Failed to delete folder.
        exit /b 1
    ) else (
        echo Folder deleted successfully.
    )
) else (
    echo The folder does not exist: %folderToDelete%
    exit /b 1
)

REM Check if Google Drive is running
tasklist /FI "IMAGENAME eq GoogleDriveFS.exe" 2>NUL | find /I /N "GoogleDriveFS.exe">NUL
if "%ERRORLEVEL%"=="0" (
    REM If Google Drive is running, stop it
    taskkill /F /IM GoogleDriveFS.exe
    
    REM Wait for a few seconds to ensure Google Drive has stopped
    timeout /t 5 /nobreak
)

REM Start Google Drive
start "" "C:\Program Files\Google\Drive File Stream\81.0.3.0\GoogleDriveFS.exe"

REM Optionally, you can add a delay here if needed
REM timeout /t 10 /nobreak

REM Confirm that Google Drive has been restarted
tasklist /FI "IMAGENAME eq GoogleDriveFS.exe" 2>NUL | find /I /N "GoogleDriveFS.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo Google Drive has been restarted.
) else (
    echo Failed to restart Google Drive.
)

REM Pause to keep the batch window open for viewing the result (optional)
pause
