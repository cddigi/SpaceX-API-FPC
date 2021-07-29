unit DragonThrusters;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ThrustInfo;

type

  IBaseDragonThrusters = interface(IInterface) ['{77C1FFE5-83C7-4B8C-BA7C-3D64DA101936}']
    function GetAmount: LongWord;
    function GetFirstFuel: string;
    function GetIsp: LongWord;
    function GetPods: LongWord;
    function GetSecondFuel: string;
    function GetThrust: IThrustInfo;
    function GetTypeInfo: string;

    procedure SetAmount(AValue: LongWord);
    procedure SetFirstFuel(AValue: string);
    procedure SetIsp(AValue: LongWord);
    procedure SetPods(AValue: LongWord);
    procedure SetSecondFuel(AValue: string);
    procedure SetThrust(AValue: IThrustInfo);
    procedure SetTypeInfo(AValue: string);
  end;

  IDragonThrusters = interface(IBaseDragonThrusters) ['{96512664-E828-4412-89E5-C43B275F251B}']
    property Amount: LongWord read GetAmount write SetAmount;
    property FirstFuel: string read GetFirstFuel write SetFirstFuel;
    property Isp: LongWord read GetIsp write SetIsp;
    property Pods: LongWord read GetPods write SetPods;
    property SecondFuel: string read GetSecondFuel write SetSecondFuel;
    property Thrust: IThrustInfo read GetThrust write SetThrust;
    property TypeInfo: string read GetTypeInfo write SetTypeInfo;
  end;

  IDragonThrustersList = interface(IInterfaceList) ['{4DF29C16-B7C0-4C44-859C-A74FAA267F0A}']
  end;

function NewDragonThrusters: IDragonThrusters;

implementation

type

  { TDragonThrusters }

  TDragonThrusters = class(TInterfacedObject, IDragonThrusters)
  private
    FAmount: LongWord;
    FFirstFuel: string;
    FIsp: LongWord;
    FPods: LongWord;
    FSecondFuel: string;
    FThrust: IThrustInfo;
    FTypeInfo: string;
    function GetAmount: LongWord;
    function GetFirstFuel: string;
    function GetIsp: LongWord;
    function GetPods: LongWord;
    function GetSecondFuel: string;
    function GetThrust: IThrustInfo;
    function GetTypeInfo: string;

    procedure SetAmount(AValue: LongWord);
    procedure SetFirstFuel(AValue: string);
    procedure SetIsp(AValue: LongWord);
    procedure SetPods(AValue: LongWord);
    procedure SetSecondFuel(AValue: string);
    procedure SetThrust(AValue: IThrustInfo);
    procedure SetTypeInfo(AValue: string);
  end;

  TDragonThrustersList = class(TInterfaceList, IDragonThrustersList);

function NewDragonThrusters: IDragonThrusters;
begin
  Result := TDragonThrusters.Create;
end;

{ TDragonThrusters }

function TDragonThrusters.GetAmount: LongWord;
begin
  Result := FAmount;
end;

function TDragonThrusters.GetFirstFuel: string;
begin
  Result := FFirstFuel;
end;

function TDragonThrusters.GetIsp: LongWord;
begin
  Result := FIsp;
end;

function TDragonThrusters.GetPods: LongWord;
begin
  Result := FPods;
end;

function TDragonThrusters.GetSecondFuel: string;
begin
  Result := FSecondFuel;
end;

function TDragonThrusters.GetThrust: IThrustInfo;
begin
  Result := FThrust;
end;

function TDragonThrusters.GetTypeInfo: string;
begin
  Result := FTypeInfo;
end;

procedure TDragonThrusters.SetAmount(AValue: LongWord);
begin
  FAmount := AValue;
end;

procedure TDragonThrusters.SetFirstFuel(AValue: string);
begin
  FFirstFuel := AValue;
end;

procedure TDragonThrusters.SetIsp(AValue: LongWord);
begin
  FIsp := AValue;
end;

procedure TDragonThrusters.SetPods(AValue: LongWord);
begin
  FPods := AValue;
end;

procedure TDragonThrusters.SetSecondFuel(AValue: string);
begin
  FSecondFuel := AValue;
end;

procedure TDragonThrusters.SetThrust(AValue: IThrustInfo);
begin
  FThrust := AValue;
end;

procedure TDragonThrusters.SetTypeInfo(AValue: string);
begin
  FTypeInfo := AValue;
end;

end.

