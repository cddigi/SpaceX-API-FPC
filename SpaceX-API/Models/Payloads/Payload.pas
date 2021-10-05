unit Payload;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DragonPayload, BaseModel, JSON_Helper;

type

  { INoradId }

  INoradId = interface(IBaseModel) ['{863E9E43-BA7B-4995-80C5-0D19BF3BB05A}']
  end;

  INoradIdList = interface(IBaseModelList) ['{116302B1-9AFA-4BA1-A539-ABF2C939134F}']
  end;

  IBasePayload = interface(IBaseModel) ['{1CAE0B0B-CB95-4B25-A709-6007D46D0E1D}']
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
    function GetNoradIds: INoradIdList;
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
    procedure SetNoradIds(AValue: INoradIdList);
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
    property NoradIds: INoradIdList read GetNoradIds write SetNoradIds;
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

  IPayloadList = interface(IBaseModelList) ['{442904B6-3A20-4C7E-A923-A44F31768CF5}']
  end;

function NewPayload: IPayload;
function NewPayloadList: IPayloadList;
function NewNoradId: INoradId;
function NewNoradIdList: INoradIdList;

implementation

uses
  Variants;

type

  { TPayload }

  TPayload = class(TBaseModel, IPayload)
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
    FNoradIds: INoradIdList;
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
    function GetNoradIds: INoradIdList;
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
    procedure SetApoapsisKilometers(AValue: Variant);
    procedure SetArgOfPericenter(AValue: Double);
    procedure SetArgOfPericenter(AValue: Variant);
    procedure SetCustomers(AValue: TStringList);
    procedure SetCustomers(AValue: Variant);
    procedure SetDragonPayload(AValue: IDragonPayload);
    procedure SetEccentricity(AValue: Double);
    procedure SetEccentricity(AValue: Variant);
    procedure SetEpoch(AValue: TDateTime);
    procedure SetEpoch(AValue: Variant);
    procedure SetId(AValue: string);
    procedure SetId(AValue: Variant);
    procedure SetInclinationDegrees(AValue: Double);
    procedure SetInclinationDegrees(AValue: Variant);
    procedure SetLaunchId(AValue: string);
    procedure SetLaunchId(AValue: Variant);
    procedure SetLifespanYears(AValue: LongWord);
    procedure SetLifespanYears(AValue: Variant);
    procedure SetLongitude(AValue: Double);
    procedure SetLongitude(AValue: Variant);
    procedure SetManufacturers(AValue: TStringList);
    procedure SetManufacturers(AValue: Variant);
    procedure SetMassKilograms(AValue: Double);
    procedure SetMassKilograms(AValue: Variant);
    procedure SetMassPounds(AValue: Double);
    procedure SetMassPounds(AValue: Variant);
    procedure SetMeanAnomaly(AValue: Double);
    procedure SetMeanAnomaly(AValue: Variant);
    procedure SetMeanMotion(AValue: Double);
    procedure SetMeanMotion(AValue: Variant);
    procedure SetName(AValue: string);
    procedure SetName(AValue: Variant);
    procedure SetNationalities(AValue: TStringList);
    procedure SetNationalities(AValue: Variant);
    procedure SetNoradIds(AValue: INoradIdList);
    procedure SetOrbit(AValue: string);
    procedure SetOrbit(AValue: Variant);
    procedure SetPeriapsisKilometers(AValue: Double);
    procedure SetPeriapsisKilometers(AValue: Variant);
    procedure SetPeriodMinutes(AValue: Double);
    procedure SetPeriodMinutes(AValue: Variant);
    procedure SetRaan(AValue: Double);
    procedure SetRaan(AValue: Variant);
    procedure SetReferenceSystem(AValue: string);
    procedure SetReferenceSystem(AValue: Variant);
    procedure SetRegime(AValue: string);
    procedure SetRegime(AValue: Variant);
    procedure SetReused(AValue: Boolean);
    procedure SetReused(AValue: Variant);
    procedure SetSemiMajorAxisKilometers(AValue: Double);
    procedure SetSemiMajorAxisKilometers(AValue: Variant);
    procedure SetTypeInfo(AValue: string);
    procedure SetTypeInfo(AValue: Variant);
  public
    procedure BuildSubObjects(const JSONData: IJSONData); override;
    constructor Create;
    destructor destroy; override;
    function ToString(): string; override;
  published  // a lot is nullable
    property apoapsis_km: Variant write SetApoapsisKilometers;
    property arg_of_pericenter: Variant write SetArgOfPericenter;
    property customers: Variant write SetCustomers;
    property eccentricity: Variant write SetEccentricity;
    property epoch: Variant write SetEpoch;
    property id: Variant write SetId;
    property inclination_deg: Variant write SetInclinationDegrees;
    property launch: Variant write SetLaunchId;
    property lifespan_years: Variant write SetLifespanYears;
    property longitude: Variant write SetLongitude;
    property manufacturers: Variant write SetManufacturers;
    property mass_kg: Variant write SetMassKilograms;
    property mass_lbs: Variant write SetMassPounds;
    property mean_anomaly: Variant write SetMeanAnomaly;
    property mean_motion: Variant write SetMeanMotion;
    property name: Variant write SetName;
    property nationalities: Variant write SetNationalities;
    //property NoradIds: INoradIdList read GetNoradIds write SetNoradIds;
    property orbit: Variant write SetOrbit;
    property periapsis_km: Variant write SetPeriapsisKilometers;
    property period_min: Variant write SetPeriodMinutes;
    property raan: Variant write SetRaan;
    property reference_system: Variant write SetReferenceSystem;
    property regime: Variant write SetRegime;
    property reused: Variant write SetReused;
    property semi_major_axis_km: Variant write SetSemiMajorAxisKilometers;
  end;

  { TPayloadList }

  TPayloadList = class(TBaseModelList, IPayloadList)
    function NewItem: IBaseModel; override;
  end;

  TNoradId = class(TBaseModel, INoradId)

  end;

  { TNoradIdList }

  TNoradIdList = class(TBaseModelList, INoradIdList)
    function NewItem: IBaseModel; override;
  end;

