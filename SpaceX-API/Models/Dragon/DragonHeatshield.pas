unit DragonHeatshield;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseDragonHeatShield = interface(IInterface) ['{7C494FB6-2264-494F-942A-DA84F2243A72}']
    function GetDevPartner: string;
    function GetMaterial: string;
    function GetSizeMeters: Double;
    function GetTemperatureDegrees: LongWord;

    procedure SetDevPartner(AValue: string);
    procedure SetMaterial(AValue: string);
    procedure SetSizeMeters(AValue: Double);
    procedure SetTemperatureDegrees(AValue: LongWord);
  end;

  IDragonHeatShield = interface(IBaseDragonHeatShield) ['{C215AC24-CECB-4F6D-87E7-670B1F4187F5}']
    property DevPartner: string read GetDevPartner write SetDevPartner;
    property Material: string read GetMaterial write SetMaterial;
    property SizeMeters: Double read GetSizeMeters write SetSizeMeters;
    property TemperatureDegrees: LongWord read GetTemperatureDegrees write SetTemperatureDegrees;
  end;

function NewDragonHeatShield: IDragonHeatShield;

implementation

type

  { TDragonHeatshield }

  TDragonHeatshield = class(TInterfacedObject, IDragonHeatShield)
    FDevPartner: string;
    FMaterial: string;
    FSizeMeters: Double;
    FTemperatureDegrees: LongWord;
    function GetDevPartner: string;
    function GetMaterial: string;
    function GetSizeMeters: Double;
    function GetTemperatureDegrees: LongWord;

    procedure SetDevPartner(AValue: string);
    procedure SetMaterial(AValue: string);
    procedure SetSizeMeters(AValue: Double);
    procedure SetTemperatureDegrees(AValue: LongWord);
  end;

function NewDragonHeatShield: IDragonHeatShield;
begin
  Result := TDragonHeatshield.Create;
end;

{ TDragonHeatshield }

function TDragonHeatshield.GetDevPartner: string;
begin
  Result := FDevPartner;
end;

function TDragonHeatshield.GetMaterial: string;
begin
  Result := FMaterial;
end;

function TDragonHeatshield.GetSizeMeters: Double;
begin
  Result := FSizeMeters;
end;

function TDragonHeatshield.GetTemperatureDegrees: LongWord;
begin
  Result := FTemperatureDegrees;
end;

procedure TDragonHeatshield.SetDevPartner(AValue: string);
begin
  FDevPartner := AValue;
end;

procedure TDragonHeatshield.SetMaterial(AValue: string);
begin
  FMaterial := AValue;
end;

procedure TDragonHeatshield.SetSizeMeters(AValue: Double);
begin
  FSizeMeters := AValue;
end;

procedure TDragonHeatshield.SetTemperatureDegrees(AValue: LongWord);
begin
  FTemperatureDegrees := AValue;
end;

end.

