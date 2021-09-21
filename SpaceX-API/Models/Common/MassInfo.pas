unit MassInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type

  IBaseMassInfo = interface(IBaseModel) ['{6D9E71BA-D34F-40FF-B77E-E78DBB1F3071}']
    function GetKilograms: Double;
    function GetPounds: Double;

    procedure SetKilograms(AValue: Double);
    procedure SetPounds(AValue: Double);
  end;

  IMassInfo = interface(IBaseMassInfo) ['{90DCA0D8-D3FE-4E8B-904E-6B1C6F1F2A75}']
    property Kilograms: Double read GetKilograms write SetKilograms;
    property Pounds: Double read GetPounds write SetPounds;
  end;

function NewMassInfo: IMassInfo;

implementation

uses
  Variants;

type
  { TMassInfo }

  TMassInfo = class(TBaseModel, IMassInfo)
  private
    FKilograms: Double;
    FPounds: Double;
  private
    function GetKilograms: Double;
    function GetPounds: Double;
  private
    procedure SetKilograms(AValue: Double);
    procedure SetKilograms(AValue: Variant);
    procedure SetPounds(AValue: Double);
    procedure SetPounds(AValue: Variant);
  public
    function ToString(): string; override;
  published
    property kg: Variant write SetKilograms;
    property lb: Variant write SetPounds;
  end;

function NewMassInfo: IMassInfo;
begin
  Result := TMassInfo.Create;
end;

{ TMassInfo }

function TMassInfo.GetKilograms: Double;
begin
  Result := FKilograms;
end;

function TMassInfo.GetPounds: Double;
begin
  Result := FPounds;
end;

procedure TMassInfo.SetKilograms(AValue: Double);
begin
  FKilograms := AValue;
end;

procedure TMassInfo.SetKilograms(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := 0;

  FKilograms := AValue;
end;

procedure TMassInfo.SetPounds(AValue: Double);
begin
  FPounds := AValue;
end;

procedure TMassInfo.SetPounds(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := 0;

  FPounds := AValue;
end;

function TMassInfo.ToString(): string;
begin
  Result := Format(''
    + '%fkg ('
    + '%flb)'
    , [
      GetKilograms,
      GetPounds
    ]);
end;

end.

