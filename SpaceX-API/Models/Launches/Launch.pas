unit Launch;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LaunchCore, LaunchLinks, LaunchFairings, LaunchFailure, DatePrecision;

type

  { TLaunch }

  TLaunch = class(TInterfacedObject)
  public
    Id: string;
    Name: string;
    Upcoming: Boolean;
    Success: Boolean;
    Details: string;
    Cores: TLaunchCoreList;
    Links: TLaunchLinks;
    Fairings: TLaunchFairings;
    Failures: TLaunchFailureList;
    FlightNumber: LongWord;
    DateUtc: TDateTime;
    DateUnix: UInt64;
    DateLocal: TDateTime;
    DatePrecision: TDatePrecision;
    StaticFireDateUtc: TDateTime;
    StaticFireDateUnix: UInt64;
    ToBeDated: Boolean;
    NotEarlierThan: Boolean;
    Window: UInt64;
    AutoUpdate: Boolean;
    RocketId: string;
    {$MESSAGE HINT 'Need to implement.'}
    { get => _rocketId;
      set( _rocketId = value;
           Rocket = new Lazy<RocketInfo>(() => Context.RocketsEndpoint.Get(_rocketId).Execute());)}
    CrewId: TStringList;
    { get => _crewId;
      set( _crewId = value;
           Crew = _crewId.Select(p => new Lazy<CrewInfo>(() => Context.CrewEndpoint.Get(p).Execute())).ToList();)}
    ShipsId: TStringList;
    { get => _shipsId;
      set( _shipsId = value;
           Ships = _shipsId.Select(p => new Lazy<ShipInfo>(() => Context.ShipsEndpoint.Get(p).Execute())).ToList();)}
    CapsulesId: TStringList;
    { get => _capsulesId;
      set( _capsulesId = value;
           Capsules = _capsulesId.Select(p => new Lazy<CapsuleInfo>(() => Context.CapsulesEndpoint.Get(p).Execute())).ToList();)}
    PayloadsId: TStringList;
    { get => _payloadsId;
      set( _payloadsId = value;
           Payloads = _payloadsId.Select(p => new Lazy<PayloadInfo>(() => Context.PayloadsEndpoint.Get(p).Execute())).ToList();)}
    LaunchpadId: string;
    { get => _launchpadId;
      set( _launchpadId = value;
           Launchpad = new Lazy<LaunchpadInfo>(() => Context.LaunchpadsEndpoint.Get(_launchpadId).Execute());)}
    //Rocket: Lazy<RocketInfo>;
    //Crew: List<Lazy<CrewInfo>>;
    //Ships: List<Lazy<ShipInfo>>;
    //Capsules: List<Lazy<CapsuleInfo>>;
    //Payloads: List<Lazy<PayloadInfo>>;
    //Launchpad: Lazy<LaunchpadInfo>;
    function ToString(): string; override;
  private
    _rocketId: string;
    _crewId: TStringList;
    _shipsId: TStringList;
    _capsulesId: TStringList;
    _payloadsId: TStringList;
    _launchpadId: string;
  end;

implementation

{ TLaunch }

function TLaunch.ToString(): string;
begin
  Result := Name;
end;

end.

