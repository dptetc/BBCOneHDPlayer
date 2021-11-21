[Setup]
SourceDir=.
OutputDir=BBCOneHDPlayerSetup
AppName=BBC One HD Player
AppVerName=BBC One HD Player
AppVersion=BBC One HD Player
AppPublisher=DartPower Team
AppCopyright=DartPower Team
AppPublisherURL=http://vk.com/dpteam
AppSupportURL=http://vk.com/dpteam
AppUpdatesURL=http://vk.com/dpteam
DefaultDirName={sd}\Program Files\BBC One HD Player
DefaultGroupName=BBC One HD Player
AllowNoIcons=yes
OutputBaseFilename=setup
WizardImageFile=left.bmp
WizardSmallImageFile=up.bmp
SetupIconFile=icon.ico
Compression=lzma2/ultra64
SolidCompression=yes
UninstallDisplayIcon={uninstallexe}
InternalCompressLevel=ultra
CompressionThreads=2
DiskSpanning=yes
DiskSliceSize=2100000000

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "..\BBCOneHDPlayer\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs sortfilesbyextension
Source: "C:\Windows\Fonts\Tahoma.ttf"; DestDir: "{fonts}"; FontInstall: "Segoe UI"; Flags: onlyifdoesntexist uninsneveruninstall

[Icons]
Name: "{group}\BBC One HD Player"; Filename: "{app}\BBCOneHDPlayer.LauncherCPP.exe"; WorkingDir: "{app}";
Name: "{userdesktop}\BBC One HD Player"; Filename: "{app}\BBCOneHDPlayer.LauncherCPP.exe"; WorkingDir: "{app}"; Tasks: desktopicon;
Name: "{group}\{cm:UninstallProgram,BBC One HD Player}"; Filename: "{uninstallexe}"

[Run]
Description: "{cm:LaunchProgram, проигрыватель}"; Filename: "{app}\BBCOneHDPlayer.LauncherCPP.exe"; WorkingDir: "{app}"; Flags: nowait postinstall skipifsilent unchecked

[UninstallDelete]
Type: filesandordirs; Name: "{app}"
