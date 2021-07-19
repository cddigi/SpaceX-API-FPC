unit Payload;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DragonPayload, fgl;

type

  { TPayload }

  TPayload = class(TInterfacedObject)
  public
    Id: string;
    Name: string;
    TypeInfo: string;
    Reused: Boolean;
    Orbit: string;
    Regime: string;
    Longitude: Double;
    Eccentricity: Double;
    Epoch: TDateTime;
    Raan: Double;
    Customers: TStringList;
    Nationalities: TStringList;
    Manufacturers: TStringList;
    Dragon: TDragonPayload;
    NoradIds: specialize TFPGList<LongWord>;
    MassKilograms: Double;
    MassPounds: Double;
    ReferenceSystem: string;
    SemiMajorAxisKilometers: Double;
    PeriapsisKilometers: Double;
    ApoapsisKilometers: Double;
    InclinationDegrees: Double;
    PeriodMinutes: Double;
    LifespanYears: LongWord;
    MeanMotion: Double;
    ArgOfPericenter: Double;
    MeanAnomaly: Double;
    LaunchId: string;
    { get => _launchId;
      set( _launchId = value;
           Launch = new Lazy<LaunchInfo>(() => Context.LaunchesEndpoint.Get(_launchId).Execute());)}
    //Launch: Lazy<LaunchInfo>;
    function ToString(): string; override;
  private
    _launchId: string;
  end;

implementation

{ TPayload }

function TPayload.ToString(): string;
begin
  Result := Name;
end;

end.

