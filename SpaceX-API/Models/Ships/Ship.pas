unit Ship;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type

  IBaseShip = interface(IBaseModel) ['{9ABB15B8-ACDF-4752-87BF-04268EF96CEB}']
    function GetAbs: LongWord;
    function GetActive: Boolean;
    function GetClassSize: LongWord;
    function GetCourseDegrees: Double;
    function GetHomePort: string;
    function GetId: string;
    function GetImage: string;
    function GetImo: LongWord;
    function GetLastAisUpdate: TDateTime;
    function GetLatitude: Double;
    function GetLaunchesId: TStringList;
    function GetLegacyId: string;
    function GetLink: string;
    function GetLongitude: Double;
    function GetMassKilograms: Double;
    function GetMassPounds: Double;
    function GetMmsi: LongWord;
    function GetModel: string;
    function GetName: string;
    function GetRoles: TStringList;
    function GetSpeedKnots: Double;
    function GetStatus: string;
    function GetTypeInfo: string;
    function GetYearBuilt: LongWord;

    procedure SetAbs(AValue: LongWord);
    procedure SetActive(AValue: Boolean);
    procedure SetClassSize(AValue: LongWord);
    procedure SetCourseDegrees(AValue: Double);
    procedure SetHomePort(AValue: string);
    procedure SetId(AValue: string);
    procedure SetImage(AValue: string);
    procedure SetImo(AValue: LongWord);
    procedure SetLastAisUpdate(AValue: TDateTime);
    procedure SetLatitude(AValue: Double);
    procedure SetLaunchesId(AValue: TStringList);
    procedure SetLegacyId(AValue: string);
    procedure SetLink(AValue: string);
    procedure SetLongitude(AValue: Double);
    procedure SetMassKilograms(AValue: Double);
    procedure SetMassPounds(AValue: Double);
    procedure SetMmsi(AValue: LongWord);
    procedure SetModel(AValue: string);
    procedure SetName(AValue: string);
    procedure SetRoles(AValue: TStringList);
    procedure SetSpeedKnots(AValue: Double);
    procedure SetStatus(AValue: string);
    procedure SetTypeInfo(AValue: string);
    procedure SetYearBuilt(AValue: LongWord);
  end;

  IShip = interface(IBaseShip) ['{D8820A8B-49B9-40A7-A583-4EE9B4C2C7CC}']
    property Abs: LongWord read GetAbs write SetAbs;
    property Active: Boolean read GetActive write SetActive;
    property ClassSize: LongWord read GetClassSize write SetClassSize;
    property CourseDegrees: Double read GetCourseDegrees write SetCourseDegrees;
    property HomePort: string read GetHomePort write SetHomePort;
    property Id: string read GetId write SetId;
    property Image: string read GetImage write SetImage;
    property Imo: LongWord read GetImo write SetImo;
    property LastAisUpdate: TDateTime read GetLastAisUpdate write SetLastAisUpdate;
    property Latitude: Double read GetLatitude write SetLatitude;
    property LaunchesId: TStringList read GetLaunchesId write SetLaunchesId;
    property LegacyId: string read GetLegacyId write SetLegacyId;
    property Link: string read GetLink write SetLink;
    property Longitude: Double read GetLongitude write SetLongitude;
    property MassKilograms: Double read GetMassKilograms write SetMassKilograms;
    property MassPounds: Double read GetMassPounds write SetMassPounds;
    property Mmsi: LongWord read GetMmsi write SetMmsi;
    property Model: string read GetModel write SetModel;
    property Name: string read GetName write SetName;
    property Roles: TStringList read GetRoles write SetRoles;
    property SpeedKnots: Double read GetSpeedKnots write SetSpeedKnots;
    property Status: string read GetStatus write SetStatus;
    property TypeInfo: string read GetTypeInfo write SetTypeInfo;
    property YearBuilt: LongWord read GetYearBuilt write SetYearBuilt;
  end;

  IShipList = interface(IBaseModelList) ['{C494A556-C1FC-40BA-B31F-B10B2BB99EEE}']
  end;

  { TShipEnumerator }

  TShipEnumerator = class(TBaseModelEnumerator)
    function GetCurrent: IShip;
    property Current : IShip read GetCurrent;
  end;

function NewShip: IShip;
function NewShipList: IShipList;
operator enumerator(AList: IShipList): TShipEnumerator;

implementation

uses
  Variants, JSON_Helper;

