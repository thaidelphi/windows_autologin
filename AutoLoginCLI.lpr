program AutoLoginCLI;

{$mode objfpc}{$H+}

uses
  Classes, SysUtils, Registry;

procedure EnableAutoLogin(const AUsername, APassword, ADomain: string);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    // Requires Administrator privileges to write to HKEY_LOCAL_MACHINE
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    
    // Open the Winlogon registry key
    if Reg.OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon', True) then
    begin
      Reg.WriteString('AutoAdminLogon', '1');
      Reg.WriteString('DefaultUserName', AUsername);
      Reg.WriteString('DefaultPassword', APassword);
      
      if ADomain <> '' then
        Reg.WriteString('DefaultDomainName', ADomain)
      else
      begin
        if Reg.ValueExists('DefaultDomainName') then
          Reg.DeleteValue('DefaultDomainName');
      end;
      
      Writeln('Auto-login configured successfully!');
      Writeln('Note: Make sure to run this program as Administrator.');
      Reg.CloseKey;
    end
    else
    begin
      Writeln('Error: Failed to open registry key.');
      Writeln('Please make sure you are running this program as an Administrator.');
    end;
  finally
    Reg.Free;
  end;
end;

procedure DisableAutoLogin;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon', True) then
    begin
      Reg.WriteString('AutoAdminLogon', '0');
      // For security, delete the password entry when disabling
      if Reg.ValueExists('DefaultPassword') then
        Reg.DeleteValue('DefaultPassword');
        
      Writeln('Auto-login disabled successfully.');
      Reg.CloseKey;
    end
    else
    begin
      Writeln('Error: Failed to open registry key. Please run as Administrator.');
    end;
  finally
    Reg.Free;
  end;
end;

var
  Action: string;
  Username, Password, Domain: string;

begin
  Writeln('Windows Auto Login Configurator');
  Writeln('===============================');

  if ParamCount = 0 then
  begin
    Writeln('Usage:');
    Writeln('  Enable:  AutoLoginCLI.exe enable <username> <password> [domain]');
    Writeln('  Disable: AutoLoginCLI.exe disable');
    Exit;
  end;

  Action := LowerCase(ParamStr(1));

  if Action = 'enable' then
  begin
    if ParamCount >= 3 then
    begin
      Username := ParamStr(2);
      Password := ParamStr(3);
      if ParamCount >= 4 then
        Domain := ParamStr(4)
      else
        Domain := '';
        
      EnableAutoLogin(Username, Password, Domain);
    end
    else
      Writeln('Error: Missing username or password parameters.');
  end
  else if Action = 'disable' then
  begin
    DisableAutoLogin;
  end
  else
  begin
    Writeln('Error: Unknown action "', Action, '"');
  end;
end.
