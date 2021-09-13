unit SizeInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type

  IBaseSizeInfo = interface(IBaseModel) ['{2D23FE84-A7EC-4511-A713-AA47CEBECC90}']
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

uses
  Variants;

type
  { TSizeInfo }

  TSizeInfo = class(TBaseModel, ISizeInfo)
  private
    FMeters: Double;
    FFeet: Double;
  private
    function GetMeters: Double;
    function GetFeet: Double;
  private
    procedure SetMeters(AValue: Double);
    procedure SetMeters(AValue: Variant);
    procedure SetFeet(AValue: Double);
    procedure SetFeet(AValue: Variant);
  published
    property meters: Variant write SetMeters;
    property feet: Variant write SetFeet;
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

procedure TSizeInfo.SetMeters(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := -1;
  FMeters := AValue;
end;

procedure TSizeInfo.SetFeet(AValue: Double);
begin
  FFeet := AValue;
end;

procedure TSizeInfo.SetFeet(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := -1;
  FFeet := AValue;
end;

function TSizeInfo.ToString(): string;
begin
  Result := GetMeters.ToString() + ' m (' + GetFeet.ToString() + ' ft)';
end;

end.

