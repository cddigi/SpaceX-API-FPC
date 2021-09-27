unit DragonCargo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type

  IBaseDragonCargo = interface(IBaseModel) ['{A54500B4-BAF2-4EA2-97C8-BFD6159C039A}']
    function GetSolarArray: LongWord;
    function GetUnpressurizedCargo: Boolean;

    procedure SetSolarArray(AValue: LongWord);
    procedure SetUnpressurizedCargo(AValue: Boolean);
  end;

  IDragonCargo = interface(IBaseDragonCargo) ['{B38E46D2-5D12-41C0-9B39-74E9E33CC639}']
    property SolarArray: LongWord read GetSolarArray write SetSolarArray;
    property UnpressurizedCargo: Boolean read GetUnpressurizedCargo write SetUnpressurizedCargo;
  end;

function NewDragonCargo: IDragonCargo;

implementation

uses
  Variants;

type

  { TDragonCargo }

  TDragonCargo = class(TBaseModel, IDragonCargo)
  private
    FSolarArray: LongWord;
    FUnpressurizedCargo: Boolean;
    function GetSolarArray: LongWord;
    function GetUnpressurizedCargo: Boolean;

    procedure SetSolarArray(AValue: LongWord);
    procedure SetSolarArray(AValue: Variant);
    procedure SetUnpressurizedCargo(AValue: Boolean);
    procedure SetUnpressurizedCargo(AValue: Variant);
  published
    property solar_array: Variant write SetSolarArray;
    property unpressurized_cargo: Variant write SetUnpressurizedCargo;
  end;

function NewDragonCargo: IDragonCargo;
begin
  Result := TDragonCargo.Create;
end;

{ TDragonCargo }

function TDragonCargo.GetSolarArray: LongWord;
begin
  Result := FSolarArray;
end;

function TDragonCargo.GetUnpressurizedCargo: Boolean;
begin
  Result := FUnpressurizedCargo;
end;

procedure TDragonCargo.SetSolarArray(AValue: LongWord);
begin
  FSolarArray := AValue;
end;

procedure TDragonCargo.SetSolarArray(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FSolarArray := -0;
  end else if VarIsNumeric(AValue) then
    FSolarArray := AValue;
end;

procedure TDragonCargo.SetUnpressurizedCargo(AValue: Boolean);
begin
  FUnpressurizedCargo := AValue;
end;

procedure TDragonCargo.SetUnpressurizedCargo(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FUnpressurizedCargo := False;
  end else if VarIsBool(AValue) then
    FUnpressurizedCargo := AValue;
end;

end.

