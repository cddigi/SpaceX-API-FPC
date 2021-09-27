unit DragonPressurizedCapsule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, VolumeInfo, BaseModel;

type

  IBaseDragonPressurizedCapsule = interface(IBaseModel) ['{33A57FCF-0068-4320-A24F-7B83F60E20BE}']
    function GetPayloadVolume: IVolumeInfo;

    procedure SetPayloadVolume(AValue: IVolumeInfo);
  end;

  IDragonPressurizedCapsule = interface(IBaseDragonPressurizedCapsule) ['{51C6A440-9161-4A56-BCF3-6E99D5D52C02}']
    property PayloadVolume: IVolumeInfo read GetPayloadVolume write SetPayloadVolume;
  end;

function NewDragonPressurizedCapsule: IDragonPressurizedCapsule;

implementation

uses
  Variants, JSON_Helper;

type

  { TDragonPressurizedCapsule }

  TDragonPressurizedCapsule = class(TBaseModel, IDragonPressurizedCapsule)
  private
    FPayloadVolume: IVolumeInfo;
    function GetPayloadVolume: IVolumeInfo;

    procedure SetPayloadVolume(AValue: IVolumeInfo);
  public
    procedure BuildSubObjects(const JSONData: IJSONData); override;
  end;

function NewDragonPressurizedCapsule: IDragonPressurizedCapsule;
begin
  Result := TDragonPressurizedCapsule.Create;
end;

{ TDragonPressurizedCapsule }

function TDragonPressurizedCapsule.GetPayloadVolume: IVolumeInfo;
begin
  Result := FPayloadVolume;
end;

procedure TDragonPressurizedCapsule.SetPayloadVolume(AValue: IVolumeInfo);
begin
  FPayloadVolume := AValue;
end;

procedure TDragonPressurizedCapsule.BuildSubObjects(const JSONData: IJSONData);
var
  SubJSONData: IJSONData;
  VolumeInfo: IVolumeInfo;
begin
  inherited BuildSubObjects(JSONData);

  SubJSONData := JSONData.GetPath('payload_volume');
  VolumeInfo := NewVolumeInfo;
  JSONToModel(SubJSONData.GetJSONData, VolumeInfo);
  Self.FPayloadVolume := VolumeInfo;
end;

end.

