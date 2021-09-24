unit Landpad;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel, JSON_Helper;

type

  IBaseLandpad = interface(IBaseModel) ['{02F620CC-2902-4A22-9F91-7B563274523E}']
    function GetDetails: string;
    function GetFullName: string;
    function GetId: string;
    function GetLandingAttempts: LongWord;
    function GetLandingSuccesses: LongWord;
    function GetLatitude: Double;
    function GetLaunchesId: TStringList;
    function GetLocality: string;
    function GetLongitude: Double;
    function GetName: string;
    function GetRegion: string;
    function GetStatus: string;
    function GetTypeInfo: string;
    function GetWikipedia: string;

    procedure SetDetails(AValue: string);
    procedure SetFullName(AValue: string);
    procedure SetId(AValue: string);
    procedure SetLandingAttempts(AValue: LongWord);
    procedure SetLandingSuccesses(AValue: LongWord);
    procedure SetLatitude(AValue: Double);
    procedure SetLaunchesId(AValue: TStringList);
    procedure SetLocality(AValue: string);
    procedure SetLongitude(AValue: Double);
    procedure SetName(AValue: string);
    procedure SetRegion(AValue: string);
    procedure SetStatus(AValue: string);
    procedure SetTypeInfo(AValue: string);
    procedure SetWikipedia(AValue: string);
  end;

  ILandpad = interface(IBaseLandpad) ['{4C3AFC41-4FBF-4391-9C82-F5C61EE01820}']
    property Details: string read GetDetails write SetDetails;
    property FullName: string read GetFullName write SetFullName;
    property Id: string read GetId write SetId;
    property LandingAttempts: LongWord read GetLandingAttempts write SetLandingAttempts;
    property LandingSuccesses: LongWord read GetLandingSuccesses write SetLandingSuccesses;
    property Latitude: Double read GetLatitude write SetLatitude;
    property LaunchesId: TStringList read GetLaunchesId write SetLaunchesId;
    property Locality: string read GetLocality write SetLocality;
    property Longitude: Double read GetLongitude write SetLongitude;
    property Name: string read GetName write SetName;
    property Region: string read GetRegion write SetRegion;
    property Status: string read GetStatus write SetStatus;
    property TypeInfo: string read GetTypeInfo write SetTypeInfo;
    property Wikipedia: string read GetWikipedia write SetWikipedia;
  end;

  ILandpadList = interface(IBaseModelList) ['{F407C7A0-0C87-41BA-84E3-073C93830B98}']
  end;

function NewLandpad: ILandpad;
function NewLandpadList: ILandpadList;

implementation

uses
  Variants;

type

  { TLandpad }

  TLandpad = class(TBaseModel, ILandpad)
  private
    FDetails: string;
    FFullName: string;
    FId: string;
    FLandingAttempts: LongWord;
    FLandingSuccesses: LongWord;
    FLatitude: Double;
    FLaunchesId: TStringList;
    FLocality: string;
    FLongitude: Double;
    FName: string;
    FRegion: string;
    FStatus: string;
    FTypeInfo: string;
    FWikipedia: string;
    function GetDetails: string;
    function GetFullName: string;
    function GetId: string;
    function GetLandingAttempts: LongWord;
    function GetLandingSuccesses: LongWord;
    function GetLatitude: Double;
    function GetLaunchesId: TStringList;
    function GetLocality: string;
    function GetLongitude: Double;
    function GetName: string;
    function GetRegion: string;
    function GetStatus: string;
    function GetTypeInfo: string;
    function GetWikipedia: string;

    procedure SetDetails(AValue: string);
    procedure SetFullName(AValue: string);
    procedure SetId(AValue: string);
    procedure SetLandingAttempts(AValue: LongWord);
    procedure SetLandingSuccesses(AValue: LongWord);
    procedure SetLatitude(AValue: Double);
    procedure SetLaunchesId(AValue: TStringList);
    procedure SetLocality(AValue: string);
    procedure SetLongitude(AValue: Double);
    procedure SetName(AValue: string);
    procedure SetRegion(AValue: string);
    procedure SetStatus(AValue: string);
    procedure SetTypeInfo(AValue: string);
    procedure SetWikipedia(AValue: string);
  public
    function ToString(): string; override;
  published
    property details: string read GetDetails write SetDetails;
    property full_name: string read GetFullName write SetFullName;
    property id: string read GetId write SetId;
    property landing_attempts: LongWord read GetLandingAttempts write SetLandingAttempts;
    property landing_successes: LongWord read GetLandingSuccesses write SetLandingSuccesses;
    property latitude: Double read GetLatitude write SetLatitude;
    //property LaunchesId: TStringList read GetLaunchesId write SetLaunchesId;
    property locality: string read GetLocality write SetLocality;
    property longitude: Double read GetLongitude write SetLongitude;
    property name: string read GetName write SetName;
    property region: string read GetRegion write SetRegion;
    property status: string read GetStatus write SetStatus;
    //property TypeInfo: string read GetTypeInfo write SetTypeInfo;
    property wikipedia: string read GetWikipedia write SetWikipedia;
  end;

  { TLandpadList }

  TLandpadList = class(TBaseModelList, ILandpadList)
    function NewItem: IBaseModel; override;
  end;

