unit Core;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, CoreStatus;

type

  { TCore }

  TCore = class(TInterfacedObject)
    Id: string;
    Serial: string;
    Block: LongWord;
    Status: TCoreStatus;
    ReuseCount: LongWord;
    RtlsAttempts: LongWord;
    RtlsLandings: LongWord;
    AsdsAttempts: LongWord;
    AsdsLandings: LongWord;
    LastUpdate: string;
    LaunchesId: TStringList;
    {$MESSAGE HINT 'Need to implement.'}
    { get => _launchesId;
      set( _launchesId = value;
           Launches = _launchesId.Select(p => new Lazy<LaunchInfo>(() => Context.LaunchesEndpoint.Get(p).Execute())).ToList();)}
    //Launches: List<Lazy<LaunchInfo>>
    _launchesId: TStringList;
    function ToString(): string; override;
  end;

implementation

{ TCore }

function TCore.ToString(): string;
begin
  Result := Serial;
end;

end.

