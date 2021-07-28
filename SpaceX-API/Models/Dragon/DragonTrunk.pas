unit DragonTrunk;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, VolumeInfo, DragonCargo;

type
  TDragonTrunk = class(TInterfacedObject)
    Cargo: TDragonCargo;
    TrunkVolume: IVolumeInfo;
  end;

implementation

end.

