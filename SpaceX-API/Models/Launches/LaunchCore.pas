unit LaunchCore;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type

  IBaseLaunchCore = interface(IBaseModel) ['{1D2DD805-56DB-497A-AE09-3343F8CA642B}']
    function GetCoreId: string;
    function GetFlight: LongWord;
    function GetGridfins: Boolean;
    function GetLandpadId: string;
    function GetLandingAttempt: Boolean;
    function GetLandingSuccess: Boolean;
    function GetLandingType: string;
    function GetLegs: Boolean;
    function GetReused: Boolean;

    procedure SetCoreId(AValue: string);
    procedure SetFlight(AValue: LongWord);
    procedure SetGridfins(AValue: Boolean);
    procedure SetLandpadId(AValue: string);
    procedure SetLandingAttempt(AValue: Boolean);
    procedure SetLandingSuccess(AValue: Boolean);
    procedure SetLandingType(AValue: string);
    procedure SetLegs(AValue: Boolean);
    procedure SetReused(AValue: Boolean);
  end;

  ILaunchCore = interface(IBaseLaunchCore) ['{C8A6A705-B9EA-4DB0-A0A8-F8AF5C88E0C4}']
    property CoreId: string read GetCoreId write SetCoreId;
    property Flight: LongWord read GetFlight write SetFlight;
    property Gridfins: Boolean read GetGridfins write SetGridfins;
    property LandpadId: string read GetLandpadId write SetLandpadId;
    property LandingAttempt: Boolean read GetLandingAttempt write SetLandingAttempt;
    property LandingSuccess: Boolean read GetLandingSuccess write SetLandingSuccess;
    property LandingType: string read GetLandingType write SetLandingType;
    property Legs: Boolean read GetLegs write SetLegs;
    property Reused: Boolean read GetReused write SetReused;
  end;

  ILaunchCoreList = interface(IBaseModelList) ['{4AB8C91D-8187-4E66-AD76-BA8CC002F10C}']

  end;

function NewLaunchCore: ILaunchCore;
function NewLaunchCoreList: ILaunchCoreList;

implementation

uses
  Variants;

type

  { TLaunchCore }

  TLaunchCore = class(TBaseModel, ILaunchCore)
  private
    FCoreId: string;
    FFlight: LongWord;
    FGridfins: Boolean;
    FLandpadId: string;
    FLandingAttempt: Boolean;
    FLandingSuccess: Boolean;
    FLandingType: string;
    FLegs: Boolean;
    FReused: Boolean;
    //Landpad: Lazy<LandpadInfo>;
    function GetCoreId: string;
    function GetFlight: LongWord;
    function GetGridfins: Boolean;
    function GetLandpadId: string;
    function GetLandingAttempt: Boolean;
    function GetLandingSuccess: Boolean;
    function GetLandingType: string;
    function GetLegs: Boolean;
    function GetReused: Boolean;

    procedure SetCoreId(AValue: string);
    procedure SetCoreId(AValue: Variant);
    procedure SetFlight(AValue: LongWord);
    procedure SetFlight(AValue: Variant);
    procedure SetGridfins(AValue: Boolean);
    procedure SetGridfins(AValue: Variant);
    procedure SetLandpadId(AValue: string);
    procedure SetLandpadId(AValue: Variant);
    procedure SetLandingAttempt(AValue: Boolean);
    procedure SetLandingAttempt(AValue: Variant);
    procedure SetLandingSuccess(AValue: Boolean);
    procedure SetLandingSuccess(AValue: Variant);
    procedure SetLandingType(AValue: string);
    procedure SetLandingType(AValue: Variant);
    procedure SetLegs(AValue: Boolean);
    procedure SetLegs(AValue: Variant);
    procedure SetReused(AValue: Boolean);
    procedure SetReused(AValue: Variant);
  public
    function ToString: string; override;
  published
    property core: Variant write SetCoreId;
    property flight: Variant write SetFlight;
    property gridfins: Variant write SetGridfins;
    property landpad: Variant write SetLandpadId;
    property landing_attempt: Variant write SetLandingAttempt;
    property landing_success: Variant write SetLandingSuccess;
    property landing_type: Variant write SetLandingType;
    property legs: Variant write SetLegs;
    property reused: Variant write SetReused;
  end;

  { TLaunchCoreList }

  TLaunchCoreList = class(TBaseModelList, ILaunchCoreList)
    function NewItem: IBaseModel; override;
  end;

function NewLaunchCore: ILaunchCore;
begin
  Result := TLaunchCore.Create;
