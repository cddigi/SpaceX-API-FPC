unit Payload;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DragonPayload, fgl;

type

  IBasePayload = interface(IInterface) ['{1CAE0B0B-CB95-4B25-A709-6007D46D0E1D}']
    function GetApoapsisKilometers: Double;
    function GetArgOfPericenter: Double;
    function GetCustomers: TStringList;
    function GetDragonPayload: IDragonPayload;
    function GetEccentricity: Double;
    function GetEpoch: TDateTime;
    function GetId: string;
    function GetInclinationDegrees: Double;
    function GetLaunchId: string;
    function GetLifespanYears: LongWord;
    function GetLongitude: Double;
    function GetManufacturers: TStringList;
    function GetMassKilograms: Double;
    function GetMassPounds: Double;
    function GetMeanAnomaly: Double;
    function GetMeanMotion: Double;
    function GetName: string;
    function GetNationalities: TStringList;
    function GetNoradIds: specialize TFPGList<LongWord>;
    function GetOrbit: string;
    function GetPeriapsisKilometers: Double;
    function GetPeriodMinutes: Double;
    function GetRaan: Double;
    function GetReferenceSystem: string;
    function GetRegime: string;
    function GetReused: Boolean;
    function GetSemiMajorAxisKilometers: Double;
    function GetTypeInfo: string;

    procedure SetApoapsisKilometers(AValue: Double);
    procedure SetArgOfPericenter(AValue: Double);
    procedure SetCustomers(AValue: TStringList);
    procedure SetDragonPayload(AValue: IDragonPayload);
    procedure SetEccentricity(AValue: Double);
    procedure SetEpoch(AValue: TDateTime);
    procedure SetId(AValue: string);
    procedure SetInclinationDegrees(AValue: Double);
    procedure SetLaunchId(AValue: string);
    procedure SetLifespanYears(AValue: LongWord);
    procedure SetLongitude(AValue: Double);
    procedure SetManufacturers(AValue: TStringList);
    procedure SetMassKilograms(AValue: Double);
    procedure SetMassPounds(AValue: Double);
    procedure SetMeanAnomaly(AValue: Double);
    procedure SetMeanMotion(AValue: Double);
    procedure SetName(AValue: string);
    procedure SetNationalities(AValue: TStringList);
    procedure SetNoradIds(AValue: specialize TFPGList<LongWord>);
    procedure SetOrbit(AValue: string);
    procedure SetPeriapsisKilometers(AValue: Double);
    procedure SetPeriodMinutes(AValue: Double);
    procedure SetRaan(AValue: Double);
    procedure SetReferenceSystem(AValue: string);
    procedure SetRegime(AValue: string);
    procedure SetReused(AValue: Boolean);
    procedure SetSemiMajorAxisKilometers(AValue: Double);
    procedure SetTypeInfo(AValue: string);
  end;

  IPayload = interface(IBasePayload) ['{31E7A8FD-D000-498C-9A48-275CEFA6944B}']
    property ApoapsisKilometers: Double read GetApoapsisKilometers write SetApoapsisKilometers;
    property ArgOfPericenter: Double read GetArgOfPericenter write SetArgOfPericenter;
    property Customers: TStringList read GetCustomers write SetCustomers;
    property DragonPayload: IDragonPayload read GetDragonPayload write SetDragonPayload;
    property Eccentricity: Double read GetEccentricity write SetEccentricity;
    property Epoch: TDateTime read GetEpoch write SetEpoch;
    property Id: string read GetId write SetId;
    property InclinationDegrees: Double read GetInclinationDegrees write SetInclinationDegrees;
    property LaunchId: string read GetLaunchId write SetLaunchId;
    property LifespanYears: LongWord read GetLifespanYears write SetLifespanYears;
    property Longitude: Double read GetLongitude write SetLongitude;
    property Manufacturers: TStringList read GetManufacturers write SetManufacturers;
    property MassKilograms: Double read GetMassKilograms write SetMassKilograms;
    property MassPounds: Double read GetMassPounds write SetMassPounds;
    property MeanAnomaly: Double read GetMeanAnomaly write SetMeanAnomaly;
    property MeanMotion: Double read GetMeanMotion write SetMeanMotion;
    property Name: string read GetName write SetName;
    property Nationalities: TStringList read GetNationalities write SetNationalities;
    property NoradIds: specialize TFPGList<LongWord> read GetNoradIds write SetNoradIds;
    property Orbit: string read GetOrbit write SetOrbit;
    property PeriapsisKilometers: Double read GetPeriapsisKilometers write SetPeriapsisKilometers;
    property PeriodMinutes: Double read GetPeriodMinutes write SetPeriodMinutes;
    property Raan: Double read GetRaan write SetRaan;
    property ReferenceSystem: string read GetReferenceSystem write SetReferenceSystem;
    property Regime: string read GetRegime write SetRegime;
    property Reused: Boolean read GetReused write SetReused;
    property SemiMajorAxisKilometers: Double read GetSemiMajorAxisKilometers write SetSemiMajorAxisKilometers;
    property TypeInfo: string read GetTypeInfo write SetTypeInfo;
  end;

