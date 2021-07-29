unit Roadster;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseRoadster = interface(IInterface) ['{02467D77-738F-4B1D-BBE2-3C44A86231D9}']
    function GetApoapsisAu: Double;
    function GetDetails: string;
    function GetDateTimeUnix: UInt64;
    function GetDateTimeUtc: TDateTime;
    function GetEarthDistanceKilometers: Double;
    function GetEarthDistanceMiles: Double;
    function GetEccentricity: Double;
    function GetEpochJd: Double;
    function GetFlickrImages: TStringList;
    function GetId: string;
    function GetInclination: Double;
    function GetLaunchMassKilograms: Double;
    function GetLaunchMassPounds: Double;
    function GetLongitude: Double;
    function GetMarsDistanceKilometers: Double;
    function GetMarsDistanceMiles: Double;
    function GetName: string;
    function GetNoradId: LongWord;
    function GetOrbitType: string;
    function GetPeriapsisArg: Double;
    function GetPeriapsisAu: Double;
    function GetPeriodDays: Double;
    function GetSemiMajorAxisAu: Double;
    function GetSpeedKph: Double;
    function GetSpeedMph: Double;
    function GetVideo: string;
    function GetWikipedia: string;

    procedure SetApoapsisAu(AValue: Double);
    procedure SetDetails(AValue: string);
    procedure SetDateTimeUnix(AValue: UInt64);
    procedure SetDateTimeUtc(AValue: TDateTime);
    procedure SetEarthDistanceKilometers(AValue: Double);
    procedure SetEarthDistanceMiles(AValue: Double);
    procedure SetEccentricity(AValue: Double);
    procedure SetEpochJd(AValue: Double);
    procedure SetFlickrImages(AValue: TStringList);
    procedure SetId(AValue: string);
    procedure SetInclination(AValue: Double);
    procedure SetLaunchMassKilograms(AValue: Double);
    procedure SetLaunchMassPounds(AValue: Double);
    procedure SetLongitude(AValue: Double);
    procedure SetMarsDistanceKilometers(AValue: Double);
    procedure SetMarsDistanceMiles(AValue: Double);
    procedure SetName(AValue: string);
    procedure SetNoradId(AValue: LongWord);
    procedure SetOrbitType(AValue: string);
    procedure SetPeriapsisArg(AValue: Double);
    procedure SetPeriapsisAu(AValue: Double);
    procedure SetPeriodDays(AValue: Double);
    procedure SetSemiMajorAxisAu(AValue: Double);
    procedure SetSpeedKph(AValue: Double);
    procedure SetSpeedMph(AValue: Double);
    procedure SetVideo(AValue: string);
    procedure SetWikipedia(AValue: string);
  end;

  IRoadster = interface(IBaseRoadster) ['{27BD5051-841A-4ADF-BF94-CDD8D59175A0}']
    property ApoapsisAu: Double read GetApoapsisAu write SetApoapsisAu;
    property Details: string read GetDetails write SetDetails;
    property DateTimeUnix: UInt64 read GetDateTimeUnix write SetDateTimeUnix;
    property DateTimeUtc: TDateTime read GetDateTimeUtc write SetDateTimeUtc;
    property EarthDistanceKilometers: Double read GetEarthDistanceKilometers write SetEarthDistanceKilometers;
    property EarthDistanceMiles: Double read GetEarthDistanceMiles write SetEarthDistanceMiles;
    property Eccentricity: Double read GetEccentricity write SetEccentricity;
    property EpochJd: Double read GetEpochJd write SetEpochJd;
    property FlickrImages: TStringList read GetFlickrImages write SetFlickrImages;
    property Id: string read GetId write SetId;
    property Inclination: Double read GetInclination write SetInclination;
    property LaunchMassKilograms: Double read GetLaunchMassKilograms write SetLaunchMassKilograms;
    property LaunchMassPounds: Double read GetLaunchMassPounds write SetLaunchMassPounds;
    property Longitude: Double read GetLongitude write SetLongitude;
    property MarsDistanceKilometers: Double read GetMarsDistanceKilometers write SetMarsDistanceKilometers;
    property MarsDistanceMiles: Double read GetMarsDistanceMiles write SetMarsDistanceMiles;
    property Name: string read GetName write SetName;
    property NoradId: LongWord read GetNoradId write SetNoradId;
    property OrbitType: string read GetOrbitType write SetOrbitType;
    property PeriapsisArg: Double read GetPeriapsisArg write SetPeriapsisArg;
    property PeriapsisAu: Double read GetPeriapsisAu write SetPeriapsisAu;
    property PeriodDays: Double read GetPeriodDays write SetPeriodDays;
    property SemiMajorAxisAu: Double read GetSemiMajorAxisAu write SetSemiMajorAxisAu;
    property SpeedKph: Double read GetSpeedKph write SetSpeedKph;
    property SpeedMph: Double read GetSpeedMph write SetSpeedMph;
    property Video: string read GetVideo write SetVideo;
    property Wikipedia: string read GetWikipedia write SetWikipedia;
  end;

