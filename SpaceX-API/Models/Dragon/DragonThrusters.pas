unit DragonThrusters;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ThrustInfo, BaseModel;

type

  IBaseDragonThrusters = interface(IBaseModel) ['{77C1FFE5-83C7-4B8C-BA7C-3D64DA101936}']
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

  IDragonThrustersList = interface(IBaseModelList) ['{4DF29C16-B7C0-4C44-859C-A74FAA267F0A}']
  end;

function NewDragonThrusters: IDragonThrusters;
function NewDragonThrustersList: IDragonThrustersList;

implementation

uses
  JSON_Helper;

type

  { TDragonThrusters }

  TDragonThrusters = class(TBaseModel, IDragonThrusters)
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
  public
    procedure BuildSubObjects(const JSONData: IJSONData); override;
  published
    property amount: LongWord read GetAmount write SetAmount;
    property fuel_1: string read GetFirstFuel write SetFirstFuel;
    property isp: LongWord read GetIsp write SetIsp;
    property pods: LongWord read GetPods write SetPods;
    property fuel_2: string read GetSecondFuel write SetSecondFuel;
    property type_info: string read GetTypeInfo write SetTypeInfo;
  end;

  { TDragonThrustersList }

  TDragonThrustersList = class(TBaseModelList, IDragonThrustersList)
    function NewItem: IBaseModel; override;
  end;

function NewDragonThrusters: IDragonThrusters;
begin
  Result := TDragonThrusters.Create;
end;

function NewDragonThrustersList: IDragonThrustersList;
begin
  Result := TDragonThrustersList.Create;
end;

{ TDragonThrustersList }

function TDragonThrustersList.NewItem: IBaseModel;
begin
  Result := NewDragonThrusters;
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

procedure TDragonThrusters.BuildSubObjects(const JSONData: IJSONData);
var
  SubJSONData: IJSONData;
  Thrust: IThrustInfo;
begin
  inherited BuildSubObjects(JSONData);

  SubJSONData := JSONData.GetPath('thrust');
  Thrust := NewThrustInfo;
  JSONToModel(SubJSONData.GetJSONData, Thrust);
  Self.FThrust := Thrust;
end;

end.

