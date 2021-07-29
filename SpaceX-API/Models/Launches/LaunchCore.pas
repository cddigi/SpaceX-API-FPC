unit LaunchCore;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseLaunchCore = interface(IInterface) ['{1D2DD805-56DB-497A-AE09-3343F8CA642B}']
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

  ILaunchCoreList = interface(IInterfaceList) ['{4AB8C91D-8187-4E66-AD76-BA8CC002F10C}']

  end;

function NewLaunchCore: ILaunchCore;
function NewLaunchCoreList: ILaunchCoreList;

implementation

type

  { TLaunchCore }

  TLaunchCore = class(TInterfacedObject, ILaunchCore)
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
    procedure SetFlight(AValue: LongWord);
    procedure SetGridfins(AValue: Boolean);
    procedure SetLandpadId(AValue: string);
    procedure SetLandingAttempt(AValue: Boolean);
    procedure SetLandingSuccess(AValue: Boolean);
    procedure SetLandingType(AValue: string);
    procedure SetLegs(AValue: Boolean);
    procedure SetReused(AValue: Boolean);
  end;

  TLaunchCoreList = class(TInterfaceList, ILaunchCoreList)
    { Implement methods here. }
  end;

function NewLaunchCore: ILaunchCore;
begin
  Result := TLaunchCore.Create;
end;

function NewLaunchCoreList: ILaunchCoreList;
begin
  Result := TLaunchCoreList.Create;
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

procedure TLaunchCore.SetFlight(AValue: LongWord);
begin
  FFlight := AValue;
end;

procedure TLaunchCore.SetGridfins(AValue: Boolean);
begin
  FGridfins := AValue;
end;

procedure TLaunchCore.SetLandpadId(AValue: string);
begin
  FLandpadId := AValue;
end;

procedure TLaunchCore.SetLandingAttempt(AValue: Boolean);
begin
  FLandingAttempt := AValue;
end;

procedure TLaunchCore.SetLandingSuccess(AValue: Boolean);
begin
  FLandingSuccess := AValue;
end;

procedure TLaunchCore.SetLandingType(AValue: string);
begin
  FLandingType := AValue;
end;

procedure TLaunchCore.SetLegs(AValue: Boolean);
begin
  FLegs := AValue;
end;

procedure TLaunchCore.SetReused(AValue: Boolean);
begin
  FReused := AValue;
end;

end.

