unit DragonPayload;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel, JSON_Helper;

type

  IBaseDragonPayload = interface(IBaseModel) ['{2F53CCE8-FF4D-4676-AC78-0949B1536D54}']
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

uses
  Variants;

type

  { TDragonPayload }

  TDragonPayload = class(TBaseModel, IDragonPayload)
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
    procedure SetCapsuleId(AValue: Variant);
    procedure SetFlightTimeSeconds(AValue: LongWord);
    procedure SetFlightTimeSeconds(AValue: Variant);
    procedure SetLandLanding(AValue: Boolean);
    procedure SetLandLanding(AValue: Variant);
    procedure SetManifest(AValue: string);
    procedure SetManifest(AValue: Variant);
    procedure SetMassReturnedKilograms(AValue: Double);
    procedure SetMassReturnedKilograms(AValue: Variant);
    procedure SetMassReturnedPounds(AValue: Double);
    procedure SetMassReturnedPounds(AValue: Variant);
    procedure SetWaterLanding(AValue: Boolean);
    procedure SetWaterLanding(AValue: Variant);
  published  // all nullable
    property capsule: Variant write SetCapsuleId;
    property flight_time_sec: Variant write SetFlightTimeSeconds;
    property land_landing: Variant write SetLandLanding;
    property manifest: Variant write SetManifest;
    property mass_returned_kg: Variant write SetMassReturnedKilograms;
    property mass_returned_lbs: Variant write SetMassReturnedPounds;
    property water_landing: Variant write SetWaterLanding;
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

procedure TDragonPayload.SetCapsuleId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FCapsuleId := '';
  end else if VarIsStr(AValue) then
    FCapsuleId := AValue;
end;

procedure TDragonPayload.SetFlightTimeSeconds(AValue: LongWord);
begin
  FFlightTimeSeconds := AValue;
end;

procedure TDragonPayload.SetFlightTimeSeconds(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FFlightTimeSeconds := -1;
  end else if VarIsNumeric(AValue) then
    FFlightTimeSeconds := AValue;
end;

procedure TDragonPayload.SetLandLanding(AValue: Boolean);
begin
  FLandLanding := AValue;
end;

procedure TDragonPayload.SetLandLanding(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLandLanding := False;
  end else if VarIsBool(AValue) then
    FLandLanding := AValue;
end;

procedure TDragonPayload.SetManifest(AValue: string);
begin
  FManifest := AValue;
end;

procedure TDragonPayload.SetManifest(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FManifest := '';
  end else if VarIsStr(AValue) then
    FManifest := AValue;
end;

procedure TDragonPayload.SetMassReturnedKilograms(AValue: Double);
begin
  FMassReturnedKilograms := AValue;
end;

procedure TDragonPayload.SetMassReturnedKilograms(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FMassReturnedKilograms := -1.0;
  end else if VarIsNumeric(AValue) then
    FMassReturnedKilograms := AValue;
end;

procedure TDragonPayload.SetMassReturnedPounds(AValue: Double);
begin
  FMassReturnedPounds := AValue;
end;

procedure TDragonPayload.SetMassReturnedPounds(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FMassReturnedPounds := -1.0;
  end else if VarIsNumeric(AValue) then
    FMassReturnedPounds := AValue;
end;

procedure TDragonPayload.SetWaterLanding(AValue: Boolean);
begin
  FWaterLanding := AValue;
end;

procedure TDragonPayload.SetWaterLanding(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FWaterLanding := False;
  end else if VarIsBool(AValue) then
    FWaterLanding := AValue;
end;

end.

