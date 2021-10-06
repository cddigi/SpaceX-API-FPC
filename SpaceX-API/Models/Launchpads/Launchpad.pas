unit Launchpad;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel, JSON_Helper, Rocket;

type

  IBaseLaunchpad = interface(IBaseModel) ['{5F822B68-8F65-426B-87BB-DAB668569845}']
    function GetDetails: string;
    function GetFullName: string;
    function GetId: string;
    function GetLatitude: Double;
    function GetLaunchAttempts: LongWord;
    function GetLaunchesId: TStringList;
    function GetLaunchSuccesses: LongWord;
    function GetLocality: string;
    function GetLongitude: Double;
    function GetName: string;
    function GetRegion: string;
    function GetRockets: IRocketList;
    function GetRocketsId: TStringList;
    function GetStatus: string;
    function GetTimeZone: string;

    procedure SetDetails(AValue: string);
    procedure SetFullName(AValue: string);
    procedure SetId(AValue: string);
    procedure SetLatitude(AValue: Double);
    procedure SetLaunchAttempts(AValue: LongWord);
    procedure SetLaunchesId(AValue: TStringList);
    procedure SetLaunchSuccesses(AValue: LongWord);
    procedure SetLocality(AValue: string);
    procedure SetLongitude(AValue: Double);
    procedure SetName(AValue: string);
    procedure SetRegion(AValue: string);
    procedure SetRockets(AValue: IRocketList);
    procedure SetRocketsId(AValue: TStringList);
    procedure SetStatus(AValue: string);
    procedure SetTimeZone(AValue: string);
  end;

  ILaunchpad = interface(IBaseLaunchpad) ['{9C45D5E5-619D-4F6D-AF4A-E2B9EDA8E9B4}']
    property Details: string read GetDetails write SetDetails;
    property FullName: string read GetFullName write SetFullName;
    property Id: string read GetId write SetId;
    property Latitude: Double read GetLatitude write SetLatitude;
    property LaunchAttempts: LongWord read GetLaunchAttempts write SetLaunchAttempts;
    property LaunchesId: TStringList read GetLaunchesId write SetLaunchesId;
    property LaunchSuccesses: LongWord read GetLaunchSuccesses write SetLaunchSuccesses;
    property Locality: string read GetLocality write SetLocality;
    property Longitude: Double read GetLongitude write SetLongitude;
    property Name: string read GetName write SetName;
    property Region: string read GetRegion write SetRegion;
    property Rockets: IRocketList read GetRockets write SetRockets;
    property RocketsId: TStringList read GetRocketsId write SetRocketsId;
    property Status: string read GetStatus write SetStatus;
    property TimeZone: string read GetTimeZone write SetTimeZone;
  end;

  ILaunchpadList = interface(IBaseModelList) ['{8EB54717-9CC1-4B35-B23C-805979B2ED91}']
  end;

  { TLaunchpadEnumerator }

  TLaunchpadEnumerator = class(TBaseModelEnumerator)
    function GetCurrent: ILaunchpad;
    property Current : ILaunchpad read GetCurrent;
  end;

function NewLaunchpad: ILaunchpad;
function NewLaunchpadList: ILaunchpadList;
operator enumerator(AList: ILaunchpadList): TLaunchpadEnumerator;

implementation

uses
  Variants, RocketEndpoint;

