unit CrewStatus;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TCrewStatus = (crewUnknown, crewActive, crewInactive, crewRetired);

var
  TCrewStatusCodeSync_Code_0: string = 'unknown';
  TCrewStatusCodeSync_Code_1: string = 'active';
  TCrewStatusCodeSync_Code_2: string = 'inactive';
  TCrewStatusCodeSync_Code_3: string = 'retired';

function CodeToCrewStatus(AValue: string): TCrewStatus;
function CrewStatusToCode(AValue: TCrewStatus): string;

implementation

uses
  Variants;

function CodeToCrewStatus(AValue: string): TCrewStatus;
begin
  if SameText(TCrewStatusCodeSync_Code_0, AValue) then begin
    Result := crewUnknown;
  end else if SameText(TCrewStatusCodeSync_Code_1, AValue) then begin
    Result := crewActive;
  end else if SameText(TCrewStatusCodeSync_Code_2, AValue) then begin
    Result := crewInactive;
  end else if SameText(TCrewStatusCodeSync_Code_3, AValue) then begin
    Result := crewRetired;
  end else
    raise Exception.CreateFmt(
      'CodeToCrewStatus(AValue: string): Unable to find valid CrewStatus for Code, [%s]',
      [VarToStr(AValue)]);
end;

function CrewStatusToCode(AValue: TCrewStatus): string;
begin
  case AValue of
    crewUnknown:
      Result := TCrewStatusCodeSync_Code_0;
    crewActive:
      Result := TCrewStatusCodeSync_Code_1;
    crewInactive:
      Result := TCrewStatusCodeSync_Code_2;
    crewRetired:
      Result := TCrewStatusCodeSync_Code_3;
  end;
end;

end.