function NewLandpad: ILandpad;
begin
  Result := TLandpad.Create;
end;

function NewLandpadList: ILandpadList;
begin
  Result := TLandpadList.Create;
end;

{ TLandpadList }

function TLandpadList.NewItem: IBaseModel;
begin
  Result := NewLandpad;
end;

{ TLandpad }

function TLandpad.GetDetails: string;
begin
  Result := FDetails;
end;

function TLandpad.GetFullName: string;
begin
  Result := FFullName;
end;

function TLandpad.GetId: string;
begin
  Result := FId;
end;

function TLandpad.GetLandingAttempts: LongWord;
begin
  Result := FLandingAttempts;
end;

function TLandpad.GetLandingSuccesses: LongWord;
begin
  Result := FLandingSuccesses;
end;

function TLandpad.GetLatitude: Double;
begin
  Result := FLatitude;
end;

function TLandpad.GetLaunchesId: TStringList;
begin
  Result := FLaunchesId;
end;

function TLandpad.GetLocality: string;
begin
  Result := FLocality;
end;

function TLandpad.GetLongitude: Double;
begin
  Result := FLongitude;
end;

function TLandpad.GetName: string;
begin
  Result := FName;
end;

function TLandpad.GetRegion: string;
begin
  Result := FRegion;
end;

function TLandpad.GetStatus: string;
begin
  Result := FStatus;
end;

function TLandpad.GetTypeInfo: string;
begin
  Result := FTypeInfo;
end;

function TLandpad.GetWikipedia: string;
begin
  Result := FWikipedia;
end;

procedure TLandpad.SetDetails(AValue: string);
begin
  FDetails := AValue;
end;

procedure TLandpad.SetFullName(AValue: string);
begin
  FFullName := AValue;
end;

procedure TLandpad.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TLandpad.SetLandingAttempts(AValue: LongWord);
begin
  FLandingAttempts := AValue;
end;

procedure TLandpad.SetLandingSuccesses(AValue: LongWord);
begin
  FLandingSuccesses := AValue;
end;

procedure TLandpad.SetLatitude(AValue: Double);
begin
  FLatitude := AValue;
end;

procedure TLandpad.SetLaunchesId(AValue: TStringList);
begin
  FLaunchesId := AValue;
end;

procedure TLandpad.SetLocality(AValue: string);
begin
  FLocality := AValue;
end;

procedure TLandpad.SetLongitude(AValue: Double);
begin
  FLongitude := AValue;
end;

procedure TLandpad.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TLandpad.SetRegion(AValue: string);
begin
  FRegion := AValue;
end;

procedure TLandpad.SetStatus(AValue: string);
begin
  FStatus := AValue;
end;

procedure TLandpad.SetTypeInfo(AValue: string);
begin
  FTypeInfo := AValue;
end;

procedure TLandpad.SetWikipedia(AValue: string);
begin
  FWikipedia := AValue;
end;

function TLandpad.ToString(): string;
begin
  Result := GetName;
end;

end.

