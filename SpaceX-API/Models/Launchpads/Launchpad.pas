unit Launchpad;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LaunchpadStatus, BaseModel, JSON_Helper;

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
    property RocketsId: TStringList read GetRocketsId write SetRocketsId;
    property Status: string read GetStatus write SetStatus;
    property TimeZone: string read GetTimeZone write SetTimeZone;
  end;

  ILaunchpadList = interface(IBaseModelList) ['{8EB54717-9CC1-4B35-B23C-805979B2ED91}']
  end;

function NewLaunchpad: ILaunchpad;
function NewLaunchpadList: ILaunchpadList;

implementation

uses
  Variants;

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
    procedure SetRocketsId(AValue: TStringList);
    procedure SetStatus(AValue: string);
    procedure SetTimeZone(AValue: string);
  public
    procedure BuildSubObjects(const JSONData: IJSONData); override;
    function ToString(): string; override;
  published
    property details: string read GetDetails write SetDetails;
    property full_name: string read GetFullName write SetFullName;
    property id: string read GetId write SetId;
    property latitude: Double read GetLatitude write SetLatitude;
    property launch_attempts: LongWord read GetLaunchAttempts write SetLaunchAttempts;
    //property LaunchesId: TStringList read GetLaunchesId write SetLaunchesId;
    property launch_successes: LongWord read GetLaunchSuccesses write SetLaunchSuccesses;
    property locality: string read GetLocality write SetLocality;
    property longitude: Double read GetLongitude write SetLongitude;
    property name: string read GetName write SetName;
    property region: string read GetRegion write SetRegion;
    //property rockets_id: TStringList read GetRocketsId write SetRocketsId;
    property status: string read GetStatus write SetStatus;
    property time_zone: string read GetTimeZone write SetTimeZone;
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

procedure TLaunchpad.SetFullName(AValue: string);
begin
  FFullName := AValue;
end;

procedure TLaunchpad.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TLaunchpad.SetLatitude(AValue: Double);
begin
  FLatitude := AValue;
end;

procedure TLaunchpad.SetLaunchAttempts(AValue: LongWord);
begin
  FLaunchAttempts := AValue;
end;

procedure TLaunchpad.SetLaunchesId(AValue: TStringList);
begin
  FLaunchesId := AValue;
end;

procedure TLaunchpad.SetLaunchSuccesses(AValue: LongWord);
begin
  FLaunchSuccesses := AValue;
end;

procedure TLaunchpad.SetLocality(AValue: string);
begin
  FLocality := AValue;
end;

procedure TLaunchpad.SetLongitude(AValue: Double);
begin
  FLongitude := AValue;
end;

procedure TLaunchpad.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TLaunchpad.SetRegion(AValue: string);
begin
  FRegion := AValue;
end;

procedure TLaunchpad.SetRocketsId(AValue: TStringList);
begin
  FRocketsId := AValue;
end;

procedure TLaunchpad.SetStatus(AValue: string);
begin
  FStatus := AValue;
end;

procedure TLaunchpad.SetTimeZone(AValue: string);
begin
  FTimeZone := AValue;
end;

function TLaunchpad.ToString(): string;
begin
  Result := GetName;
end;

end.