function NewPayload: IPayload;

implementation

type

  { TPayload }

  TPayload = class(TInterfacedObject, IPayload)
  private
    FApoapsisKilometers: Double;
    FArgOfPericenter: Double;
    FCustomers: TStringList;
    FDragonPayload: IDragonPayload;
    FEccentricity: Double;
    FEpoch: TDateTime;
    FId: string;
    FInclinationDegrees: Double;
    FLaunchId: string;
    FLifespanYears: LongWord;
    FLongitude: Double;
    FManufacturers: TStringList;
    FMassKilograms: Double;
    FMassPounds: Double;
    FMeanAnomaly: Double;
    FMeanMotion: Double;
    FName: string;
    FNationalities: TStringList;
    FNoradIds: specialize TFPGList<LongWord>;
    FOrbit: string;
    FPeriapsisKilometers: Double;
    FPeriodMinutes: Double;
    FRaan: Double;
    FReferenceSystem: string;
    FRegime: string;
    FReused: Boolean;
    FSemiMajorAxisKilometers: Double;
    FTypeInfo: string;
    //Launch: Lazy<LaunchInfo>;
    function GetApoapsisKilometers: Double;
    function GetArgOfPericenter: Double;
    function GetCustomers: TStringList;
    function GetDragonPayload: IDragonPayload;
    function GetEccentricity: Double;
    function GetEpoch: TDateTime;
    function GetId: string;
    function GetInclinationDegrees: Double;
    function GetLaunchId: string;
    function GetLifespanYears: LongWord;
    function GetLongitude: Double;
    function GetManufacturers: TStringList;
    function GetMassKilograms: Double;
    function GetMassPounds: Double;
    function GetMeanAnomaly: Double;
    function GetMeanMotion: Double;
    function GetName: string;
    function GetNationalities: TStringList;
    function GetNoradIds: specialize TFPGList<LongWord>;
    function GetOrbit: string;
    function GetPeriapsisKilometers: Double;
    function GetPeriodMinutes: Double;
    function GetRaan: Double;
    function GetReferenceSystem: string;
    function GetRegime: string;
    function GetReused: Boolean;
    function GetSemiMajorAxisKilometers: Double;
    function GetTypeInfo: string;

    procedure SetApoapsisKilometers(AValue: Double);
    procedure SetArgOfPericenter(AValue: Double);
    procedure SetCustomers(AValue: TStringList);
    procedure SetDragonPayload(AValue: IDragonPayload);
    procedure SetEccentricity(AValue: Double);
    procedure SetEpoch(AValue: TDateTime);
    procedure SetId(AValue: string);
    procedure SetInclinationDegrees(AValue: Double);
    procedure SetLaunchId(AValue: string);
    procedure SetLifespanYears(AValue: LongWord);
    procedure SetLongitude(AValue: Double);
    procedure SetManufacturers(AValue: TStringList);
    procedure SetMassKilograms(AValue: Double);
    procedure SetMassPounds(AValue: Double);
    procedure SetMeanAnomaly(AValue: Double);
    procedure SetMeanMotion(AValue: Double);
    procedure SetName(AValue: string);
    procedure SetNationalities(AValue: TStringList);
    procedure SetNoradIds(AValue: specialize TFPGList<LongWord>);
    procedure SetOrbit(AValue: string);
    procedure SetPeriapsisKilometers(AValue: Double);
    procedure SetPeriodMinutes(AValue: Double);
    procedure SetRaan(AValue: Double);
    procedure SetReferenceSystem(AValue: string);
    procedure SetRegime(AValue: string);
    procedure SetReused(AValue: Boolean);
    procedure SetSemiMajorAxisKilometers(AValue: Double);
    procedure SetTypeInfo(AValue: string);
  public
    function ToString(): string; override;
  end;

function NewPayload: IPayload;
begin
  Result := TPayload.Create;
end;

{ TPayload }

function TPayload.GetApoapsisKilometers: Double;
begin
  Result := FApoapsisKilometers;
end;

function TPayload.GetArgOfPericenter: Double;
begin
  Result := FArgOfPericenter;
end;

function TPayload.GetCustomers: TStringList;
begin
  Result := FCustomers;
end;

function TPayload.GetDragonPayload: IDragonPayload;
begin
  Result := FDragonPayload;
end;

function TPayload.GetEccentricity: Double;
begin
  Result := FEccentricity;
end;

function TPayload.GetEpoch: TDateTime;
begin
  Result := FEpoch;
end;

function TPayload.GetId: string;
begin
  Result := FId;
end;

function TPayload.GetInclinationDegrees: Double;
begin
  Result := FInclinationDegrees;
end;

function TPayload.GetLaunchId: string;
begin
  Result := FLaunchId;
