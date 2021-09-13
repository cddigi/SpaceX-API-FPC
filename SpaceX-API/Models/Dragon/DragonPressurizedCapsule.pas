unit DragonPressurizedCapsule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, VolumeInfo;

type

  IBaseDragonPressurizedCapsule = interface(IInterface) ['{33A57FCF-0068-4320-A24F-7B83F60E20BE}']
    function GetPayloadVolume: IVolumeInfo;

    procedure SetPayloadVolume(AValue: IVolumeInfo);
  end;

  IDragonPressurizedCapsule = interface(IBaseDragonPressurizedCapsule) ['{51C6A440-9161-4A56-BCF3-6E99D5D52C02}']
    property PayloadVolume: IVolumeInfo read GetPayloadVolume write SetPayloadVolume;
  end;

function NewDragonPressurizedCapsule: IDragonPressurizedCapsule;

implementation

type

  { TDragonPressurizedCapsule }

  TDragonPressurizedCapsule = class(TInterfacedObject, IDragonPressurizedCapsule)
  private
    FPayloadVolume: IVolumeInfo;
    function GetPayloadVolume: IVolumeInfo;

    procedure SetPayloadVolume(AValue: IVolumeInfo);
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

end.

