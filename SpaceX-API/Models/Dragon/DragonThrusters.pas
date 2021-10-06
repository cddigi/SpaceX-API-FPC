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

  { TDragonThrustersEnumerator }

  TDragonThrustersEnumerator = class(TBaseModelEnumerator)
    function GetCurrent: IDragonThrusters;
    property Current : IDragonThrusters read GetCurrent;
  end;

function NewDragonThrusters: IDragonThrusters;
function NewDragonThrustersList: IDragonThrustersList;
operator enumerator(AList: IDragonThrustersList): TDragonThrustersEnumerator;

implementation

uses
  JSON_Helper, Variants;

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
    procedure SetAmount(AValue: Variant);
    procedure SetFirstFuel(AValue: string);
    procedure SetFirstFuel(AValue: Variant);
    procedure SetIsp(AValue: LongWord);
    procedure SetIsp(AValue: Variant);
    procedure SetPods(AValue: LongWord);
    procedure SetPods(AValue: Variant);
    procedure SetSecondFuel(AValue: string);
    procedure SetSecondFuel(AValue: Variant);
    procedure SetThrust(AValue: IThrustInfo);
    procedure SetTypeInfo(AValue: string);
    procedure SetTypeInfo(AValue: Variant);
  public
    procedure BuildSubObjects(const JSONData: IJSONData); override;
    function ToString: string; override;
  published
    property amount: Variant write SetAmount;
    property fuel_1: Variant write SetFirstFuel;
    property isp: Variant write SetIsp;
    property pods: Variant write SetPods;
    property fuel_2: Variant write SetSecondFuel;
    property type_info: Variant write SetTypeInfo;
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

operator enumerator(AList: IDragonThrustersList): TDragonThrustersEnumerator;
begin
  Result := TDragonThrustersEnumerator.Create;
  Result.FList := AList;
end;

{ TDragonThrustersEnumerator }

function TDragonThrustersEnumerator.GetCurrent: IDragonThrusters;
begin
  Result := FCurrent as IDragonThrusters;
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

procedure TDragonThrusters.SetAmount(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FAmount := -0;
  end else if VarIsNumeric(AValue) then
    FAmount := AValue;
end;

procedure TDragonThrusters.SetFirstFuel(AValue: string);
begin
  FFirstFuel := AValue;
end;

procedure TDragonThrusters.SetFirstFuel(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FFirstFuel := '';
  end else if VarIsStr(AValue) then
    FFirstFuel := AValue;
end;

procedure TDragonThrusters.SetIsp(AValue: LongWord);
begin
  FIsp := AValue;
end;

procedure TDragonThrusters.SetIsp(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FIsp := -0;
  end else if VarIsNumeric(AValue) then
    FIsp := AValue;
end;

procedure TDragonThrusters.SetPods(AValue: LongWord);
begin
  FPods := AValue;
end;

procedure TDragonThrusters.SetPods(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FPods := -0;
  end else if VarIsNumeric(AValue) then
    FPods := AValue;
end;

procedure TDragonThrusters.SetSecondFuel(AValue: string);
begin
  FSecondFuel := AValue;
end;

procedure TDragonThrusters.SetSecondFuel(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FSecondFuel := '';
  end else if VarIsStr(AValue) then
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

procedure TDragonThrusters.SetTypeInfo(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FTypeInfo := '';
  end else if VarIsStr(AValue) then
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

  SetTypeInfo(JSONData.GetPath('type').GetJSONData);
end;

function TDragonThrusters.ToString: string;
begin
  Result := Format(''
    + 'Amount: %u' + LineEnding
    + 'First Fuel: %s' + LineEnding
    + 'Isp: %u' + LineEnding
    + 'Pods: %u' + LineEnding
    + 'Second Fuel: %s' + LineEnding
    + 'Thrust: %s' + LineEnding
    + 'Type: %s'
    , [
      GetAmount,
      GetFirstFuel,
      GetIsp,
      GetPods,
      GetSecondFuel,
      GetThrust.ToString,
      GetTypeInfo
    ]);
end;

end.