end;

function TPayload.GetLifespanYears: LongWord;
begin
  Result := FLifespanYears;
end;

function TPayload.GetLongitude: Double;
begin
  Result := FLongitude;
end;

function TPayload.GetManufacturers: TStringList;
begin
  Result := FManufacturers;
end;

function TPayload.GetMassKilograms: Double;
begin
  Result := FMassKilograms;
end;

function TPayload.GetMassPounds: Double;
begin
  Result := FMassPounds;
end;

function TPayload.GetMeanAnomaly: Double;
begin
  Result := FMeanAnomaly;
end;

function TPayload.GetMeanMotion: Double;
begin
  Result := FMeanMotion;
end;

function TPayload.GetName: string;
begin
  Result := FName;
end;

function TPayload.GetNationalities: TStringList;
begin
  Result := FNationalities;
end;

function TPayload.GetNoradIds: specialize TFPGList<LongWord>;
begin
  Result := FNoradIds;
end;

function TPayload.GetOrbit: string;
begin
  Result := FOrbit;
end;

function TPayload.GetPeriapsisKilometers: Double;
begin
  Result := FPeriapsisKilometers;
end;

function TPayload.GetPeriodMinutes: Double;
begin
  Result := FPeriodMinutes;
end;

function TPayload.GetRaan: Double;
begin
  Result := FRaan;
end;

function TPayload.GetReferenceSystem: string;
begin
  Result := FReferenceSystem;
end;

function TPayload.GetRegime: string;
begin
  Result := FRegime;
end;

function TPayload.GetReused: Boolean;
begin
  Result := FReused;
end;

function TPayload.GetSemiMajorAxisKilometers: Double;
begin
  Result := FSemiMajorAxisKilometers;
end;

function TPayload.GetTypeInfo: string;
begin
  Result := FTypeInfo;
end;

procedure TPayload.SetApoapsisKilometers(AValue: Double);
begin
  FApoapsisKilometers := AValue;
end;

procedure TPayload.SetArgOfPericenter(AValue: Double);
begin
  FArgOfPericenter := AValue;
end;

procedure TPayload.SetCustomers(AValue: TStringList);
begin
  FCustomers := AValue;
end;

procedure TPayload.SetDragonPayload(AValue: IDragonPayload);
begin
  FDragonPayload := AValue;
end;

procedure TPayload.SetEccentricity(AValue: Double);
begin
  FEccentricity := AValue;
end;

procedure TPayload.SetEpoch(AValue: TDateTime);
begin
  FEpoch := AValue;
end;

procedure TPayload.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TPayload.SetInclinationDegrees(AValue: Double);
begin
  FInclinationDegrees := AValue;
end;

procedure TPayload.SetLaunchId(AValue: string);
begin
  FLaunchId := AValue;
end;

procedure TPayload.SetLifespanYears(AValue: LongWord);
begin
  FLifespanYears := AValue;
end;

procedure TPayload.SetLongitude(AValue: Double);
begin
  FLongitude := AValue;
end;

procedure TPayload.SetManufacturers(AValue: TStringList);
begin
  FManufacturers := AValue;
end;

procedure TPayload.SetMassKilograms(AValue: Double);
begin
  FMassKilograms := AValue;
end;

procedure TPayload.SetMassPounds(AValue: Double);
begin
  FMassPounds := AValue;
end;

procedure TPayload.SetMeanAnomaly(AValue: Double);
begin
  FMeanAnomaly := AValue;
end;

procedure TPayload.SetMeanMotion(AValue: Double);
begin
  FMeanMotion := AValue;
end;

procedure TPayload.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TPayload.SetNationalities(AValue: TStringList);
begin
  FNationalities := AValue;
end;

procedure TPayload.SetNoradIds(AValue: specialize TFPGList<LongWord>);
begin
  FNoradIds := AValue;
end;

procedure TPayload.SetOrbit(AValue: string);
begin
  FOrbit := AValue;
end;

procedure TPayload.SetPeriapsisKilometers(AValue: Double);
begin
  FPeriapsisKilometers := AValue;
end;

procedure TPayload.SetPeriodMinutes(AValue: Double);
begin
  FPeriodMinutes := AValue;
end;

procedure TPayload.SetRaan(AValue: Double);
begin
  FRaan := AValue;
end;

procedure TPayload.SetReferenceSystem(AValue: string);
begin
  FReferenceSystem := AValue;
end;

procedure TPayload.SetRegime(AValue: string);
begin
  FRegime := AValue;
end;

procedure TPayload.SetReused(AValue: Boolean);
begin
  FReused := AValue;
end;

procedure TPayload.SetSemiMajorAxisKilometers(AValue: Double);
begin
  FSemiMajorAxisKilometers := AValue;
end;

procedure TPayload.SetTypeInfo(AValue: string);
begin
  FTypeInfo := AValue;
end;

function TPayload.ToString(): string;
begin
  Result := GetName;
end;

end.

