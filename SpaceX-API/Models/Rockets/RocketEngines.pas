unit RocketEngines;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IspInfo, ThrustInfo;

type

  IBaseRocketEngines = interface(IInterface) ['{BF229EB5-97AB-4ADE-867E-FB9C1C84ADAE}']
    function GetEngineLossMax: LongWord;
    function GetFirstPropellant: string;
    function GetIsp: IIspInfo;
    function GetLayout: string;
    function GetNumber: LongWord;
    function GetSecondPropellant: string;
    function GetThrustSeaLevel: IThrustInfo;
    function GetThrustToWeight: Double;
    function GetThrustVacuum: IThrustInfo;
    function GetTypeInfo: string;
    function GetVersion: string;

    procedure SetEngineLossMax(AValue: LongWord);
    procedure SetFirstPropellant(AValue: string);
    procedure SetIsp(AValue: IIspInfo);
    procedure SetLayout(AValue: string);
    procedure SetNumber(AValue: LongWord);
    procedure SetSecondPropellant(AValue: string);
    procedure SetThrustSeaLevel(AValue: IThrustInfo);
    procedure SetThrustToWeight(AValue: Double);
    procedure SetThrustVacuum(AValue: IThrustInfo);
    procedure SetTypeInfo(AValue: string);
    procedure SetVersion(AValue: string);
  end;

  IRocketEngines = interface(IBaseRocketEngines) ['{940C7509-A93E-468A-A405-6B10921D22A0}']
    property EngineLossMax: LongWord read GetEngineLossMax write SetEngineLossMax;
    property FirstPropellant: string read GetFirstPropellant write SetFirstPropellant;
    property Isp: IIspInfo read GetIsp write SetIsp;
    property Layout: string read GetLayout write SetLayout;
    property Number: LongWord read GetNumber write SetNumber;
    property SecondPropellant: string read GetSecondPropellant write SetSecondPropellant;
    property ThrustSeaLevel: IThrustInfo read GetThrustSeaLevel write SetThrustSeaLevel;
    property ThrustToWeight: Double read GetThrustToWeight write SetThrustToWeight;
    property ThrustVacuum: IThrustInfo read GetThrustVacuum write SetThrustVacuum;
    property TypeInfo: string read GetTypeInfo write SetTypeInfo;
    property Version: string read GetVersion write SetVersion;
  end;

function NewRocketEngines: IRocketEngines;

implementation

type

  { TRocketEngines }

  TRocketEngines = class(TInterfacedObject, IRocketEngines)
  private
    FEngineLossMax: LongWord;
    FFirstPropellant: string;
    FIsp: IIspInfo;
    FLayout: string;
    FNumber: LongWord;
    FSecondPropellant: string;
    FThrustSeaLevel: IThrustInfo;
    FThrustToWeight: Double;
    FThrustVacuum: IThrustInfo;
    FTypeInfo: string;
    FVersion: string;
    function GetEngineLossMax: LongWord;
    function GetFirstPropellant: string;
    function GetIsp: IIspInfo;
    function GetLayout: string;
    function GetNumber: LongWord;
    function GetSecondPropellant: string;
    function GetThrustSeaLevel: IThrustInfo;
    function GetThrustToWeight: Double;
    function GetThrustVacuum: IThrustInfo;
    function GetTypeInfo: string;
    function GetVersion: string;

    procedure SetEngineLossMax(AValue: LongWord);
    procedure SetFirstPropellant(AValue: string);
    procedure SetIsp(AValue: IIspInfo);
    procedure SetLayout(AValue: string);
    procedure SetNumber(AValue: LongWord);
    procedure SetSecondPropellant(AValue: string);
    procedure SetThrustSeaLevel(AValue: IThrustInfo);
    procedure SetThrustToWeight(AValue: Double);
    procedure SetThrustVacuum(AValue: IThrustInfo);
    procedure SetTypeInfo(AValue: string);
    procedure SetVersion(AValue: string);
  end;

function NewRocketEngines: IRocketEngines;
begin
  Result := TRocketEngines.Create;
end;

{ TRocketEngines }

function TRocketEngines.GetEngineLossMax: LongWord;
begin
  Result := FEngineLossMax;
end;

function TRocketEngines.GetFirstPropellant: string;
begin
  Result := FFirstPropellant;
end;

function TRocketEngines.GetIsp: IIspInfo;
begin
  Result := FIsp;
end;

function TRocketEngines.GetLayout: string;
begin
  Result := FLayout;
end;

function TRocketEngines.GetNumber: LongWord;
begin
  Result := FNumber;
end;

function TRocketEngines.GetSecondPropellant: string;
begin
  Result := FSecondPropellant;
end;

function TRocketEngines.GetThrustSeaLevel: IThrustInfo;
begin
  Result := FThrustSeaLevel;
end;

function TRocketEngines.GetThrustToWeight: Double;
begin
  Result := FThrustToWeight;
end;

function TRocketEngines.GetThrustVacuum: IThrustInfo;
begin
  Result := FThrustVacuum;
end;

function TRocketEngines.GetTypeInfo: string;
begin
  Result := FTypeInfo;
end;

function TRocketEngines.GetVersion: string;
begin
  Result := FVersion;
end;

procedure TRocketEngines.SetEngineLossMax(AValue: LongWord);
begin
  FEngineLossMax := AValue;
end;

procedure TRocketEngines.SetFirstPropellant(AValue: string);
begin
  FFirstPropellant := AValue;
end;

procedure TRocketEngines.SetIsp(AValue: IIspInfo);
begin
  FIsp := AValue;
end;

procedure TRocketEngines.SetLayout(AValue: string);
begin
  FLayout := AValue;
end;

procedure TRocketEngines.SetNumber(AValue: LongWord);
begin
  FNumber := AValue;
end;

procedure TRocketEngines.SetSecondPropellant(AValue: string);
begin
  FSecondPropellant := AValue;
end;

procedure TRocketEngines.SetThrustSeaLevel(AValue: IThrustInfo);
begin
  FThrustSeaLevel := AValue;
end;

procedure TRocketEngines.SetThrustToWeight(AValue: Double);
begin
  FThrustToWeight := AValue;
end;

procedure TRocketEngines.SetThrustVacuum(AValue: IThrustInfo);
begin
  FThrustVacuum := AValue;
end;

procedure TRocketEngines.SetTypeInfo(AValue: string);
begin
  FTypeInfo := AValue;
end;

procedure TRocketEngines.SetVersion(AValue: string);
begin
  FVersion := AValue;
end;

end.

