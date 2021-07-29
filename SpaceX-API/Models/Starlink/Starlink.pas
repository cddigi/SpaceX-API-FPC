unit Starlink;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SpaceTrackInfo;

type

  IBaseStarlink = interface(IInterface) ['{FC5F91BA-EB9F-4588-918F-744DB2BD8A54}']
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

function NewStarlink: IStarlink;

implementation

type

  { TStarlink }

  TStarlink = class(TInterfacedObject, IStarlink)
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
    function ToString(): string; override;
  end;

function NewStarlink: IStarlink;
begin
  Result := TStarlink.Create;
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

function TStarlink.ToString(): string;
begin
  Result := GetSpaceTrack.ObjectName;
end;

end.

