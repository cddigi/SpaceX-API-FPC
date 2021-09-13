unit LaunchFairings;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseLaunchFairings = interface(IInterface) ['{C2C2C1EB-1AA0-4578-9348-C7E1197767E0}']
    function GetRecovered: Boolean;
    function GetRecoveryAttempt: Boolean;
    function GetReused: Boolean;
    function GetShipsId: TStringList;

    procedure SetRecovered(AValue: Boolean);
    procedure SetRecoveryAttempt(AValue: Boolean);
    procedure SetReused(AValue: Boolean);
    procedure SetShipsId(AValue: TStringList);
  end;

  ILaunchFairings = interface(IBaseLaunchFairings) ['{FBD65390-07A3-4D91-9B71-7863705AC313}']
    property Recovered: Boolean read GetRecovered write SetRecovered;
    property RecoveryAttempt: Boolean read GetRecoveryAttempt write SetRecoveryAttempt;
    property Reused: Boolean read GetReused write SetReused;
    property ShipsId: TStringList read GetShipsId write SetShipsId;
  end;

function NewLaunchFairings: ILaunchFairings;

implementation

type

  { TLaunchFairings }

  TLaunchFairings = class(TInterfacedObject, ILaunchFairings)
    FRecovered: Boolean;
    FRecoveryAttempt: Boolean;
    FReused: Boolean;
    FShipsId: TStringList;
    //Ships: List<Lazy<ShipInfo>>;
    function GetRecovered: Boolean;
    function GetRecoveryAttempt: Boolean;
    function GetReused: Boolean;
    function GetShipsId: TStringList;

    procedure SetRecovered(AValue: Boolean);
    procedure SetRecoveryAttempt(AValue: Boolean);
    procedure SetReused(AValue: Boolean);
    procedure SetShipsId(AValue: TStringList);
  end;

function NewLaunchFairings: ILaunchFairings;
begin
  Result := TLaunchFairings.Create;
end;

{ TLaunchFairings }

function TLaunchFairings.GetRecovered: Boolean;
begin
  Result := FRecovered;
end;

function TLaunchFairings.GetRecoveryAttempt: Boolean;
begin
  Result := FRecoveryAttempt;
end;

function TLaunchFairings.GetReused: Boolean;
begin
  Result := FReused;
end;

function TLaunchFairings.GetShipsId: TStringList;
begin
  Result := FShipsId;
end;

procedure TLaunchFairings.SetRecovered(AValue: Boolean);
begin
  FRecovered := AValue;
end;

procedure TLaunchFairings.SetRecoveryAttempt(AValue: Boolean);
begin
  FRecoveryAttempt := AValue;
end;

procedure TLaunchFairings.SetReused(AValue: Boolean);
begin
  FReused := AValue;
end;

procedure TLaunchFairings.SetShipsId(AValue: TStringList);
begin
  FShipsId := AValue;
end;

end.