function NewPayload: IPayload;
begin
  Result := TPayload.Create;
end;

function NewPayloadList: IPayloadList;
begin
  Result := TPayloadList.Create;
end;

function NewNoradId: INoradId;
begin
  Result := TNoradId.Create;
end;

function NewNoradIdList: INoradIdList;
begin
  Result := TNoradIdList.Create;
end;

{ TNoradIdList }

function TNoradIdList.NewItem: IBaseModel;
begin
  Result := NewNoradId;
end;

{ TPayloadList }

function TPayloadList.NewItem: IBaseModel;
begin
  Result := NewPayload;
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

function TPayload.GetNoradIds: INoradIdList;
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

procedure TPayload.SetApoapsisKilometers(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FApoapsisKilometers := -0.0;
  end else if VarIsNumeric(AValue) then
    FApoapsisKilometers := AValue;
end;

procedure TPayload.SetArgOfPericenter(AValue: Double);
begin
  FArgOfPericenter := AValue;
end;

procedure TPayload.SetArgOfPericenter(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FArgOfPericenter := -0.0;
  end else if VarIsNumeric(AValue) then
    FArgOfPericenter := AValue;
end;

procedure TPayload.SetCustomers(AValue: TStringList);
begin
  FCustomers := AValue;
end;

procedure TPayload.SetCustomers(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FCustomers := TStringList.Create;
  end else if VarIsStr(AValue) then
    FCustomers.AddDelimitedtext(AValue);
end;

procedure TPayload.SetDragonPayload(AValue: IDragonPayload);
begin
  FDragonPayload := AValue;
end;

procedure TPayload.SetEccentricity(AValue: Double);
begin
  FEccentricity := AValue;
end;

procedure TPayload.SetEccentricity(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FEccentricity := -0.0;
  end else if VarIsNumeric(AValue) then
    FEccentricity := AValue;
end;

procedure TPayload.SetEpoch(AValue: TDateTime);
begin
  FEpoch := AValue;
end;

procedure TPayload.SetEpoch(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FEpoch := MinDateTime;
  end else if VarIsStr(AValue) then
    FEpoch := AValue;
end;

procedure TPayload.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TPayload.SetId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FId := '';
  end else if VarIsStr(AValue) then
    FId := AValue;
end;

procedure TPayload.SetInclinationDegrees(AValue: Double);
begin
  FInclinationDegrees := AValue;
end;

procedure TPayload.SetInclinationDegrees(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FInclinationDegrees := -0.0;
  end else if VarIsNumeric(AValue) then
    FInclinationDegrees := AValue;
end;

procedure TPayload.SetLaunchId(AValue: string);
begin
  FLaunchId := AValue;
end;

procedure TPayload.SetLaunchId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLaunchId := '';
  end else if VarIsStr(AValue) then
    FLaunchId := AValue;
end;

procedure TPayload.SetLifespanYears(AValue: LongWord);
begin
  FLifespanYears := AValue;
end;

procedure TPayload.SetLifespanYears(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLifespanYears := -0;
  end;
end;

procedure TPayload.SetLongitude(AValue: Double);
begin
  FLongitude := AValue;
end;

procedure TPayload.SetLongitude(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLongitude := -0.0;
  end else if VarIsNumeric(AValue) then
    FLongitude := AValue;
end;

procedure TPayload.SetManufacturers(AValue: TStringList);
begin
  FManufacturers := AValue;
end;

procedure TPayload.SetManufacturers(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FManufacturers := TStringList.Create;
  end else if VarIsStr(AValue) then
    FManufacturers.AddDelimitedtext(AValue);
end;

procedure TPayload.SetMassKilograms(AValue: Double);
begin
  FMassKilograms := AValue;
end;

procedure TPayload.SetMassKilograms(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FMassKilograms := -0.0;
  end else if VarIsNumeric(AValue) then
    FMassKilograms := AValue;
end;

procedure TPayload.SetMassPounds(AValue: Double);
begin
  FMassPounds := AValue;
end;

procedure TPayload.SetMassPounds(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FMassPounds := -0.0;
  end else if VarIsNumeric(AValue) then
    FMassPounds := AValue;
end;

procedure TPayload.SetMeanAnomaly(AValue: Double);
begin
  FMeanAnomaly := AValue;
end;

procedure TPayload.SetMeanAnomaly(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FMeanAnomaly := -0.0;
  end else if VarIsNumeric(AValue) then
    FMeanAnomaly := AValue;
end;

procedure TPayload.SetMeanMotion(AValue: Double);
begin
  FMeanMotion := AValue;
end;

procedure TPayload.SetMeanMotion(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FMeanMotion := -0.0;
  end else if VarIsNumeric(AValue) then
    FMeanMotion := AValue;
end;

procedure TPayload.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TPayload.SetName(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FName := '';
  end else if VarIsStr(AValue) then
    FName := AValue;
end;

procedure TPayload.SetNationalities(AValue: TStringList);
begin
  FNationalities := AValue;
end;

procedure TPayload.SetNationalities(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FNationalities := TStringList.Create;
  end else if VarIsStr(AValue) then
    FNationalities.AddDelimitedtext(AValue);
end;

procedure TPayload.SetNoradIds(AValue: INoradIdList);
begin
  FNoradIds := AValue;
end;

procedure TPayload.SetOrbit(AValue: string);
begin
  FOrbit := AValue;
end;

procedure TPayload.SetOrbit(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FOrbit := '';
  end else if VarIsStr(AValue) then
    FOrbit := AValue;
end;

procedure TPayload.SetPeriapsisKilometers(AValue: Double);
begin
  FPeriapsisKilometers := AValue;
end;

procedure TPayload.SetPeriapsisKilometers(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FPeriapsisKilometers := -0.0;
  end else if VarIsNumeric(AValue) then
    FPeriapsisKilometers := AValue;
end;

procedure TPayload.SetPeriodMinutes(AValue: Double);
begin
  FPeriodMinutes := AValue;
end;

procedure TPayload.SetPeriodMinutes(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FPeriodMinutes := -0.0;
  end else if VarIsNumeric(AValue) then
    FPeriodMinutes := AValue;
end;

procedure TPayload.SetRaan(AValue: Double);
begin
  FRaan := AValue;
end;

procedure TPayload.SetRaan(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FRaan := -0.0;
  end else if VarIsNumeric(AValue) then
    FRaan := AValue;
end;

procedure TPayload.SetReferenceSystem(AValue: string);
begin
  FReferenceSystem := AValue;
end;

procedure TPayload.SetReferenceSystem(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FReferenceSystem := '';
  end else if VarIsStr(AValue) then
    FReferenceSystem := AValue;
end;

procedure TPayload.SetRegime(AValue: string);
begin
  FRegime := AValue;
end;

procedure TPayload.SetRegime(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FRegime := '';
  end else if VarIsStr(AValue) then
    FRegime := AValue;
end;

procedure TPayload.SetReused(AValue: Boolean);
begin
  FReused := AValue;
end;

procedure TPayload.SetReused(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FReused := False;
  end else if VarIsBool(AValue) then
    FReused := AValue;
end;

procedure TPayload.SetSemiMajorAxisKilometers(AValue: Double);
begin
  FSemiMajorAxisKilometers := AValue;
end;

procedure TPayload.SetSemiMajorAxisKilometers(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FSemiMajorAxisKilometers := -0.0;
  end else if VarIsNumeric(AValue) then
    FSemiMajorAxisKilometers := AValue;
end;

procedure TPayload.SetTypeInfo(AValue: string);
begin
  FTypeInfo := AValue;
end;

procedure TPayload.SetTypeInfo(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FTypeInfo := '';
  end else if VarIsStr(AValue) then
    FTypeInfo := AValue;
end;

procedure TPayload.BuildSubObjects(const JSONData: IJSONData);
var
  SubJSONData: IJSONData;
  DragonPayload: IDragonPayload;
begin
  inherited BuildSubObjects(JSONData);

  //SubJSONData := JSONData.GetPath('dragon');
  //DragonPayload := NewDragonPayload;
  //JSONToModel(SubJSONData.GetJSONData, DragonPayload);

  SetTypeInfo(JSONData.GetPath('type').GetJSONData);
end;

constructor TPayload.Create;
begin
  inherited Create;
  FCustomers := TStringList.Create;
  FManufacturers := TStringList.Create;
  FNationalities := TStringList.Create;

  FCustomers.SkipLastLineBreak := True;
  FManufacturers.SkipLastLineBreak := True;
  FNationalities.SkipLastLineBreak := True;
end;

destructor TPayload.destroy;
begin
  FreeAndNil(FCustomers);
  FreeAndNil(FManufacturers);
  FreeAndNil(FNationalities);
  inherited destroy;
end;

function TPayload.ToString(): string;
begin
  Result := Format(''
    + 'Apoapsis(km): %f' + LineEnding
    + 'Arg of Pericenter: %f' + LineEnding
    + 'Customers: %s' + LineEnding
    //+ 'Dragon Payload: %s' + LineEnding
    + 'Eccentricity: %f' + LineEnding
    + 'Epoch: %s' + LineEnding
    + 'ID: %s' + LineEnding
    + 'Inclination Degrees: %f' + LineEnding
    + 'Launch ID: %s' + LineEnding
    + 'Lifespan Years: %u' + LineEnding
    + 'Longitude: %f' + LineEnding
    + 'Manufacturers: %s' + LineEnding
    + 'Mass(kg): %f' + LineEnding
    + 'Mass(lbs): %f' + LineEnding
    + 'Mean Anomaly: %f' + LineEnding
    + 'Mean Motion: %f' + LineEnding
    + 'Name: %s' + LineEnding
    + 'Nationalities: %s' + LineEnding
    //+ 'Norads: %s' + LineEnding
    + 'Orbit: %s' + LineEnding
    + 'Periapsis(km): %f' + LineEnding
    + 'Period Minutes: %f' + LineEnding
    + 'Raan: %f' + LineEnding
    + 'Reference System: %s' + LineEnding
    + 'Regime: %s' + LineEnding
    + 'Reused: %s' + LineEnding
    + 'Semi Major Axis(km): %f' + LineEnding
    + 'Type: %s'
    , [
      GetApoapsisKilometers,
      GetArgOfPericenter,
      GetCustomers.Text,
      //GetDragonPayload.ToString,
      GetEccentricity,
      DateToStr(GetEpoch),
      GetId,
      GetInclinationDegrees,
      GetLaunchId,
      GetLifespanYears,
      GetLongitude,
      GetManufacturers.Text,
      GetMassKilograms,
      GetMassPounds,
      GetMeanAnomaly,
      GetMeanMotion,
      GetName,
      GetNationalities.Text,
      //GetNoradIds,
      GetOrbit,
      GetPeriapsisKilometers,
      GetPeriodMinutes,
      GetRaan,
      GetReferenceSystem,
      GetRegime,
      BoolToStr(GetReused),
      GetSemiMajorAxisKilometers,
      GetTypeInfo
    ]);
end;

end.

