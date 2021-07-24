unit DragonPayload;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TDragonPayload = class(TInterfacedObject)
  public
    Manifest: string;
    MassReturnedKilograms: Double;
    MassReturnedPounds: Double;
    FlightTimeSeconds: LongWord;
    WaterLanding: Boolean;
    LandLanding: Boolean;
    CapsuleId: string;
    {$MESSAGE HINT 'Need to implement.'}
    { get => _capsuleId;
      set( _capsuleId = value;
           Capsule = new Lazy<CapsuleInfo>(() => Context.CapsulesEndpoint.Get(_capsuleId).Execute());)}
    //Capsule: Lazy<CapsuleInfo>;
  private
    _capsuleId: string;
  end;

implementation

end.

