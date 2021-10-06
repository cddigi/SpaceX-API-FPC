unit DragonTrunk;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, VolumeInfo, DragonCargo, BaseModel;

type
  IBaseDragonTrunk = interface(IBaseModel) ['{21E3DEBF-B906-435C-8764-1E40F1A26587}']
    function GetDragonCargo: IDragonCargo;
    function GetTrunkVolume: IVolumeInfo;

    procedure SetDragonCargo(AValue: IDragonCargo);
    procedure SetTrunkVolume(AValue: IVolumeInfo);
  end;

  IDragonTrunk = interface(IBaseDragonTrunk) ['{BC9F51A3-D5F7-48D5-BF31-6965250D5BFE}']
    property DragonCargo: IDragonCargo read GetDragonCargo write SetDragonCargo;
    property TrunkVolume: IVolumeInfo read GetTrunkVolume write SetTrunkVolume;
  end;

function NewDragonTrunk: IDragonTrunk;

implementation

uses
  JSON_Helper;

type

  { TDragonTrunk }

  TDragonTrunk = class(TBaseModel, IDragonTrunk)
  private
    FDragonCargo: IDragonCargo;
    FTrunkVolume: IVolumeInfo;

    function GetDragonCargo: IDragonCargo;
    function GetTrunkVolume: IVolumeInfo;

    procedure SetDragonCargo(AValue: IDragonCargo);
    procedure SetTrunkVolume(AValue: IVolumeInfo);
  public
    procedure BuildSubObjects(const JSONData: IJSONData); override;
    function ToString: string; override;
  end;

function NewDragonTrunk: IDragonTrunk;
begin
  Result := TDragonTrunk.Create;
end;

{ TDragonTrunk }

function TDragonTrunk.GetDragonCargo: IDragonCargo;
begin
  Result := FDragonCargo;
end;

function TDragonTrunk.GetTrunkVolume: IVolumeInfo;
begin
  Result := FTrunkVolume;
end;

procedure TDragonTrunk.SetDragonCargo(AValue: IDragonCargo);
begin
  FDragonCargo := AValue;
end;

procedure TDragonTrunk.SetTrunkVolume(AValue: IVolumeInfo);
begin
  FTrunkVolume := AValue;
end;

procedure TDragonTrunk.BuildSubObjects(const JSONData: IJSONData);
var
  SubJSONData: IJSONData;
  DragonCargo: IDragonCargo;
  TrunkVolume: IVolumeInfo;
begin
  inherited BuildSubObjects(JSONData);

  SubJSONData := JSONData.GetPath('cargo');
  DragonCargo := NewDragonCargo;
  JSONToModel(SubJSONData.GetJSONData, DragonCargo);
  Self.FDragonCargo := DragonCargo;

  SubJSONData := JSONData.GetPath('trunk_volume');
  TrunkVolume := NewVolumeInfo;
  JSONToModel(SubJSONData.GetJSONData, TrunkVolume);
  Self.FTrunkVolume := TrunkVolume;
end;

function TDragonTrunk.ToString: string;
begin
  Result := Format(''
    + 'Dragon Cargo: %s' + LineEnding
    + 'Trunk Volume: %s'
    , [
      GetDragonCargo.ToString,
      GetTrunkVolume.ToString
    ]);
end;

end.

