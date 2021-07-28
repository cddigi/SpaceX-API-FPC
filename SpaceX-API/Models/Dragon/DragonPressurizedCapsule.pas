unit DragonPressurizedCapsule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, VolumeInfo;

type
  TDragonPressurizedCapsule = class(TInterfacedObject)
    PayloadVolume: IVolumeInfo;
  end;

implementation

end.