end;

function NewLaunchCoreList: ILaunchCoreList;
begin
  Result := TLaunchCoreList.Create;
end;

{ TLaunchCoreList }

function TLaunchCoreList.NewItem: IBaseModel;
begin
  Result := NewLaunchCore;
end;

{ TLaunchCore }

function TLaunchCore.GetCoreId: string;
begin
  Result := FCoreId;
end;

function TLaunchCore.GetFlight: LongWord;
begin
  Result := FFlight;;
end;

function TLaunchCore.GetGridfins: Boolean;
begin
  Result := FGridfins;
end;

function TLaunchCore.GetLandpadId: string;
begin
  Result := FLandpadId;
end;

function TLaunchCore.GetLandingAttempt: Boolean;
begin
  Result := FLandingAttempt;
end;

function TLaunchCore.GetLandingSuccess: Boolean;
begin
  Result := FLandingSuccess;
end;

function TLaunchCore.GetLandingType: string;
begin
  Result := FLandingType;
end;

function TLaunchCore.GetLegs: Boolean;
begin
  Result := FLegs;
end;

function TLaunchCore.GetReused: Boolean;
begin
  Result := FReused;
end;

procedure TLaunchCore.SetCoreId(AValue: string);
begin
  FCoreId := AValue;
end;

procedure TLaunchCore.SetCoreId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FCoreId := '';
  end else if VarIsStr(AValue) then
    FCoreId := AValue;
end;

procedure TLaunchCore.SetFlight(AValue: LongWord);
begin
  FFlight := AValue;
end;

procedure TLaunchCore.SetFlight(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FFlight := -0;
  end else if VarIsNumeric(AValue) then
    FFlight := AValue;
end;

procedure TLaunchCore.SetGridfins(AValue: Boolean);
begin
  FGridfins := AValue;
end;

procedure TLaunchCore.SetGridfins(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FGridfins := False;
  end else if VarIsBool(AValue) then
    FGridfins := AValue;
end;

procedure TLaunchCore.SetLandpadId(AValue: string);
begin
  FLandpadId := AValue;
end;

procedure TLaunchCore.SetLandpadId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLandpadId := '';
  end else if VarIsStr(AValue) then
    FLandpadId := AValue;
end;

procedure TLaunchCore.SetLandingAttempt(AValue: Boolean);
begin
  FLandingAttempt := AValue;
end;

procedure TLaunchCore.SetLandingAttempt(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLandingAttempt := False;
  end else if VarIsBool(AValue) then
    FLandingAttempt := AValue;
end;

procedure TLaunchCore.SetLandingSuccess(AValue: Boolean);
begin
  FLandingSuccess := AValue;
end;

procedure TLaunchCore.SetLandingSuccess(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLandingSuccess := False;
  end else if VarIsBool(AValue) then
    FLandingSuccess := AValue;
end;

procedure TLaunchCore.SetLandingType(AValue: string);
begin
  FLandingType := AValue;
end;

procedure TLaunchCore.SetLandingType(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLandingType := '';
  end else if VarIsStr(AValue) then
    FLandingType := AValue;
end;

procedure TLaunchCore.SetLegs(AValue: Boolean);
begin
  FLegs := AValue;
end;

procedure TLaunchCore.SetLegs(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLegs := False;
  end else if VarIsBool(AValue) then
    FLegs := AValue;
end;

procedure TLaunchCore.SetReused(AValue: Boolean);
begin
  FReused := AValue;
end;

procedure TLaunchCore.SetReused(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FReused := False;
  end else if VarIsBool(AValue) then
    FReused := AValue;
end;

function TLaunchCore.ToString: string;
begin
  Result := Format(''
    + 'Core ID: %s' + LineEnding
    + 'Flight: %u' + LineEnding
    + 'Gridfins: %s' + LineEnding
    + 'Landpad ID: %s' + LineEnding
    + 'Landing Attempt: %s' + LineEnding
    + 'Landing Success: %s' + LineEnding
    + 'Landing Type: %s' + LineEnding
    + 'Legs: %s' + LineEnding
    + 'Reused: %s'
    , [
      GetCoreId,
      GetFlight,
      BoolToStr(GetGridfins, True),
      GetLandpadId,
      BoolToStr(GetLandingAttempt, True),
      BoolToStr(GetLandingSuccess, True),
      GetLandingType,
      BoolToStr(GetLegs, True),
      BoolToStr(GetReused, True)
    ]);
end;

end.