type

  { TShip }

  TShip = class(TBaseModel, IShip)
  private
    FAbs: LongWord;
    FActive: Boolean;
    FClassSize: LongWord;
    FCourseDegrees: Double;
    FHomePort: string;
    FId: string;
    FImage: string;
    FImo: LongWord;
    FLastAisUpdate: TDateTime;
    FLatitude: Double;
    FLaunchesId: TStringList;
    FLegacyId: string;
    FLink: string;
    FLongitude: Double;
    FMassKilograms: Double;
    FMassPounds: Double;
    FMmsi: LongWord;
    FModel: string;
    FName: string;
    FRoles: TStringList;
    FSpeedKnots: Double;
    FStatus: string;
    FTypeInfo: string;
    FYearBuilt: LongWord;
    function GetAbs: LongWord;
    function GetActive: Boolean;
    function GetClassSize: LongWord;
    function GetCourseDegrees: Double;
    function GetHomePort: string;
    function GetId: string;
    function GetImage: string;
    function GetImo: LongWord;
    function GetLastAisUpdate: TDateTime;
    function GetLatitude: Double;
    function GetLaunchesId: TStringList;
    function GetLegacyId: string;
    function GetLink: string;
    function GetLongitude: Double;
    function GetMassKilograms: Double;
    function GetMassPounds: Double;
    function GetMmsi: LongWord;
    function GetModel: string;
    function GetName: string;
    function GetRoles: TStringList;
    function GetSpeedKnots: Double;
    function GetStatus: string;
    function GetTypeInfo: string;
    function GetYearBuilt: LongWord;

    procedure SetAbs(AValue: LongWord);
    procedure SetAbs(AValue: Variant);
    procedure SetActive(AValue: Boolean);
    procedure SetActive(AValue: Variant);
    procedure SetClassSize(AValue: LongWord);
    procedure SetClassSize(AValue: Variant);
    procedure SetCourseDegrees(AValue: Double);
    procedure SetCourseDegrees(AValue: Variant);
    procedure SetHomePort(AValue: string);
    procedure SetHomePort(AValue: Variant);
    procedure SetId(AValue: string);
    procedure SetId(AValue: Variant);
    procedure SetImage(AValue: string);
    procedure SetImage(AValue: Variant);
    procedure SetImo(AValue: LongWord);
    procedure SetImo(AValue: Variant);
    procedure SetLastAisUpdate(AValue: TDateTime);
    procedure SetLastAisUpdate(AValue: Variant);
    procedure SetLatitude(AValue: Double);
    procedure SetLatitude(AValue: Variant);
    procedure SetLaunchesId(AValue: TStringList);
    procedure SetLegacyId(AValue: string);
    procedure SetLegacyId(AValue: Variant);
    procedure SetLink(AValue: string);
    procedure SetLink(AValue: Variant);
    procedure SetLongitude(AValue: Double);
    procedure SetLongitude(AValue: Variant);
    procedure SetMassKilograms(AValue: Double);
    procedure SetMassKilograms(AValue: Variant);
    procedure SetMassPounds(AValue: Double);
    procedure SetMassPounds(AValue: Variant);
    procedure SetMmsi(AValue: LongWord);
    procedure SetMmsi(AValue: Variant);
    procedure SetModel(AValue: string);
    procedure SetModel(AValue: Variant);
    procedure SetName(AValue: string);
    procedure SetName(AValue: Variant);
    procedure SetRoles(AValue: TStringList);
    procedure SetSpeedKnots(AValue: Double);
    procedure SetSpeedKnots(AValue: Variant);
    procedure SetStatus(AValue: string);
    procedure SetStatus(AValue: Variant);
    procedure SetTypeInfo(AValue: string);
    procedure SetTypeInfo(AValue: Variant);
    procedure SetYearBuilt(AValue: LongWord);
    procedure SetYearBuilt(AValue: Variant);
    //public List<Lazy<LaunchInfo>> Launches
  public
    procedure BuildSubObjects(const JSONData: IJSONData); override;
    function ToString(): string; override;
  published
    property abs: Variant write SetAbs;
    property active: Variant write SetActive;
    property class_size: Variant write SetClassSize;
    property course_deg: Variant write SetCourseDegrees;
    property home_port: Variant write SetHomePort;
    property id: Variant write SetId;
    property image: Variant write SetImage;
    property imo: Variant write SetImo;
    property last_ais_update: Variant write SetLastAisUpdate;
    property latitude: Variant write SetLatitude;
    //property launches: TStringList read GetLaunchesId write SetLaunchesId;
    property legacy_id: Variant write SetLegacyId;
    property link: Variant write SetLink;
    property longitude: Variant write SetLongitude;
    property mass_kg: Variant write SetMassKilograms;
    property mass_lbs: Variant write SetMassPounds;
    property mmsi: Variant write SetMmsi;
    property model: Variant write SetModel;
    property name: Variant write SetName;
    //property roles: TStringList read GetRoles write SetRoles;
    property speed_kn: Variant write SetSpeedKnots;
    property status: Variant write SetStatus;
    property year_built: Variant write SetYearBuilt;
  end;

  { TShipList }

  TShipList = class(TBaseModelList, IShipList)
    function NewItem: IBaseModel; override;
  end;

