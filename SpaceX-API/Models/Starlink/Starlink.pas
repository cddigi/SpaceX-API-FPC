unit Starlink;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SpaceTrackInfo, BaseModel;

type

  IBaseStarlink = interface(IBaseModel) ['{FC5F91BA-EB9F-4588-918F-744DB2BD8A54}']
    function GetHeightKilometers: Double;
    function GetId: string;
    function GetLatitude: Double;
    function GetLaunchId: string;
    function GetLongitude: Double;
    function GetSpaceTrack: ISpaceTrackInfo;
    function GetVelocityKilometersPerSecond: Double;
    function GetVersion: string;

    procedure SetHeightKilometers(AValue: Double);
    procedure SetId(AValue: string);
    procedure SetLatitude(AValue: Double);
    procedure SetLaunchId(AValue: string);
    procedure SetLongitude(AValue: Double);
    procedure SetSpaceTrack(AValue: ISpaceTrackInfo);
    procedure SetVelocityKilometersPerSecond(AValue: Double);
    procedure SetVersion(AValue: string);
  end;

  IStarlink = interface(IBaseStarlink) ['{1AAA8398-077B-4C2C-934C-C9F5C5D4F9F2}']
    property HeightKilometers: Double read GetHeightKilometers write SetHeightKilometers;
    property Id: string read GetId write SetId;
    property Latitude: Double read GetLatitude write SetLatitude;
    property LaunchId: string read GetLaunchId write SetLaunchId;
    property Longitude: Double read GetLongitude write SetLongitude;
    property SpaceTrack: ISpaceTrackInfo read GetSpaceTrack write SetSpaceTrack;
    property VelocityKilometersPerSecond: Double read GetVelocityKilometersPerSecond write SetVelocityKilometersPerSecond;
    property Version: string read GetVersion write SetVersion;
  end;

  IStarlinkList = interface(IBaseModelList) ['{9C51D55A-D53A-4C38-A1EB-781EB557ACA7}']
  end;

function NewStarlink: IStarlink;
function NewStarlinkList: IStarlinkList;

implementation

uses
  JSON_Helper;

type

  { TStarlink }

  TStarlink = class(TBaseModel, IStarlink)
  private
    FHeightKilometers: Double;
    FId: string;
    FLatitude: Double;
    FLaunchId: string;
    FLongitude: Double;
    FSpaceTrack: ISpaceTrackInfo;
    FVelocityKilometersPerSecond: Double;
    FVersion: string;
    //public Lazy<LaunchInfo> Launch
    function GetHeightKilometers: Double;
    function GetId: string;
    function GetLatitude: Double;
    function GetLaunchId: string;
    function GetLongitude: Double;
    function GetSpaceTrack: ISpaceTrackInfo;
    function GetVelocityKilometersPerSecond: Double;
    function GetVersion: string;

    procedure SetHeightKilometers(AValue: Double);
    procedure SetId(AValue: string);
    procedure SetLatitude(AValue: Double);
    procedure SetLaunchId(AValue: string);
    procedure SetLongitude(AValue: Double);
    procedure SetSpaceTrack(AValue: ISpaceTrackInfo);
    procedure SetVelocityKilometersPerSecond(AValue: Double);
    procedure SetVersion(AValue: string);
  public
    procedure BuildSubObjects(const JSONData: IJSONData); override;
    function ToString(): string; override;
  published
    property height_kilometers: Double read GetHeightKilometers write SetHeightKilometers;
    property id: string read GetId write SetId;
    property latitude: Double read GetLatitude write SetLatitude;
    property launch_id: string read GetLaunchId write SetLaunchId;
    property longitude: Double read GetLongitude write SetLongitude;
    property space_track: ISpaceTrackInfo read GetSpaceTrack write SetSpaceTrack;
    property velocity_kilometers_per_second: Double read GetVelocityKilometersPerSecond write SetVelocityKilometersPerSecond;
    property version: string read GetVersion write SetVersion;
  end;

  { TStarlinkList }

  TStarlinkList = class(TBaseModelList, IStarlinkList)
    function NewItem: IBaseModel; override;
  end;

function NewStarlink: IStarlink;
begin
  Result := TStarlink.Create;
end;

function NewStarlinkList: IStarlinkList;
begin
  Result := TStarlinkList.Create;
end;

{ TStarlinkList }

function TStarlinkList.NewItem: IBaseModel;
begin
  Result := NewStarlink;
end;

{ TStarlink }

function TStarlink.GetHeightKilometers: Double;
begin
  Result := FHeightKilometers;
end;

function TStarlink.GetId: string;
begin
  Result := FId;
end;

function TStarlink.GetLatitude: Double;
begin
  Result := FLatitude;
end;

function TStarlink.GetLaunchId: string;
begin
  Result := FLaunchId;
end;

function TStarlink.GetLongitude: Double;
begin
  Result := FLongitude;
end;

function TStarlink.GetSpaceTrack: ISpaceTrackInfo;
begin
  Result := FSpaceTrack;
end;

function TStarlink.GetVelocityKilometersPerSecond: Double;
begin
  Result := FVelocityKilometersPerSecond;
end;

function TStarlink.GetVersion: string;
begin
  Result := FVersion;
end;

procedure TStarlink.SetHeightKilometers(AValue: Double);
begin
  FHeightKilometers := AValue;
end;

procedure TStarlink.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TStarlink.SetLatitude(AValue: Double);
begin
  FLatitude := AValue;
end;

procedure TStarlink.SetLaunchId(AValue: string);
begin
  FLaunchId := AValue;
end;

procedure TStarlink.SetLongitude(AValue: Double);
begin
  FLongitude := AValue;
end;

procedure TStarlink.SetSpaceTrack(AValue: ISpaceTrackInfo);
begin
  FSpaceTrack := AValue;
end;

procedure TStarlink.SetVelocityKilometersPerSecond(AValue: Double);
begin
  FVelocityKilometersPerSecond := AValue;
end;

procedure TStarlink.SetVersion(AValue: string);
begin
  FVersion := AValue;
end;

procedure TStarlink.BuildSubObjects(const JSONData: IJSONData);
var
  SubJSONData: IJSONData;
  SpaceTrack: ISpaceTrackInfo;
begin
  inherited BuildSubObjects(JSONData);

  SubJSONData := JSONData.GetPath('spaceTrack');
  JSONToModel(SubJSONData.GetJSONData, SpaceTrack);
  Self.FSpaceTrack := SpaceTrack;
end;

function TStarlink.ToString(): string;
begin
  Result := GetSpaceTrack.ObjectName;
end;

end.

