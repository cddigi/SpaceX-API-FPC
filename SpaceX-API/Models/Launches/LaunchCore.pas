unit LaunchCore;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Generics.Collections;

type
  TLaunchCore = class(TInterfacedObject)
    Flight: LongWord;
    Gridfins: Boolean;
    Legs: Boolean;
    Reused: Boolean;
    LandingAttempt: Boolean;
    LandingSuccess: Boolean;
    LandingType: string;
    CoreId: string;
    {$MESSAGE HINT 'Need to implement fields here.'}
    { get => _coreId;
      set( _coreId = value;
           Core = new Lazy<CoreInfo>(() => Context.CoresEndpoint.Get(_coreId).Execute());)}
    LandpadId: string;
    { get => _landpadId;
      set( _landpadId = value;
           Landpad = new Lazy<LandpadInfo>(() => Context.LandpadsEndpoint.Get(_landpadId).Execute());)}
    //Core: Lazy<CoreInfo>;
    //Landpad: Lazy<LandpadInfo>;
    _coreId: string;
    _landpadId: string;
  end;

  TLaunchCoreList = specialize TObjectList<TLaunchCore>;

implementation

end.

