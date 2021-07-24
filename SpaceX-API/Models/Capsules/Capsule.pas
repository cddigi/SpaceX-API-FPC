unit Capsule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, CapsuleStatus;

type

  { TCapsule }

  TCapsule = class(TInterfacedObject)
    Id: string;
    Serial: string;
    Status: TCapsuleStatus;
    ReuseCount: LongWord;
    WaterLandings: LongWord;
    LandLandings: LongWord;
    LastUpdate: string;
    LaunchesId: TStringList;
    {$MESSAGE HINT 'Need to implement.'}
    { get => _launchesId;
      set(_launchesId = value;
          Launches = _launchesId.Select(p => new Lazy<LaunchInfo>(() => Context.LaunchesEndpoint.Get(p).Execute())).ToList();)}
    //Launches: List<Lazy<LaunchInfo>>
    _launchesId: TStringList;
    function ToString(): string; override;
  end;

implementation

{ TCapsule }

function TCapsule.ToString(): string;
begin
  Result := Serial;
end;

end.

