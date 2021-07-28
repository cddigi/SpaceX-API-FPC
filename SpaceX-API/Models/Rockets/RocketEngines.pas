unit RocketEngines;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IspInfo, ThrustInfo;

type
  TRocketEngines = class(TInterfacedObject)
  public
    Number: LongWord;
    TypeInfo: string;
    Version: string;
    Layout: string;
    Isp: IIspInfo;
    ThrustSeaLevel: TThrustInfo;
    ThrustVacuum: TThrustInfo;
    EngineLossMax: LongWord;
    FirstPropellant: string;
    SecondPropellant: string;
    ThrustToWeight: Double;
  end;

implementation

end.

