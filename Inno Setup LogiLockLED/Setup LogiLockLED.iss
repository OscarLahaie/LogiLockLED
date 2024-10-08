; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{37738065-07D8-4618-9F70-62F502D902BB}
AppName=LogiLockLED
AppVersion=1.6
;AppVerName=LogiLockLED 1.0
AppPublisherURL=https://github.com/infra223/LogiLockLED
AppSupportURL=https://github.com/infra223/LogiLockLED
AppUpdatesURL=https://github.com/infra223/LogiLockLED
DefaultDirName={pf64}\LogiLockLED
DefaultGroupName=LogiLockLED
LicenseFile=..\LogiLockLED\LICENSE.txt
OutputBaseFilename=Setup LogiLockLED
Compression=lzma
SolidCompression=yes
SetupIconFile=..\LogiLockLED\LogiLockLED.ico
UninstallDisplayIcon={app}\LogiLockLED.exe

#include "scripts\products.iss"
#include "scripts\products\stringversion.iss"
#include "scripts\products\winversion.iss"
#include "scripts\products\dotnetfxversion.iss"
//#include "scripts\products\dotnetfx46.iss"
#include "scripts\products\dotnetfx48.iss"

[Code]
function InitializeSetup(): Boolean;
begin
	// initialize windows version
	initwinversion();
  dotnetfx48(80); // install if version < 4.8.0  
  Result := true;
end;


[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\LogiLockLED\bin\Release\LogiLockLED.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\LogiLockLED\bin\Release\LogiLockLED.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\LogiLockLED\bin\Release\LogitechLedEnginesWrapper.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\LogiLockLED\bin\Release\OpenRGB.NET.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\LogiLockLED\bin\Release\NAudio.Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\LogiLockLED\bin\Release\NAudio.Wasapi.dll"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\LogiLockLED"; Filename: "{app}\LogiLockLED.exe"; IconFilename: "{app}\LogiLockLED.exe"; IconIndex: 0
Name: "{commondesktop}\LogiLockLED"; Filename: "{app}\LogiLockLED.exe"; IconFilename: "{app}\LogiLockLED.exe"; IconIndex: 0; Tasks: desktopicon

[Run]
Filename: "{app}\LogiLockLED.exe"; Description: "{cm:LaunchProgram,LogiLockLED}"; Flags: nowait postinstall skipifsilent

[Registry]
Root: "HKCU"; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\Run"; ValueType: string; ValueName: "LogiLockLED"; ValueData: "{app}\LogiLockLED.exe"; Flags: deletevalue
