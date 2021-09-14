unit CoreStatus;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TCoreStatus = (coreUnknown, coreActive, coreInactive, coreExpended, coreRetired, coreLost);

var
  TCoreStatusCodeSync_Code_0: string = 'unknown';
  TCoreStatusCodeSync_Code_1: string = 'active';
  TCoreStatusCodeSync_Code_2: string = 'inactive';
  TCoreStatusCodeSync_Code_3: string = 'expended';
  TCoreStatusCodeSync_Code_4: string = 'retired';
  TCoreStatusCodeSync_Code_5: string = 'lost';

function CodeToCoreStatus(AValue: string): TCoreStatus;
function CoreStatusToCode(AValue: TCoreStatus): string;

implementation

uses
  Variants;

function CodeToCoreStatus(AValue: string): TCoreStatus;
begin
  if SameText(TCoreStatusCodeSync_Code_0, AValue) then begin
    Result := coreUnknown;
  end else if SameText(TCoreStatusCodeSync_Code_1, AValue) then begin
    Result := coreActive;
  end else if SameText(TCoreStatusCodeSync_Code_2, AValue) then begin
    Result := coreInactive;
  end else if SameText(TCoreStatusCodeSync_Code_3, AValue) then begin
    Result := coreExpended;
  end else if SameText(TCoreStatusCodeSync_Code_4, AValue) then begin
    Result := coreRetired;
  end else if SameText(TCoreStatusCodeSync_Code_5, AValue) then begin
    Result := coreLost;
  end else
    raise Exception.CreateFmt(
      'CodeToCoreStatus(AValue: string): Unable to find valid CoreStatus for Code, [%s]',
      [VarToStr(AValue)]);
end;

function CoreStatusToCode(AValue: TCoreStatus): string;
begin
  case AValue of
    coreUnknown:
      Result := TCoreStatusCodeSync_Code_0;
    coreActive:
      Result := TCoreStatusCodeSync_Code_1;
    coreInactive:
      Result := TCoreStatusCodeSync_Code_2;
    coreExpended:
      Result := TCoreStatusCodeSync_Code_3;
    coreRetired:
      Result := TCoreStatusCodeSync_Code_4;
    coreLost:
      Result := TCoreStatusCodeSync_Code_5;
  end;
end;

end.