type

  { TLaunchpad }

  TLaunchpad = class(TBaseModel, ILaunchpad)
  private
    FDetails: string;
    FFullName: string;
    FId: string;
    FLatitude: double;
    FLaunchAttempts: LongWord;
    FLaunchesId: TStringList;
    FLaunchSuccesses: LongWord;
    FLocality: string;
    FLongitude: double;
    FName: string;
    FRegion: string;
    FRockets: IRocketList;
    FRocketsId: TStringList;
    FStatus: string;
    FTimeZone: string;
    //Rockets: List<Lazy<RocketInfo>>;
    //Launches: List<Lazy<LaunchInfo>>;
    function GetDetails: string;
    function GetFullName: string;
    function GetId: string;
    function GetLatitude: Double;
    function GetLaunchAttempts: LongWord;
    function GetLaunchesId: TStringList;
    function GetLaunchSuccesses: LongWord;
    function GetLocality: string;
    function GetLongitude: Double;
    function GetName: string;
    function GetRegion: string;
    function GetRockets: IRocketList;
    function GetRocketsId: TStringList;
    function GetStatus: string;
    function GetTimeZone: string;

    procedure SetDetails(AValue: string);
    procedure SetDetails(AValue: Variant);
    procedure SetFullName(AValue: string);
    procedure SetFullName(AValue: Variant);
    procedure SetId(AValue: string);
    procedure SetId(AValue: Variant);
    procedure SetLatitude(AValue: Double);
    procedure SetLatitude(AValue: Variant);
    procedure SetLaunchAttempts(AValue: LongWord);
    procedure SetLaunchAttempts(AValue: Variant);
    procedure SetLaunchesId(AValue: TStringList);
    procedure SetLaunchesId(AValue: Variant);
    procedure SetLaunchSuccesses(AValue: LongWord);
    procedure SetLaunchSuccesses(AValue: Variant);
    procedure SetLocality(AValue: string);
    procedure SetLocality(AValue: Variant);
    procedure SetLongitude(AValue: Double);
    procedure SetLongitude(AValue: Variant);
    procedure SetName(AValue: string);
    procedure SetName(AValue: Variant);
    procedure SetRegion(AValue: string);
    procedure SetRegion(AValue: Variant);
    procedure SetRockets(AValue: IRocketList);
    procedure SetRocketsId(AValue: TStringList);
    procedure SetStatus(AValue: string);
    procedure SetStatus(AValue: Variant);
    procedure SetTimeZone(AValue: string);
    procedure SetTimeZone(AValue: Variant);
  public
    constructor Create;
    destructor destroy; override;
    function ToString(): string; override;
  published
    property details: Variant write SetDetails;
    property full_name: Variant write SetFullName;
    property id: Variant write SetId;
    property latitude: Variant write SetLatitude;
    property launch_attempts: Variant write SetLaunchAttempts;
    property Launches: Variant write SetLaunchesId;
    property launch_successes: Variant write SetLaunchSuccesses;
    property locality: Variant write SetLocality;
    property longitude: Variant write SetLongitude;
    property name: Variant write SetName;
    property region: Variant write SetRegion;
    property rockets: TStringList read GetRocketsId write SetRocketsId;
    property status: Variant write SetStatus;
    property time_zone: Variant write SetTimeZone;
  end;

  { TLaunchpadList }

  TLaunchpadList = class(TBaseModelList, ILaunchpadList)
    function NewItem: IBaseModel; override;
  end;

function NewLaunchpad: ILaunchpad;
begin
  Result := TLaunchpad.Create;
end;

function NewLaunchpadList: ILaunchpadList;
begin
  Result := TLaunchpadList.Create;
end;

operator enumerator(AList: ILaunchpadList): TLaunchpadEnumerator;
begin
  Result := TLaunchpadEnumerator.Create;
  Result.FList := AList;
end;

{ TLaunchpadEnumerator }

function TLaunchpadEnumerator.GetCurrent: ILaunchpad;
begin
  Result := FCurrent as ILaunchpad;
end;

{ TLaunchpadList }

function TLaunchpadList.NewItem: IBaseModel;
begin
  Result := NewLaunchpad;
end;

{ TLaunchpad }

function TLaunchpad.GetDetails: string;
begin
  Result := FDetails;
end;

function TLaunchpad.GetFullName: string;
begin
  Result := FFullName;
end;

function TLaunchpad.GetId: string;
begin
  Result := FId;
end;

function TLaunchpad.GetLatitude: Double;
begin
  Result := FLatitude;
end;

function TLaunchpad.GetLaunchAttempts: LongWord;
begin
  Result := FLaunchAttempts;
end;

function TLaunchpad.GetLaunchesId: TStringList;
begin
  Result := FLaunchesId;
end;

function TLaunchpad.GetLaunchSuccesses: LongWord;
begin
  Result := FLaunchSuccesses;
end;

function TLaunchpad.GetLocality: string;
begin
  Result := FLocality;
end;

function TLaunchpad.GetLongitude: Double;
begin
  Result := FLongitude;
end;

function TLaunchpad.GetName: string;
begin
  Result := FName;
end;

function TLaunchpad.GetRegion: string;
begin
  Result := FRegion;
end;

function TLaunchpad.GetRockets: IRocketList;
var
  RocketEndpoint: IRocketEndpoint;
  RocketID: string;
  Rocket: IRocket;
begin
  if (FRockets = nil) then begin
    RocketEndpoint := NewRocketEndpoint;
    FRockets := NewRocketList;
    for RocketID in FRocketsId do begin;
      Rocket := RocketEndpoint.One(RocketID);
      FRockets.Add(Rocket);
    end;
  end;

  Result := FRockets;
end;

function TLaunchpad.GetRocketsId: TStringList;
begin
  Result := FRocketsId;
end;

function TLaunchpad.GetStatus: string;
begin
  Result := FStatus;
end;

function TLaunchpad.GetTimeZone: string;
begin
  Result := FTimeZone;
end;

procedure TLaunchpad.SetDetails(AValue: string);
begin
  FDetails := AValue;
end;

