unit RocketFirstStage;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ThrustInfo;

type
  TRocketFirstStage = class(TInterfacedObject)
  public
    Reusable: Boolean;
    Engines: LongWord;
    ThrustSeaLevel: TThrustInfo;
    ThrustVacuum: TThrustInfo;
    FuelAmountTons: LongWord;
    BurnTimeSeconds: LongWord;
  end;

implementation

end.

