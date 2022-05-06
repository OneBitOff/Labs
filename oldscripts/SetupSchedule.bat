::Daniel Neff 6/2/21
::adapted heavily from Daniel Schroeder
::This bat file sets the directory to the same as the script provided the bat file and scripts are in the same folder

@ECHO OFF
SET ScriptDirectory=%~dp0
SET PowerShellScriptPath=%ScriptDirectory%EnableStereo.ps1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%'";
::TO run as admin    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%PowerShellScriptPath%""' -Verb RunAs}";

timeout /t 2 /nobreak > NUL

SET PowerShellScriptPath=%ScriptDirectory%ChangeDefaultApps.ps1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%'";

timeout /t 2 /nobreak > NUL

SET PowerShellScriptPath=%ScriptDirectory%Pdfdefault.ps1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%'";

timeout /t 3 /nobreak > NUL

SET PowerShellScriptPath=%ScriptDirectory%QuickAccess.ps1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%'";

timeout /t 2 /nobreak > NUL

SET PowerShellScriptPath=%ScriptDirectory%NoTrace.ps1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%'";

timeout /t 2 /nobreak > NUL

SET PowerShellScriptPath=%ScriptDirectory%NoExOutlook.ps1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%'";

timeout /t 2 /nobreak > NUL

SET PowerShellScriptPath=%ScriptDirectory%ISaveWork.ps1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%'";