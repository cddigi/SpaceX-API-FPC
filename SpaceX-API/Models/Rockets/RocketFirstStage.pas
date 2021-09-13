unit RocketFirstStage;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ThrustInfo;

type

  IBaseRocketFirstStage = interface(IInterface) ['{3FC10254-BC67-4C3C-95A4-05AEAD6F79AB}']
    function GetBurnTimeSeconds: LongWord;
    function GetEngines: LongWord;
    function GetFuelAmountTons: LongWord;
    function GetReusable: Boolean;
    function GetThrustSeaLevel: IThrustInfo;
    function GetThrustVacuum: IThrustInfo;

    procedure SetBurnTimeSeconds(AValue: LongWord);
    procedure SetEngines(AValue: LongWord);
    procedure SetFuelAmountTons(AValue: LongWord);
    procedure SetReusable(AValue: Boolean);
    procedure SetThrustSeaLevel(AValue: IThrustInfo);
    procedure SetThrustVacuum(AValue: IThrustInfo);
  end;

  IRocketFirstStage = interface(IBaseRocketFirstStage) ['{C968F9BB-D955-4AD0-8722-5B83A8A8FBB1}']
    property BurnTimeSeconds: LongWord read GetBurnTimeSeconds write SetBurnTimeSeconds;
    property Engines: LongWord read GetEngines write SetEngines;
    property FuelAmountTons: LongWord read GetFuelAmountTons write SetFuelAmountTons;
    property Reusable: Boolean read GetReusable write SetReusable;
    property ThrustSeaLevel: IThrustInfo read GetThrustSeaLevel write SetThrustSeaLevel;
    property ThrustVacuum: IThrustInfo read GetThrustVacuum write SetThrustVacuum;
  end;

function NewRocketFirstStage: IRocketFirstStage;

implementation

type

  { TRocketFirstStage }

  TRocketFirstStage = class(TInterfacedObject, IRocketFirstStage)
  private
    FBurnTimeSeconds: LongWord;
    FEngines: LongWord;
    FFuelAmountTons: LongWord;
    FReusable: Boolean;
    FThrustSeaLevel: IThrustInfo;
    FThrustVacuum: IThrustInfo;
  private
    function GetBurnTimeSeconds: LongWord;
    function GetEngines: LongWord;
    function GetFuelAmountTons: LongWord;
    function GetReusable: Boolean;
    function GetThrustSeaLevel: IThrustInfo;
    function GetThrustVacuum: IThrustInfo;
  private
    procedure SetBurnTimeSeconds(AValue: LongWord);
    procedure SetEngines(AValue: LongWord);
    procedure SetFuelAmountTons(AValue: LongWord);
    procedure SetReusable(AValue: Boolean);
    procedure SetThrustSeaLevel(AValue: IThrustInfo);
    procedure SetThrustVacuum(AValue: IThrustInfo);
  published
    property burn_time_sec: LongWord read GetBurnTimeSeconds write SetBurnTimeSeconds;
    property engines: LongWord read GetEngines write SetEngines;
    property fuel_amount_tons: LongWord read GetFuelAmountTons write SetFuelAmountTons;
    property reusable: Boolean read GetReusable write SetReusable;
    //property ThrustSeaLevel: IThrustInfo read GetThrustSeaLevel write SetThrustSeaLevel;
    //property ThrustVacuum: IThrustInfo read GetThrustVacuum write SetThrustVacuum;
  end;

function NewRocketFirstStage: IRocketFirstStage;
begin
  Result := TRocketFirstStage.Create;
end;

{ TRocketFirstStage }

function TRocketFirstStage.GetBurnTimeSeconds: LongWord;
begin
  Result := FBurnTimeSeconds;
end;

function TRocketFirstStage.GetEngines: LongWord;
begin
  Result := FEngines;
end;

function TRocketFirstStage.GetFuelAmountTons: LongWord;
begin
  Result := FFuelAmountTons;
end;

function TRocketFirstStage.GetReusable: Boolean;
begin
  Result := FReusable;
end;

function TRocketFirstStage.GetThrustSeaLevel: IThrustInfo;
begin
  Result := FThrustSeaLevel;
end;

function TRocketFirstStage.GetThrustVacuum: IThrustInfo;
begin
  Result := FThrustVacuum;
end;

procedure TRocketFirstStage.SetBurnTimeSeconds(AValue: LongWord);
begin
  FBurnTimeSeconds := AValue;
end;

procedure TRocketFirstStage.SetEngines(AValue: LongWord);
begin
  FEngines := AValue;
end;

procedure TRocketFirstStage.SetFuelAmountTons(AValue: LongWord);
begin
  FFuelAmountTons := AValue;
end;

procedure TRocketFirstStage.SetReusable(AValue: Boolean);
begin
  FReusable := AValue;
end;

procedure TRocketFirstStage.SetThrustSeaLevel(AValue: IThrustInfo);
begin
  FThrustSeaLevel := AValue;
end;

procedure TRocketFirstStage.SetThrustVacuum(AValue: IThrustInfo);
begin
  FThrustVacuum := AValue;
end;

end.

