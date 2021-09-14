unit LandpadStatus;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TLandpadStatus = (landUnknown, landActive, landInactive, landRetired, landLost, landUnderConstruction);

var
  TLandpadStatusCodeSync_Code_0: string = 'unknown';
  TLandpadStatusCodeSync_Code_1: string = 'active';
  TLandpadStatusCodeSync_Code_2: string = 'inactive';
  TLandpadStatusCodeSync_Code_3: string = 'retired';
  TLandpadStatusCodeSync_Code_4: string = 'lost';
  TLandpadStatusCodeSync_Code_5: string = 'under_construction';

function CodeToLandpadStatus(AValue: string): TLandpadStatus;
function LandpadStatusToCode(AValue: TLandpadStatus): string;

implementation

uses
  Variants;

function CodeToLandpadStatus(AValue: string): TLandpadStatus;
begin
  if SameText(TLandpadStatusCodeSync_Code_0, AValue) then begin
    Result := landUnknown;
  end else if SameText(TLandpadStatusCodeSync_Code_1, AValue) then begin
    Result := landActive;
  end else if SameText(TLandpadStatusCodeSync_Code_2, AValue) then begin
    Result := landInactive;
  end else if SameText(TLandpadStatusCodeSync_Code_3, AValue) then begin
    Result := landRetired;
  end else if SameText(TLandpadStatusCodeSync_Code_4, AValue) then begin
    Result := landLost;
  end else if SameText(TLandpadStatusCodeSync_Code_5, AValue) then begin
    Result := landUnderConstruction;
  end else
    raise Exception.CreateFmt(
      'CodeToLandpadStatus(AValue: string): Unable to find valid LandpadStatus for Code, [%s]',
      [VarToStr(AValue)]);
end;

function LandpadStatusToCode(AValue: TLandpadStatus): string;
begin
  case AValue of
    landUnknown:
      Result := TLandpadStatusCodeSync_Code_0;
    landActive:
      Result := TLandpadStatusCodeSync_Code_1;
    landInactive:
      Result := TLandpadStatusCodeSync_Code_2;
    landRetired:
      Result := TLandpadStatusCodeSync_Code_3;
    landLost:
      Result := TLandpadStatusCodeSync_Code_4;
    landUnderConstruction:
      Result := TLandpadStatusCodeSync_Code_5;
  end;
end;

end.