function NewRoadster: IRoadster;

implementation

type

  { TRoadster }

  TRoadster = class(TInterfacedObject, IRoadster)
  private
    FApoapsisAu: Double;
    FDetails: string;
    FDateTimeUnix: UInt64;
    FDateTimeUtc: TDateTime;
    FEarthDistanceKilometers: Double;
    FEarthDistanceMiles: Double;
    FEccentricity: Double;
    FEpochJd: Double;
    FFlickrImages: TStringList;
    FId: string;
    FInclination: Double;
    FLaunchMassKilograms: Double;
    FLaunchMassPounds: Double;
    FLongitude: Double;
    FMarsDistanceKilometers: Double;
    FMarsDistanceMiles: Double;
    FName: string;
    FNoradId: LongWord;
    FOrbitType: string;
    FPeriapsisArg: Double;
    FPeriapsisAu: Double;
    FPeriodDays: Double;
    FSemiMajorAxisAu: Double;
    FSpeedKph: Double;
    FSpeedMph: Double;
    FVideo: string;
    FWikipedia: string;
    function GetApoapsisAu: Double;
    function GetDetails: string;
    function GetDateTimeUnix: UInt64;
    function GetDateTimeUtc: TDateTime;
    function GetEarthDistanceKilometers: Double;
    function GetEarthDistanceMiles: Double;
    function GetEccentricity: Double;
    function GetEpochJd: Double;
    function GetFlickrImages: TStringList;
    function GetId: string;
    function GetInclination: Double;
    function GetLaunchMassKilograms: Double;
    function GetLaunchMassPounds: Double;
    function GetLongitude: Double;
    function GetMarsDistanceKilometers: Double;
    function GetMarsDistanceMiles: Double;
    function GetName: string;
    function GetNoradId: LongWord;
    function GetOrbitType: string;
    function GetPeriapsisArg: Double;
    function GetPeriapsisAu: Double;
    function GetPeriodDays: Double;
    function GetSemiMajorAxisAu: Double;
    function GetSpeedKph: Double;
    function GetSpeedMph: Double;
    function GetVideo: string;
    function GetWikipedia: string;

    procedure SetApoapsisAu(AValue: Double);
    procedure SetDetails(AValue: string);
    procedure SetDateTimeUnix(AValue: UInt64);
    procedure SetDateTimeUtc(AValue: TDateTime);
    procedure SetEarthDistanceKilometers(AValue: Double);
    procedure SetEarthDistanceMiles(AValue: Double);
    procedure SetEccentricity(AValue: Double);
    procedure SetEpochJd(AValue: Double);
    procedure SetFlickrImages(AValue: TStringList);
    procedure SetId(AValue: string);
    procedure SetInclination(AValue: Double);
    procedure SetLaunchMassKilograms(AValue: Double);
    procedure SetLaunchMassPounds(AValue: Double);
    procedure SetLongitude(AValue: Double);
    procedure SetMarsDistanceKilometers(AValue: Double);
    procedure SetMarsDistanceMiles(AValue: Double);
    procedure SetName(AValue: string);
    procedure SetNoradId(AValue: LongWord);
    procedure SetOrbitType(AValue: string);
    procedure SetPeriapsisArg(AValue: Double);
    procedure SetPeriapsisAu(AValue: Double);
    procedure SetPeriodDays(AValue: Double);
    procedure SetSemiMajorAxisAu(AValue: Double);
    procedure SetSpeedKph(AValue: Double);
    procedure SetSpeedMph(AValue: Double);
    procedure SetVideo(AValue: string);
    procedure SetWikipedia(AValue: string);
  public
    function ToString(): string; override;
  end;

function NewRoadster: IRoadster;
begin
  Result := TRoadster.Create;
end;

{ TRoadster }

function TRoadster.GetApoapsisAu: Double;
begin
  Result := FApoapsisAu;
end;

function TRoadster.GetDetails: string;
begin
  Result := FDetails;
end;

function TRoadster.GetDateTimeUnix: UInt64;
begin
  Result := FDateTimeUnix;
end;

function TRoadster.GetDateTimeUtc: TDateTime;
begin
  Result := FDateTimeUtc;
end;

function TRoadster.GetEarthDistanceKilometers: Double;
begin
  Result := FEarthDistanceKilometers;
end;

function TRoadster.GetEarthDistanceMiles: Double;
begin
  Result := FEarthDistanceMiles;
end;

function TRoadster.GetEccentricity: Double;
begin
  Result := FEccentricity;
end;

function TRoadster.GetEpochJd: Double;
begin
  Result := FEpochJd;
end;

function TRoadster.GetFlickrImages: TStringList;
begin
  Result := FFlickrImages;
end;

