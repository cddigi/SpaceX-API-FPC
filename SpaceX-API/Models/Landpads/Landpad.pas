unit Landpad;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LandpadStatus;

type

  { TLandpad }

  TLandpad = class(TInterfacedObject)
    Id: string;
    Name: string;
    TypeInfo: string;
    Locality: string;
    Region: string;
    Latitude: Double;
    Longitude: Double;
    Wikipedia: string;
    Details: string;
    Status: TLandpadStatus;
    FullName: string;
    LandingAttempts: LongWord;
    LandingSuccesses: LongWord;
    LaunchesId: TStringList;
    {$MESSAGE HINT 'Need to implement.'}
    { get => _launchesId;
      set ( _launchesId = value;
            Launches = _launchesId.Select(p => new Lazy<LaunchInfo>(() => Context.LaunchesEndpoint.Get(p).Execute())).ToList();)}
    //Launches: List<Lazy<LaunchInfo>> ;
    _launchesId: TStringList;
    function ToString(): string; override;
  end;

implementation

{ TLandpad }

function TLandpad.ToString(): string;
begin
  Result := Name;
end;

end.

