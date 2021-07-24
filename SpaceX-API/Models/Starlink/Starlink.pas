unit Starlink;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SpaceTrackInfo;

type

  { TStarlink }

  TStarlink = class(TInterfacedObject)
  public
    Id: string;
    Version: string;
    SpaceTrack: TSpaceTrackInfo;
    Latitude: Double;
    Longitude: Double;
    HeightKilometers: Double;
    VelocityKilometersPerSecond: Double;
    LaunchId: string;
    { get => _launchId;
      set( _launchId = value;
           Launch = new Lazy<LaunchInfo>(() => Context.LaunchesEndpoint.Get(_launchId).Execute());)}
    //public Lazy<LaunchInfo> Launch
    function ToString(): string; override;
  private
    _launchId: string;
  end;

implementation

{ TStarlink }

function TStarlink.ToString(): string;
begin
  Result := SpaceTrack.ObjectName;
end;

end.

