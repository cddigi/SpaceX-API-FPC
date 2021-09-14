unit LaunchpadStatus;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TLaunchpadStatus = (launchUnknown, launchActive, launchInactive, launchRetired, launchLost,  launchUnderConstruction);

var
  TLaunchpadStatusCodeSync_Code_0: string = 'unknown';
  TLaunchpadStatusCodeSync_Code_1: string = 'active';
  TLaunchpadStatusCodeSync_Code_2: string = 'inactive';
  TLaunchpadStatusCodeSync_Code_3: string = 'retired';
  TLaunchpadStatusCodeSync_Code_4: string = 'lost';
  TLaunchpadStatusCodeSync_Code_5: string = 'under_construction';

function CodeToLaunchpadStatus(AValue: string): TLaunchpadStatus;
function LaunchpadStatusToCode(AValue: TLaunchpadStatus): string;

implementation

uses
  Variants;

function CodeToLaunchpadStatus(AValue: string): TLaunchpadStatus;
begin
  if SameText(TLaunchpadStatusCodeSync_Code_0, AValue) then begin
    Result := launchUnknown;
  end else if SameText(TLaunchpadStatusCodeSync_Code_1, AValue) then begin
    Result := launchActive;
  end else if SameText(TLaunchpadStatusCodeSync_Code_2, AValue) then begin
    Result := launchInactive;
  end else if SameText(TLaunchpadStatusCodeSync_Code_3, AValue) then begin
    Result := launchRetired;
  end else if SameText(TLaunchpadStatusCodeSync_Code_4, AValue) then begin
    Result := launchLost;
  end else if SameText(TLaunchpadStatusCodeSync_Code_5, AValue) then begin
    Result := launchUnderConstruction;
  end else
    raise Exception.CreateFmt(
      'CodeToLaunchpadStatus(AValue: string): Unable to find valid LaunchpadStatus for Code, [%s]',
      [VarToStr(AValue)]);
end;

function LaunchpadStatusToCode(AValue: TLaunchpadStatus): string;
begin
  case AValue of
    launchUnknown:
      Result := TLaunchpadStatusCodeSync_Code_0;
    launchActive:
      Result := TLaunchpadStatusCodeSync_Code_1;
    launchInactive:
      Result := TLaunchpadStatusCodeSync_Code_2;
    launchRetired:
      Result := TLaunchpadStatusCodeSync_Code_3;
    launchLost:
      Result := TLaunchpadStatusCodeSync_Code_4;
    launchUnderConstruction:
      Result := TLaunchpadStatusCodeSync_Code_5;
  end;
end;

end.