function NewShip: IShip;
begin
  Result := TShip.Create;
end;

function NewShipList: IShipList;
begin
  Result := TShipList.Create;
end;

operator enumerator(AList: IShipList): TShipEnumerator;
begin
  Result := TShipEnumerator.Create;
  Result.FList := AList;
end;

{ TShipEnumerator }

function TShipEnumerator.GetCurrent: IShip;
begin
  Result := FCurrent as IShip;
end;

{ TShipList }

function TShipList.NewItem: IBaseModel;
begin
  Result := NewShip;
end;

{ TShip }

function TShip.GetAbs: LongWord;
begin
  Result := FAbs;
end;

function TShip.GetActive: Boolean;
begin
  Result := FActive;
end;

function TShip.GetClassSize: LongWord;
begin
  Result := FClassSize;
end;

function TShip.GetCourseDegrees: Double;
begin
  Result := FCourseDegrees;
end;

function TShip.GetHomePort: string;
begin
  Result := FHomePort;
end;

function TShip.GetId: string;
begin
  Result := FId;
end;

function TShip.GetImage: string;
begin
  Result := FImage;
end;

function TShip.GetImo: LongWord;
begin
  Result := FImo;
end;

function TShip.GetLastAisUpdate: TDateTime;
begin
  Result := FLastAisUpdate;
end;

function TShip.GetLatitude: Double;
begin
  Result := FLatitude;
end;

function TShip.GetLaunchesId: TStringList;
begin
  Result := FLaunchesId;
end;

function TShip.GetLegacyId: string;
begin
  Result := FLegacyId;
end;

function TShip.GetLink: string;
begin
  Result := FLink;
end;

function TShip.GetLongitude: Double;
begin
  Result := FLongitude;
end;

function TShip.GetMassKilograms: Double;
begin
  Result := FMassKilograms;
end;

function TShip.GetMassPounds: Double;
begin
  Result := FMassPounds;
end;

function TShip.GetMmsi: LongWord;
begin
  Result := FMmsi;
end;

function TShip.GetModel: string;
begin
  Result := FModel;
end;

function TShip.GetName: string;
begin
  Result := FName;
end;

function TShip.GetRoles: TStringList;
begin
  Result := FRoles;
end;

function TShip.GetSpeedKnots: Double;
begin
  Result := FSpeedKnots;
end;

function TShip.GetStatus: string;
begin
  Result := FStatus;
end;

function TShip.GetTypeInfo: string;
begin
  Result := FTypeInfo;
end;

function TShip.GetYearBuilt: LongWord;
begin
  Result := FYearBuilt;
end;

procedure TShip.SetAbs(AValue: LongWord);
begin
  FAbs := AValue;
end;

