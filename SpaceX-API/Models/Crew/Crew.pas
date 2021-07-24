unit Crew;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, CrewStatus;

type

  { TCrew }

  TCrew = class(TInterfacedObject)
    Id: string;
    Name: string;
    Agency: string;
    Wikipedia: string;
    Image: string;
    Status: TCrewStatus;
    LaunchesId: TStringList;
    {$MESSAGE HINT 'Need to implement.'}
    { get => _launchesId;
      set( _launchesId = value;
           Launches = _launchesId.Select(p => new Lazy<LaunchInfo>(() => Context.LaunchesEndpoint.Get(p).Execute())).ToList();)}
    //Launches: List<Lazy<LaunchInfo>>;
    _launchesId: TStringList;
    function ToString(): string; override;
  end;

implementation

{ TCrew }

function TCrew.ToString(): string;
begin
  Result := Name;
end;

end.

