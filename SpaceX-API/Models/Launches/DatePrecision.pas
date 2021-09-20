unit DatePrecision;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TDatePrecision = (dpUnknown, dpHour, dpDay, dpMonth, dpQuarter, dpHalf, dpYear);

var
  TDatePrecisionCodeSync_Code_0: string = 'unknown';
  TDatePrecisionCodeSync_Code_1: string = 'hour';
  TDatePrecisionCodeSync_Code_2: string = 'day';
  TDatePrecisionCodeSync_Code_3: string = 'month';
  TDatePrecisionCodeSync_Code_4: string = 'quarter';
  TDatePrecisionCodeSync_Code_5: string = 'half';
  TDatePrecisionCodeSync_Code_6: string = 'year';

function CodeToDatePrecision(AValue: string): TDatePrecision;
function DatePrecisionToCode(AValue: TDatePrecision): string;

implementation

uses
  Variants;

function CodeToDatePrecision(AValue: string): TDatePrecision;
begin
  if SameText(TDatePrecisionCodeSync_Code_0, AValue) then begin
    Result := dpUnknown;
  end else if SameText(TDatePrecisionCodeSync_Code_1, AValue) then begin
    Result := dpHour;
  end else if SameText(TDatePrecisionCodeSync_Code_2, AValue) then begin
    Result := dpDay;
  end else if SameText(TDatePrecisionCodeSync_Code_3, AValue) then begin
    Result := dpMonth;
  end else if SameText(TDatePrecisionCodeSync_Code_4, AValue) then begin
    Result := dpQuarter;
  end else if SameText(TDatePrecisionCodeSync_Code_5, AValue) then begin
    Result := dpHalf;
  end else if SameText(TDatePrecisionCodeSync_Code_6, AValue) then begin
    Result := dpYear;
  end else
    raise Exception.CreateFmt(
      'CodeToDatePrecision(AValue: string): Unable to find valid DatePrecision for Code, [%s]',
      [VarToStr(AValue)]);
end;

function DatePrecisionToCode(AValue: TDatePrecision): string;
begin
  case AValue of
    dpUnknown:
      Result := TDatePrecisionCodeSync_Code_0;
    dpHour:
      Result := TDatePrecisionCodeSync_Code_1;
    dpDay:
      Result := TDatePrecisionCodeSync_Code_2;
    dpMonth:
      Result := TDatePrecisionCodeSync_Code_3;
    dpQuarter:
      Result := TDatePrecisionCodeSync_Code_4;
    dpHalf:
      Result := TDatePrecisionCodeSync_Code_5;
    dpYear:
      Result := TDatePrecisionCodeSync_Code_6;
  end;
end;

end.

