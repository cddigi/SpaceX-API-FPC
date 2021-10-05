unit RocketFirstStage;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ThrustInfo, BaseModel;

type

  IBaseRocketFirstStage = interface(IBaseModel) ['{3FC10254-BC67-4C3C-95A4-05AEAD6F79AB}']
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

uses
  JSON_Helper, Variants;

type

  { TRocketFirstStage }

  TRocketFirstStage = class(TBaseModel, IRocketFirstStage)
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
    procedure SetBurnTimeSeconds(AValue: Variant);
    procedure SetEngines(AValue: LongWord);
    procedure SetEngines(AValue: Variant);
    procedure SetFuelAmountTons(AValue: LongWord);
    procedure SetFuelAmountTons(AValue: Variant);
    procedure SetReusable(AValue: Boolean);
    procedure SetReusable(AValue: Variant);
    procedure SetThrustSeaLevel(AValue: IThrustInfo);
    procedure SetThrustVacuum(AValue: IThrustInfo);
  public
    function ToString: string; override;
    procedure BuildSubObjects(const JSONData: IJSONData); override;
  published
    property burn_time_sec: Variant write SetBurnTimeSeconds;
    property engines: Variant write SetEngines;
    property fuel_amount_tons: Variant write SetFuelAmountTons;
    property reusable: Variant write SetReusable;
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

procedure TRocketFirstStage.SetBurnTimeSeconds(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := -1;
  FBurnTimeSeconds := AValue;
end;

procedure TRocketFirstStage.SetEngines(AValue: LongWord);
begin
  FEngines := AValue;
end;

procedure TRocketFirstStage.SetEngines(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FEngines := -0;
  end else if VarIsNumeric(AValue) then
    FEngines := AValue;
end;

procedure TRocketFirstStage.SetFuelAmountTons(AValue: LongWord);
begin
  FFuelAmountTons := AValue;
end;

procedure TRocketFirstStage.SetFuelAmountTons(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FFuelAmountTons := -0;
  end else if VarIsNumeric(AValue) then
    FFuelAmountTons := AValue;
end;

procedure TRocketFirstStage.SetReusable(AValue: Boolean);
begin
  FReusable := AValue;
end;

procedure TRocketFirstStage.SetReusable(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FReusable := False;
  end else if VarIsBool(AValue) then
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

function TRocketFirstStage.ToString: string;
begin
  Result := Format(''
    + 'Burn Time Seconds: %u' + LineEnding
    + 'Engines: %u' + LineEnding
    + 'Fuel Amount Tons: %u' + LineEnding
    + 'Reusable: %s' + LineEnding
    + 'Thrust Sea Level: %s' + LineEnding
    + 'Thrust Vacuum: %s'
    , [
      GetBurnTimeSeconds,
      GetEngines,
      GetFuelAmountTons,
      BoolToStr(GetReusable),
      GetThrustSeaLevel.ToString,
      GetThrustVacuum.ToString
    ]);
end;

procedure TRocketFirstStage.BuildSubObjects(const JSONData: IJSONData);
var
  SubJSONData: IJSONData;
  ThrustSealLevel, ThrustVacuum: IThrustInfo;
begin
  inherited BuildSubObjects(JSONData);

  SubJSONData := JSONData.GetPath('thrust_sea_level');
  ThrustSealLevel := NewThrustInfo;
  JSONToModel(SubJSONData.GetJSONData, ThrustSealLevel);
  Self.FThrustSeaLevel := ThrustSealLevel;

  SubJSONData := JSONData.GetPath('thrust_vacuum');
  ThrustVacuum := NewThrustInfo;
  JSONToModel(SubJSONData.GetJSONData, ThrustVacuum);
end;

end.

