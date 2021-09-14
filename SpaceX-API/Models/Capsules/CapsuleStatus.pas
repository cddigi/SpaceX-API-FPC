unit CapsuleStatus;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TCapsuleStatus = (capsUnknown, capsActive, capsRetired, capsDestroyed);

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
    Result := capsUnknown;
  end else if SameText(TCapsuleStatusCodeSync_Code_1, AValue) then begin
    Result := capsActive;
  end else if SameText(TCapsuleStatusCodeSync_Code_2, AValue) then begin
    Result := capsRetired;
  end else if SameText(TCapsuleStatusCodeSync_Code_3, AValue) then begin
    Result := capsDestroyed;
  end else
    raise Exception.CreateFmt(
      'CodeToCapsuleStatus(AValue: string): Unable to find valid CapsuleStatus for Code, [%s]',
      [VarToStr(AValue)]);
end;

function CapsuleStatusToCode(AValue: TCapsuleStatus): string;
begin
  case AValue of
    capsUnknown:
      Result := TCapsuleStatusCodeSync_Code_0;
    capsActive:
      Result := TCapsuleStatusCodeSync_Code_1;
    capsRetired:
      Result := TCapsuleStatusCodeSync_Code_2;
    capsDestroyed:
      Result := TCapsuleStatusCodeSync_Code_3;
  end;
end;

end.

