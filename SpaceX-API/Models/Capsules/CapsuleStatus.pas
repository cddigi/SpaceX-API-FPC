unit CapsuleStatus;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TCapsuleStatus = (csUnknown, csActive, csRetired, csDestroyed);

var
  TCapsuleStatusCodeSync_Code_0: string = 'unknown';
  TCapsuleStatusCodeSync_Code_1: string = 'active';
  TCapsuleStatusCodeSync_Code_2: string = 'retired';
  TCapsuleStatusCodeSync_Code_3: string = 'destroyed';

function CodeToCapsuleStatus(AValue: string): TCapsuleStatus;
function CapsuleStatusToCode(AValue: TCapsuleStatus): string;

implementation

uses
  Variants;

function CodeToCapsuleStatus(AValue: string): TCapsuleStatus;
begin
  if SameText(TCapsuleStatusCodeSync_Code_0, AValue) then begin
    Result := csUnknown;
  end else if SameText(TCapsuleStatusCodeSync_Code_1, AValue) then begin
    Result := csActive;
  end else if SameText(TCapsuleStatusCodeSync_Code_2, AValue) then begin
    Result := csRetired;
  end else if SameText(TCapsuleStatusCodeSync_Code_3, AValue) then begin
    Result := csDestroyed;
  end else
    raise Exception.CreateFmt(
      'CodeToCapsuleStatus(AValue: string): Unable to find valid CapsuleStatus for Code, [%s]',
      [VarToStr(AValue)]);
end;

function CapsuleStatusToCode(AValue: TCapsuleStatus): string;
begin
  case AValue of
    csUnknown:
      Result := TCapsuleStatusCodeSync_Code_0;
    csActive:
      Result := TCapsuleStatusCodeSync_Code_1;
    csRetired:
      Result := TCapsuleStatusCodeSync_Code_2;
    csDestroyed:
      Result := TCapsuleStatusCodeSync_Code_3;
  end;
end;

end.

