unit MassInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseMassInfo = interface(IInterface) ['{6D9E71BA-D34F-40FF-B77E-E78DBB1F3071}']
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

type
  { TMassInfo }

  TMassInfo = class(TInterfacedObject, IMassInfo)
  private
    FKilograms: Double;
    FPounds: Double;
    function GetKilograms: Double;
    function GetPounds: Double;

    procedure SetKilograms(AValue: Double);
    procedure SetPounds(AValue: Double);
  public
    function ToString(): string; override;
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

procedure TMassInfo.SetPounds(AValue: Double);
begin
  FPounds := AValue;
end;

function TMassInfo.ToString(): string;
begin
  Result := GetKilograms.ToString() + ' kg (' + GetPounds.ToString() + ' lb)';       // consider replacing with Format()
end;

end.

