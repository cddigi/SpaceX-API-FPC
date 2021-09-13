unit DragonPayload;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseDragonPayload = interface(IInterface) ['{2F53CCE8-FF4D-4676-AC78-0949B1536D54}']
    function GetCapsuleId: string;
    function GetFlightTimeSeconds: LongWord;
    function GetLandLanding: Boolean;
    function GetManifest: string;
    function GetMassReturnedKilograms: Double;
    function GetMassReturnedPounds: Double;
    function GetWaterLanding: Boolean;

    procedure SetCapsuleId(AValue: string);
    procedure SetFlightTimeSeconds(AValue: LongWord);
    procedure SetLandLanding(AValue: Boolean);
    procedure SetManifest(AValue: string);
    procedure SetMassReturnedKilograms(AValue: Double);
    procedure SetMassReturnedPounds(AValue: Double);
    procedure SetWaterLanding(AValue: Boolean);
  end;

  IDragonPayload = interface(IBaseDragonPayload) ['{23EE3AC9-A8A1-4C6F-9BC8-0C5080E5A7F0}']
    property CapsuleId: string read GetCapsuleId write SetCapsuleId;
    property FlightTimeSeconds: LongWord read GetFlightTimeSeconds write SetFlightTimeSeconds;
    property LandLanding: Boolean read GetLandLanding write SetLandLanding;
    property Manifest: string read GetManifest write SetManifest;
    property MassReturnedKilograms: Double read GetMassReturnedKilograms write SetMassReturnedKilograms;
    property MassReturnedPounds: Double read GetMassReturnedPounds write SetMassReturnedPounds;
    property WaterLanding: Boolean read GetWaterLanding write SetWaterLanding;
  end;

function NewDragonPayload: IDragonPayload;

implementation

type

  { TDragonPayload }

  TDragonPayload = class(TInterfacedObject, IDragonPayload)
  private
    FCapsuleId: string;
    FFlightTimeSeconds: LongWord;
    FLandLanding: Boolean;
    FManifest: string;
    FMassReturnedKilograms: Double;
    FMassReturnedPounds: Double;
    FWaterLanding: Boolean;
    //Capsule: Lazy<CapsuleInfo>;
    function GetCapsuleId: string;
    function GetFlightTimeSeconds: LongWord;
    function GetLandLanding: Boolean;
    function GetManifest: string;
    function GetMassReturnedKilograms: Double;
    function GetMassReturnedPounds: Double;
    function GetWaterLanding: Boolean;

    procedure SetCapsuleId(AValue: string);
    procedure SetFlightTimeSeconds(AValue: LongWord);
    procedure SetLandLanding(AValue: Boolean);
    procedure SetManifest(AValue: string);
    procedure SetMassReturnedKilograms(AValue: Double);
    procedure SetMassReturnedPounds(AValue: Double);
    procedure SetWaterLanding(AValue: Boolean);
  end;

function NewDragonPayload: IDragonPayload;
begin
  Result := TDragonPayload.Create;
end;

{ TDragonPayload }

function TDragonPayload.GetCapsuleId: string;
begin
  Result := FCapsuleId;
end;

function TDragonPayload.GetFlightTimeSeconds: LongWord;
begin
  Result := FFlightTimeSeconds;
end;

function TDragonPayload.GetLandLanding: Boolean;
begin
  Result := FLandLanding;
end;

function TDragonPayload.GetManifest: string;
begin
  Result := FManifest;
end;

function TDragonPayload.GetMassReturnedKilograms: Double;
begin
  Result := FMassReturnedKilograms;
end;

function TDragonPayload.GetMassReturnedPounds: Double;
begin
  Result := FMassReturnedPounds;
end;

function TDragonPayload.GetWaterLanding: Boolean;
begin
  Result := FWaterLanding;
end;

procedure TDragonPayload.SetCapsuleId(AValue: string);
begin
  FCapsuleId := AValue;
end;

procedure TDragonPayload.SetFlightTimeSeconds(AValue: LongWord);
begin
  FFlightTimeSeconds := AValue;
end;

procedure TDragonPayload.SetLandLanding(AValue: Boolean);
begin
  FLandLanding := AValue;
end;

procedure TDragonPayload.SetManifest(AValue: string);
begin
  FManifest := AValue;
end;

procedure TDragonPayload.SetMassReturnedKilograms(AValue: Double);
begin
  FMassReturnedKilograms := AValue;
end;

procedure TDragonPayload.SetMassReturnedPounds(AValue: Double);
begin
  FMassReturnedPounds := AValue;
end;

procedure TDragonPayload.SetWaterLanding(AValue: Boolean);
begin
  FWaterLanding := AValue;
end;

end.

