unit DragonHeatshield;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TDragonHeatshield = class(TInterfacedObject)
    Material: string;
    SizeMeters: Double;
    TemperatureDegrees: LongWord;
    DevPartner: string;
  end;

implementation

end.

