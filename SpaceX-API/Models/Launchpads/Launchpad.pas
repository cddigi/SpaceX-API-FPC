unit Launchpad;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LaunchpadStatus;

type

  { TLaunchpad }

  TLaunchpad = class(TInterfacedObject)
  public
    Id: string;
    Name: string;
    Locality: string;
    Region: string;
    TimeZone: string;
    Latitude: double;
    Longitude: double;
    Details: string;
    Status: TLaunchpadStatus;
    FullName: string;
    LaunchAttempts: LongWord;
    LaunchSuccesses: LongWord;
    RocketsId: TStringList;
    { get => _rocketsId;
      set( _rocketsId = value;
           Rockets = _rocketsId.Select(p => new Lazy<RocketInfo>(() => Context.RocketsEndpoint.Get(p).Execute())).ToList();)}
    LaunchesId: TStringList;
    { get => _launchesId;
      set( _launchesId = value;
           Launches = _launchesId.Select(p => new Lazy<LaunchInfo>(() => Context.LaunchesEndpoint.Get(p).Execute())).ToList();)}
    //Rockets: List<Lazy<RocketInfo>>;
    //Launches: List<Lazy<LaunchInfo>>;
    function ToString(): string; override;
  private
    _rocketsId: TStringList;
    _launchesId: TStringList;
  end;

implementation

{ TLaunchpad }

function TLaunchpad.ToString(): string;
begin
  Result := Name;
end;

end.

