unit DragonTrunk;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, VolumeInfo, DragonCargo;

type

  IBaseDragonTrunk = interface(IInterface) ['{204131FF-BAC5-48D0-A645-43707F019C89}']
    function GetCargo: IDragonCargo;
    function GetTrunkVolume: IVolumeInfo;

    procedure SetCargo(AValue: IDragonCargo);
    procedure SetTrunkVolume(AValue: IVolumeInfo);
  end;

  IDragonTrunk = interface(IBaseDragonTrunk) ['{118ACCB2-4266-4735-A21F-5022E70FA44D}']
    property Cargo: IDragonCargo read GetCargo write SetCargo;
    property TrunkVolume: IVolumeInfo read GetTrunkVolume write SetTrunkVolume;
  end;

function NewDragonTrunk: IDragonTrunk;

implementation

type

  { TDragonTrunk }

  TDragonTrunk = class(TInterfacedObject, IDragonTrunk)
  private
    FCargo: IDragonCargo;
    FTrunkVolume: IVolumeInfo;
    function GetCargo: IDragonCargo;
    function GetTrunkVolume: IVolumeInfo;

    procedure SetCargo(AValue: IDragonCargo);
    procedure SetTrunkVolume(AValue: IVolumeInfo);
  end;

function NewDragonTrunk: IDragonTrunk;
begin
  Result := TDragonTrunk.Create;
end;

{ TDragonTrunk }

function TDragonTrunk.GetCargo: IDragonCargo;
begin
  Result := FCargo;
end;

function TDragonTrunk.GetTrunkVolume: IVolumeInfo;
begin
  Result := FTrunkVolume;
end;

procedure TDragonTrunk.SetCargo(AValue: IDragonCargo);
begin
  FCargo := AValue;
end;

procedure TDragonTrunk.SetTrunkVolume(AValue: IVolumeInfo);
begin
  FTrunkVolume := AValue;
end;

end.