procedure TLaunchpad.SetDetails(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FDetails := '';
  end else if VarIsStr(AValue) then
    FDetails := AValue;
end;

procedure TLaunchpad.SetFullName(AValue: string);
begin
  FFullName := AValue;
end;

procedure TLaunchpad.SetFullName(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FFullName := '';
  end else if VarIsStr(AValue) then
    FFullName := AValue;
end;

procedure TLaunchpad.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TLaunchpad.SetId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FId := '';
  end else if VarIsStr(AValue) then
    FId := AValue;
end;

procedure TLaunchpad.SetLatitude(AValue: Double);
begin
  FLatitude := AValue;
end;

procedure TLaunchpad.SetLatitude(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLatitude := -0;
  end else if VarIsNumeric(AValue) then
    FLatitude := AValue;
end;

procedure TLaunchpad.SetLaunchAttempts(AValue: LongWord);
begin
  FLaunchAttempts := AValue;
end;

procedure TLaunchpad.SetLaunchAttempts(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLaunchAttempts := -0;
  end else if VarIsNumeric(AValue) then
    FLaunchAttempts := AValue;
end;

procedure TLaunchpad.SetLaunchesId(AValue: TStringList);
begin
  FLaunchesId := AValue;
end;

procedure TLaunchpad.SetLaunchesId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLaunchesId := TStringList.Create;
  end else if VarIsStr(AValue) then
    FLaunchesId.AddDelimitedtext(AValue);
end;

procedure TLaunchpad.SetLaunchSuccesses(AValue: LongWord);
begin
  FLaunchSuccesses := AValue;
end;

procedure TLaunchpad.SetLaunchSuccesses(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLaunchSuccesses := -0;
  end else if VarIsNumeric(AValue) then
    FLaunchSuccesses := AValue;
end;

procedure TLaunchpad.SetLocality(AValue: string);
begin
  FLocality := AValue;
end;

procedure TLaunchpad.SetLocality(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLocality := '';
  end else if VarIsStr(AValue) then
    FLocality := AValue;
end;

procedure TLaunchpad.SetLongitude(AValue: Double);
begin
  FLongitude := AValue;
end;

procedure TLaunchpad.SetLongitude(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLongitude := -0;
  end else if VarIsNumeric(AValue) then
    FLongitude := AValue;
end;

procedure TLaunchpad.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TLaunchpad.SetName(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FName := '';
  end else if VarIsStr(AValue) then
    FName := AValue;
end;

procedure TLaunchpad.SetRegion(AValue: string);
begin
  FRegion := AValue;
end;

procedure TLaunchpad.SetRegion(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FRegion := '';
  end else if VarIsStr(AValue) then
    FRegion := AValue;
end;

procedure TLaunchpad.SetRockets(AValue: IRocketList);
begin
  FRockets := AValue;
end;

procedure TLaunchpad.SetRocketsId(AValue: TStringList);
begin
  FRocketsId := AValue;
end;

procedure TLaunchpad.SetStatus(AValue: string);
begin
  FStatus := AValue;
end;

procedure TLaunchpad.SetStatus(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FStatus := '';
  end else if VarIsStr(AValue) then
    FStatus := AValue;
end;

procedure TLaunchpad.SetTimeZone(AValue: string);
begin
  FTimeZone := AValue;
end;

procedure TLaunchpad.SetTimeZone(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FTimeZone := '';
  end else if VarIsStr(AValue) then
    FTimeZone := AValue;
end;

constructor TLaunchpad.Create;
begin
  inherited Create;
  FLaunchesId := TStringList.Create;
  FRocketsId := TStringList.Create;

  FLaunchesId.SkipLastLineBreak := True;
  FRocketsId.SkipLastLineBreak := True;
end;

destructor TLaunchpad.destroy;
begin
  FreeAndNil(FLaunchesId);
  FreeAndNil(FRocketsId);
  inherited destroy;
end;

function TLaunchpad.ToString(): string;
begin
  Result := Format(''
    + 'Details: %s' + LineEnding
    + 'Full Name: %s' + LineEnding
    + 'ID: %s' + LineEnding
    + 'Latitude: %f' + LineEnding
    + 'Launch Attempts: %u' + LineEnding
    + 'Launches: %s' + LineEnding
    + 'Launch Successes: %u' + LineEnding
    + 'Locality: %s' + LineEnding
    + 'Longitude: %f' + LineEnding
    + 'Name: %s' + LineEnding
    + 'Region: %s' + LineEnding
    + 'Rockets: %s' + LineEnding
    + 'Status: %s' + LineEnding
    + 'Time Zone: %s'
    , [
      GetDetails,
      GetFullName,
      GetId,
      GetLatitude,
      GetLaunchAttempts,
      GetLaunchesId.Text,
      GetLaunchSuccesses,
      GetLocality,
      GetLongitude,
      GetName,
      GetRegion,
      GetRocketsId.Text,
      GetStatus,
      GetTimeZone
    ]);
end;

end.

