unit SizeInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseSizeInfo = interface(IInterface) ['{2D23FE84-A7EC-4511-A713-AA47CEBECC90}']
    function GetMeters: Double;
    function GetFeet: Double;

    procedure SetMeters(AValue: Double);
    procedure SetFeet(AValue: Double);
  end;

  ISizeInfo = interface(IBaseSizeInfo) ['{C5F18A33-FBC7-4754-ACB4-75AA12946D5A}']
    property Meters: Double read GetMeters write SetMeters;
    property Feet: Double read GetFeet write SetFeet;
  end;

function NewSizeInfo: ISizeInfo;

implementation

type
  { TSizeInfo }

  TSizeInfo = class(TInterfacedObject, ISizeInfo)
  private
    FMeters: Double;
    FFeet: Double;
    function GetMeters: Double;
    function GetFeet: Double;

    procedure SetMeters(AValue: Double);
    procedure SetFeet(AValue: Double);
  public
    function ToString(): string; override;
  end;

function NewSizeInfo: ISizeInfo;
begin
  Result := TSizeInfo.Create;
end;

{ TSizeInfo }

function TSizeInfo.GetMeters: Double;
begin
  Result := FMeters;
end;

function TSizeInfo.GetFeet: Double;
begin
  Result := FFeet;
end;

procedure TSizeInfo.SetMeters(AValue: Double);
begin
  FMeters := AValue;
end;

procedure TSizeInfo.SetFeet(AValue: Double);
begin
  FFeet := AValue;
end;

function TSizeInfo.ToString(): string;
begin
  Result := GetMeters.ToString() + ' m (' + GetFeet.ToString() + ' ft)';
end;

end.