procedure TShip.SetAbs(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FAbs := -0;
  end else if VarIsNumeric(AValue) then
    FAbs := AValue;
end;

procedure TShip.SetActive(AValue: Boolean);
begin
  FActive := AValue;
end;

procedure TShip.SetActive(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FActive := False;
  end else if VarIsBool(AValue) then
    FActive := AValue;
end;

procedure TShip.SetClassSize(AValue: LongWord);
begin
  FClassSize := AValue;
end;

procedure TShip.SetClassSize(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FClassSize := -0;
  end else if VarIsNumeric(AValue) then
    FClassSize := AValue;
end;

procedure TShip.SetCourseDegrees(AValue: Double);
begin
  FCourseDegrees := AValue;
end;

procedure TShip.SetCourseDegrees(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FCourseDegrees := -0;
  end else if VarIsNumeric(AValue) then
    FCourseDegrees := AValue;
end;

procedure TShip.SetHomePort(AValue: string);
begin
  FHomePort := AValue;
end;

procedure TShip.SetHomePort(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FHomePort := '';
  end else if VarIsStr(AValue) then
    FHomePort := AValue;
end;

procedure TShip.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TShip.SetId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FId := '';
  end else if VarIsStr(AValue) then
    FId := AValue;
end;

procedure TShip.SetImage(AValue: string);
begin
  FImage := AValue;
end;

procedure TShip.SetImage(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FImage := '';
  end else if VarIsStr(AValue) then
    FImage := AValue;
end;

procedure TShip.SetImo(AValue: LongWord);
begin
  FImo := AValue;
end;

procedure TShip.SetImo(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FImo := -0;
  end else if VarIsNumeric(AValue) then
    FImo := AValue;
end;

procedure TShip.SetLastAisUpdate(AValue: TDateTime);
begin
  FLastAisUpdate := AValue;
end;

procedure TShip.SetLastAisUpdate(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLastAisUpdate := MinDateTime;
  end else if VarIsStr(AValue) then
    FLastAisUpdate := AValue;
end;

procedure TShip.SetLatitude(AValue: Double);
begin
  FLatitude := AValue;
end;

procedure TShip.SetLatitude(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLatitude := -0;
  end else if VarIsNumeric(AValue) then
    FLatitude := AValue;
end;

procedure TShip.SetLaunchesId(AValue: TStringList);
begin
  FLaunchesId := AValue;
end;

procedure TShip.SetLegacyId(AValue: string);
begin
  FLegacyId := AValue;
end;

procedure TShip.SetLegacyId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLegacyId := '';
  end else if VarIsStr(AValue) then
    FLegacyId := AValue;
end;

procedure TShip.SetLink(AValue: string);
begin
  FLink := AValue;
end;

procedure TShip.SetLink(AValue: Variant);
begin
 if VarIsNull(AValue) then begin
   FLink := '';
 end else if VarIsStr(AValue) then
   FLink := AValue;
end;

procedure TShip.SetLongitude(AValue: Double);
begin
  FLongitude := AValue;
end;

procedure TShip.SetLongitude(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLongitude := -0;
  end else if VarIsNumeric(AValue) then
    FLongitude := AValue;
end;

procedure TShip.SetMassKilograms(AValue: Double);
begin
  FMassKilograms := AValue;
end;

procedure TShip.SetMassKilograms(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FMassKilograms := -0;
  end else if VarIsNumeric(AValue) then
    FMassKilograms := AValue;
end;

procedure TShip.SetMassPounds(AValue: Double);
begin
  FMassPounds := AValue;
end;

procedure TShip.SetMassPounds(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FMassPounds := -0;
  end else if VarIsNumeric(AValue) then
    FMassPounds := AValue;
end;

procedure TShip.SetMmsi(AValue: LongWord);
begin
  FMmsi := AValue;
end;

procedure TShip.SetMmsi(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FMmsi := -0;
  end else if VarIsNumeric(AValue) then
    FMmsi := AValue;
end;

procedure TShip.SetModel(AValue: string);
begin
  FModel := AValue;
end;

procedure TShip.SetModel(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FModel := '';
  end else if VarIsStr(AValue) then
    FModel := AValue;
end;

procedure TShip.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TShip.SetName(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FName := '';
  end else if VarIsStr(AValue) then
    FName := AValue;
end;

procedure TShip.SetRoles(AValue: TStringList);
begin
  FRoles := AValue;
end;

procedure TShip.SetSpeedKnots(AValue: Double);
begin
  FSpeedKnots := AValue;
end;

procedure TShip.SetSpeedKnots(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FSpeedKnots := -0;
  end else if VarIsNumeric(AValue) then
    FSpeedKnots := AValue;
end;

procedure TShip.SetStatus(AValue: string);
begin
  FStatus := AValue;
end;

procedure TShip.SetStatus(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FStatus := '';
  end else if VarIsStr(AValue) then
    FStatus := AValue;
end;

procedure TShip.SetTypeInfo(AValue: string);
begin
  FTypeInfo := AValue;
end;

procedure TShip.SetTypeInfo(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FTypeInfo := '';
  end else if VarIsStr(AValue) then
    FTypeInfo := AValue;
end;

procedure TShip.SetYearBuilt(AValue: LongWord);
begin
  FYearBuilt := AValue;
end;

procedure TShip.SetYearBuilt(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FYearBuilt := -0;
  end else if VarIsNumeric(AValue) then
    FYearBuilt := AValue;
end;

procedure TShip.BuildSubObjects(const JSONData: IJSONData);
begin
  inherited BuildSubObjects(JSONData);

  SetTypeInfo(JSONData.GetPath('type').GetJSONData);
end;

function TShip.ToString(): string;
begin
  Result := GetName;
end;

end.