function TRoadster.GetId: string;
begin
  Result := FId;
end;

function TRoadster.GetInclination: Double;
begin
  Result := FInclination;
end;

function TRoadster.GetLaunchMassKilograms: Double;
begin
  Result := FLaunchMassKilograms;
end;

function TRoadster.GetLaunchMassPounds: Double;
begin
  Result := FLaunchMassPounds;
end;

function TRoadster.GetLongitude: Double;
begin
  Result := FLongitude;
end;

function TRoadster.GetMarsDistanceKilometers: Double;
begin
  Result := FMarsDistanceKilometers;
end;

function TRoadster.GetMarsDistanceMiles: Double;
begin
  Result := FMarsDistanceMiles;
end;

function TRoadster.GetName: string;
begin
  Result := FName;
end;

function TRoadster.GetNoradId: LongWord;
begin
  Result := FNoradId;
end;

function TRoadster.GetOrbitType: string;
begin
  Result := FOrbitType;
end;

function TRoadster.GetPeriapsisArg: Double;
begin
  Result := FPeriapsisArg;
end;

function TRoadster.GetPeriapsisAu: Double;
begin
  Result := FPeriapsisAu;
end;

function TRoadster.GetPeriodDays: Double;
begin
  Result := FPeriodDays;
end;

function TRoadster.GetSemiMajorAxisAu: Double;
begin
  Result := FSemiMajorAxisAu;
end;

function TRoadster.GetSpeedKph: Double;
begin
  Result := FSpeedKph;
end;

function TRoadster.GetSpeedMph: Double;
begin
  Result := FSpeedMph;
end;

function TRoadster.GetVideo: string;
begin
  Result := FVideo;
end;

function TRoadster.GetWikipedia: string;
begin
  Result := FWikipedia;
end;

procedure TRoadster.SetApoapsisAu(AValue: Double);
begin
  FApoapsisAu := AValue;
end;

procedure TRoadster.SetDetails(AValue: string);
begin
  FDetails := AValue;
end;

procedure TRoadster.SetDateTimeUnix(AValue: UInt64);
begin
  FDateTimeUnix := AValue;
end;

procedure TRoadster.SetDateTimeUtc(AValue: TDateTime);
begin
  FDateTimeUtc := AValue;
end;

procedure TRoadster.SetEarthDistanceKilometers(AValue: Double);
begin
  FEarthDistanceKilometers := AValue;
end;

procedure TRoadster.SetEarthDistanceMiles(AValue: Double);
begin
  FEarthDistanceMiles := AValue;
end;

procedure TRoadster.SetEccentricity(AValue: Double);
begin
  FEccentricity := AValue;
end;

procedure TRoadster.SetEpochJd(AValue: Double);
begin
  FEpochJd := AValue;
end;

procedure TRoadster.SetFlickrImages(AValue: TStringList);
begin
  FFlickrImages := AValue;
end;

procedure TRoadster.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TRoadster.SetInclination(AValue: Double);
begin
  FInclination := AValue;
end;

procedure TRoadster.SetLaunchMassKilograms(AValue: Double);
begin
  FLaunchMassKilograms := AValue;
end;

procedure TRoadster.SetLaunchMassPounds(AValue: Double);
begin
  FLaunchMassPounds := AValue;
end;

procedure TRoadster.SetLongitude(AValue: Double);
begin
  FLongitude := AValue;
end;

procedure TRoadster.SetMarsDistanceKilometers(AValue: Double);
begin
  FMarsDistanceKilometers := AValue;
end;

procedure TRoadster.SetMarsDistanceMiles(AValue: Double);
begin
  FMarsDistanceMiles := AValue;
end;

procedure TRoadster.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TRoadster.SetNoradId(AValue: LongWord);
begin
  FNoradId := AValue;
end;

procedure TRoadster.SetOrbitType(AValue: string);
begin
  FOrbitType := AValue;
end;

procedure TRoadster.SetPeriapsisArg(AValue: Double);
begin
  FPeriapsisArg := AValue;
end;

procedure TRoadster.SetPeriapsisAu(AValue: Double);
begin
  FPeriapsisAu := AValue;
end;

procedure TRoadster.SetPeriodDays(AValue: Double);
begin
  FPeriodDays := AValue;
end;

procedure TRoadster.SetSemiMajorAxisAu(AValue: Double);
begin
  FSemiMajorAxisAu := AValue;
end;

procedure TRoadster.SetSpeedKph(AValue: Double);
begin
  FSpeedKph := AValue;
end;

procedure TRoadster.SetSpeedMph(AValue: Double);
begin
  FSpeedMph := AValue;
end;

procedure TRoadster.SetVideo(AValue: string);
begin
  FVideo := AValue;
end;

procedure TRoadster.SetWikipedia(AValue: string);
begin
  FWikipedia := AValue;
end;

function TRoadster.ToString(): string;
begin
  Result := GetName;
end;

end.

