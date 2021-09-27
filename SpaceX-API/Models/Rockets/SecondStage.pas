unit SecondStage;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, RocketPotentialPayload, BaseModel;

type

  IBaseSecondStage = interface(IBaseModel) ['{8954442C-5B2C-4F67-A1CF-526A27A11B6A}']
    function GetBurnTimeSeconds: LongWord;
    function GetEngines: LongWord;
    function GetFuelAmountTons: LongWord;
    function GetPayloads: IRocketPotentialPayload;
    function GetReusable: Boolean;

    procedure SetBurnTimeSeconds(AValue: LongWord);
    procedure SetEngines(AValue: LongWord);
    procedure SetFuelAmountTons(AValue: LongWord);
    procedure SetPayloads(AValue: IRocketPotentialPayload);
    procedure SetReusable(AValue: Boolean);
  end;

  ISecondStage = interface(IBaseSecondStage) ['{D37531D9-AB61-4C71-BE1F-BBFD15641BC6}']
    property BurnTimeSeconds: LongWord read GetBurnTimeSeconds write SetBurnTimeSeconds;
    property Engines: LongWord read GetEngines write SetEngines;
    property FuelAmountTons: LongWord read GetFuelAmountTons write SetFuelAmountTons;
    property Payloads: IRocketPotentialPayload read GetPayloads write SetPayloads;
    property Reusable: Boolean read GetReusable write SetReusable;
  end;

function NewSecondStage: ISecondStage;

implementation

uses
  JSON_Helper, Variants;

type

  { TSecondStage }

  TSecondStage = class(TBaseModel, ISecondStage)
  private
    FBurnTimeSeconds: LongWord;
    FEngines: LongWord;
    FFuelAmountTons: LongWord;
    FPayloads: IRocketPotentialPayload;
    FReusable: Boolean;
  private
    function GetBurnTimeSeconds: LongWord;
    function GetEngines: LongWord;
    function GetFuelAmountTons: LongWord;
    function GetPayloads: IRocketPotentialPayload;
    function GetReusable: Boolean;
  private
    procedure SetBurnTimeSeconds(AValue: LongWord);
    procedure SetBurnTimeSeconds(AValue: Variant);
    procedure SetEngines(AValue: LongWord);
    procedure SetEngines(AValue: Variant);
    procedure SetFuelAmountTons(AValue: LongWord);
    procedure SetFuelAmountTons(AValue: Variant);
    procedure SetPayloads(AValue: IRocketPotentialPayload);
    procedure SetReusable(AValue: Boolean);
    procedure SetReusable(AValue: Variant);
  public
    procedure BuildSubObjects(const JSONData: IJSONData); override;
  published
    property burn_time_sec: Variant write SetBurnTimeSeconds;
    property engines: Variant write SetEngines;
    property fuel_amount_tons: Variant write SetFuelAmountTons;
    property reusable: Variant write SetReusable;
  end;

function NewSecondStage: ISecondStage;
begin
  Result := TSecondStage.Create;
end;

{ TSecondStage }

function TSecondStage.GetBurnTimeSeconds: LongWord;
begin
  Result := FBurnTimeSeconds;
end;

function TSecondStage.GetEngines: LongWord;
begin
  Result := FEngines;
end;

function TSecondStage.GetFuelAmountTons: LongWord;
begin
  Result := FFuelAmountTons;
end;

function TSecondStage.GetPayloads: IRocketPotentialPayload;
begin
  Result := FPayloads;
end;

function TSecondStage.GetReusable: Boolean;
begin
  Result := FReusable;
end;

procedure TSecondStage.SetBurnTimeSeconds(AValue: LongWord);
begin
  FBurnTimeSeconds := AValue;
end;

procedure TSecondStage.SetBurnTimeSeconds(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := -1;
  FBurnTimeSeconds := AValue;
end;

procedure TSecondStage.SetEngines(AValue: LongWord);
begin
  FEngines := AValue;
end;

procedure TSecondStage.SetEngines(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FEngines := -0;
  end else if VarIsNumeric(AValue) then
    FEngines := AValue;
end;

procedure TSecondStage.SetFuelAmountTons(AValue: LongWord);
begin
  FFuelAmountTons := AValue;
end;

procedure TSecondStage.SetFuelAmountTons(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FFuelAmountTons := -0;
  end else if VarIsNumeric(AValue) then
    FFuelAmountTons := AValue;
end;

procedure TSecondStage.SetPayloads(AValue: IRocketPotentialPayload);
begin
  FPayloads := AValue;
end;

procedure TSecondStage.SetReusable(AValue: Boolean);
begin
  FReusable := AValue;
end;

procedure TSecondStage.SetReusable(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FReusable := False;
  end else if VarIsBool(AValue) then
    FReusable := AValue;
end;

procedure TSecondStage.BuildSubObjects(const JSONData: IJSONData);
var
  SubJSONData: IJSONData;
  Payloads: IRocketPotentialPayload;
begin
  inherited BuildSubObjects(JSONData);

  SubJSONData := JSONData.GetPath('payloads');
  Payloads := NewRocketPotentialPayload;
  JSONToModel(SubJSONData.GetJSONData, Payloads);
  Self.FPayloads := Payloads;
end;

end.

