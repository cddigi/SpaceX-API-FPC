unit SecondStage;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, RocketPotentialPayload;

type
  TSecondStage = class(TInterfacedObject)
  public
    Reusable: Boolean;
    Engines: LongWord;
    Payloads: TRocketPotentialPayload;
    FuelAmountTons: LongWord;
    BurnTimeSeconds: LongWord;
  end;

implementation

end.

