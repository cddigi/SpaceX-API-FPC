unit Roadster;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TRoadster }

  TRoadster = class(TInterfacedObject)
  public
    Id: string;
    Name: string;
    Eccentricity: Double;
    Inclination: Double;
    Longitude: Double;
    Wikipedia: string;
    Video: string;
    Details: string;
    DateTimeUtc: TDateTime;
    DateTimeUnix: UInt64;
    LaunchMassKilograms: Double;
    LaunchMassPounds: Double;
    NoradId: LongWord;
    EpochJd: Double;
    OrbitType: string;
    ApoapsisAu: Double;
    PeriapsisAu: Double;
    SemiMajorAxisAu: Double;
    PeriapsisArg: Double;
    PeriodDays: Double;
    SpeedKph: Double;
    SpeedMph: Double;
    EarthDistanceKilometers: Double;
    EarthDistanceMiles: Double;
    MarsDistanceKilometers: Double;
    MarsDistanceMiles: Double;
    FlickrImages: TStringList;
    function ToString(): string; override;
  end;

implementation

{ TRoadster }

function TRoadster.ToString(): string;
begin
  Result := Name;
end;

end.

