unit Ship;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseShip = interface(IInterface) ['{9ABB15B8-ACDF-4752-87BF-04268EF96CEB}']
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

function NewShip: IShip;

implementation

type

  { TShip }

  TShip = class(TInterfacedObject, IShip)
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
      //public List<Lazy<LaunchInfo>> Launches
    public
      function ToString(): string; override;
  end;

function NewShip: IShip;
begin
  Result := TShip.Create;
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

procedure TShip.SetActive(AValue: Boolean);
begin
  FActive := AValue;
end;

procedure TShip.SetClassSize(AValue: LongWord);
begin
  FClassSize := AValue;
end;

procedure TShip.SetCourseDegrees(AValue: Double);
begin
  FCourseDegrees := AValue;
end;

procedure TShip.SetHomePort(AValue: string);
begin
  FHomePort := AValue;
end;

procedure TShip.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TShip.SetImage(AValue: string);
begin
  FImage := AValue;
end;

procedure TShip.SetImo(AValue: LongWord);
begin
  FImo := AValue;
end;

procedure TShip.SetLastAisUpdate(AValue: TDateTime);
begin
  FLastAisUpdate := AValue;
end;

procedure TShip.SetLatitude(AValue: Double);
begin
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

procedure TShip.SetLink(AValue: string);
begin
  FLink := AValue;
end;

procedure TShip.SetLongitude(AValue: Double);
begin
  FLongitude := AValue;
end;

procedure TShip.SetMassKilograms(AValue: Double);
begin
  FMassKilograms := AValue;
end;

procedure TShip.SetMassPounds(AValue: Double);
begin
  FMassPounds := AValue;
end;

procedure TShip.SetMmsi(AValue: LongWord);
begin
  FMmsi := AValue;
end;

procedure TShip.SetModel(AValue: string);
begin
  FModel := AValue;
end;

procedure TShip.SetName(AValue: string);
begin
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

procedure TShip.SetStatus(AValue: string);
begin
  FStatus := AValue;
end;

procedure TShip.SetTypeInfo(AValue: string);
begin
  FTypeInfo := AValue;
end;

procedure TShip.SetYearBuilt(AValue: LongWord);
begin
  FYearBuilt := AValue;
end;

function TShip.ToString(): string;
begin
  Result := GetName;
end;

end.

