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

  { TStarlinkEnumerator }

  TStarlinkEnumerator = class(TBaseModelEnumerator)
    function GetCurrent: IStarlink;
    property Current : IStarlink read GetCurrent;
  end;

function NewStarlink: IStarlink;
function NewStarlinkList: IStarlinkList;
operator enumerator(AList: IStarlinkList): TStarlinkEnumerator;

implementation

uses
  JSON_Helper, Variants;

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
    procedure SetHeightKilometers(AValue: Variant);
    procedure SetId(AValue: string);
    procedure SetId(AValue: Variant);
    procedure SetLatitude(AValue: Double);
    procedure SetLatitude(AValue: Variant);
    procedure SetLaunchId(AValue: string);
    procedure SetLaunchId(AValue: Variant);
    procedure SetLongitude(AValue: Double);
    procedure SetLongitude(AValue: Variant);
    procedure SetSpaceTrack(AValue: ISpaceTrackInfo);
    procedure SetVelocityKilometersPerSecond(AValue: Double);
    procedure SetVelocityKilometersPerSecond(AValue: Variant);
    procedure SetVersion(AValue: string);
    procedure SetVersion(AValue: Variant);
  public
    procedure BuildSubObjects(const JSONData: IJSONData); override;
    function ToString(): string; override;
  published
    property height_kilometers: Variant write SetHeightKilometers;
    property id: Variant write SetId;
    property latitude: Variant write SetLatitude;
    property launch_id: Variant write SetLaunchId;
    property longitude: Variant write SetLongitude;
    property space_track: ISpaceTrackInfo write SetSpaceTrack;
    property velocity_kilometers_per_second: Variant write SetVelocityKilometersPerSecond;
    property version: Variant write SetVersion;
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

operator enumerator(AList: IStarlinkList): TStarlinkEnumerator;
begin
  Result := TStarlinkEnumerator.Create;
  Result.FList := AList;
end;

{ TStarlinkEnumerator }

function TStarlinkEnumerator.GetCurrent: IStarlink;
begin
  Result := FCurrent as IStarlink;
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

procedure TStarlink.SetHeightKilometers(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FHeightKilometers := -0;
  end else if VarIsNumeric(AValue) then
    FHeightKilometers := AValue;
end;

procedure TStarlink.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TStarlink.SetId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FId := '';
  end else if VarIsStr(AValue) then
    FId := AValue;
end;

procedure TStarlink.SetLatitude(AValue: Double);
begin
  FLatitude := AValue;
end;

procedure TStarlink.SetLatitude(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLatitude := -0;
  end else if VarIsNumeric(AValue) then
    FLatitude := AValue;
end;

procedure TStarlink.SetLaunchId(AValue: string);
begin
  FLaunchId := AValue;
end;

procedure TStarlink.SetLaunchId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLaunchId := '';
  end else if VarIsStr(AValue) then
    FLaunchId := AValue;
end;

procedure TStarlink.SetLongitude(AValue: Double);
begin
  FLongitude := AValue;
end;

procedure TStarlink.SetLongitude(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLongitude := -0;
  end else if VarIsNumeric(AValue) then
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

procedure TStarlink.SetVelocityKilometersPerSecond(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FVelocityKilometersPerSecond := -0;
  end else if VarIsNumeric(AValue) then
    FVelocityKilometersPerSecond := AValue;
end;

procedure TStarlink.SetVersion(AValue: string);
begin
  FVersion := AValue;
end;

procedure TStarlink.SetVersion(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FVersion := '';
  end else if VarIsStr(AValue) then
    FVersion := AValue;
end;

procedure TStarlink.BuildSubObjects(const JSONData: IJSONData);
var
  SubJSONData: IJSONData;
  SpaceTrack: ISpaceTrackInfo;
begin
  inherited BuildSubObjects(JSONData);

  SubJSONData := JSONData.GetPath('spaceTrack');
  SpaceTrack := NewSpaceTrackInfo;
  JSONToModel(SubJSONData.GetJSONData, SpaceTrack);
  Self.FSpaceTrack := SpaceTrack;
end;

function TStarlink.ToString(): string;
begin
  Result := GetSpaceTrack.ObjectName;
end;

end.

