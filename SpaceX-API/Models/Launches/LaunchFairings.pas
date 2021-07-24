unit LaunchFairings;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TLaunchFairings = class(TInterfacedObject)
    Reused: Boolean;
    Recovered: Boolean;
    RecoveryAttempt: Boolean;
    ShipsId: TStringList;
    { get => _shipsId;
      set( _shipsId = value;
           Ships = _shipsId.Select(p => new Lazy<ShipInfo>(() => Context.ShipsEndpoint.Get(p).Execute())).ToList();)}
    //Ships: List<Lazy<ShipInfo>>;
    _shipsId: TStringList;
  end;

implementation

end.

