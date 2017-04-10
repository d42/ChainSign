; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "ChainSign"
#define MyAppVersion "0.1"
#define MyAppPublisher "ChainSign"
#define MyAppExeName "chainsign.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{17E42EF5-CC06-4463-AE1C-4D56493233E9}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
OutputDir=build
OutputBaseFilename=ChainSign_setup
SetupIconFile=icon.ico
UninstallDisplayIcon={app}\chainsign.exe
Compression=lzma
SolidCompression=yes
DefaultGroupName=ChainSign

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "installnamecoind"; Description: "Install Namecoin Core"
Name: "setupnamecoind"; Description: "Configure Namecoin Core to allow RPC"

[Files]
Source: "build\namecoin-0.13.99-win32-setup-unsigned.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "build\exe.win32-2.7\chainsign.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "build\exe.win32-2.7\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "namecoin.conf"; DestDir: "{userappdata}\Namecoin"; Tasks: setupnamecoind Flags: uninsneveruninstall onlyifdoesntexist

[Icons]
Name: "{group}\ChainSign"; Filename: "{app}\chainsign.EXE"; WorkingDir: "{app}"
Name: "{group}\Uninstall ChainSign"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\namecoin-0.13.99-win32-setup-unsigned.exe"; Tasks: installnamecoind
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
