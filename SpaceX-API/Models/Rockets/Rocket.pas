unit Rocket;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SizeInfo, MassInfo, RocketEngines, RocketFirstStage, SecondStage, RocketLandingLegs,
  RocketPotentialPayloadWeight, BaseModel;

type

  IBaseRocket = interface(IBaseModel) ['{06F97F32-2431-4FDE-95C1-D3EF85A5F133}']
    function GetActive: Boolean;
    function GetBoosters: LongWord;
    function GetCompany: string;
    function GetCostPerLaunch: LongWord;
    function GetCountry: string;
    function GetDescription: string;
    function GetDiameter: ISizeInfo;
    function GetEngines: IRocketEngines;
    function GetFirstFlight: TDateTime;
    function GetFirstStage: IRocketFirstStage;
    function GetFlickrImages: TStringList;
    function GetHeight: ISizeInfo;
    function GetId: string;
    function GetLandingLegs: IRocketLandingLegs;
    function GetMass: IMassInfo;
    function GetName: string;
    function GetPayloadWeights: IRocketPotentialPayloadWeightList;
    function GetSecondStage: ISecondStage;
    function GetStages: LongWord;
    function GetSuccessRate: LongWord;
    function GetTypeInfo: string;
    function GetWikipedia: string;

    procedure SetActive(AValue: Boolean);
    procedure SetBoosters(AValue: LongWord);
    procedure SetCompany(AValue: string);
    procedure SetCostPerLaunch(AValue: LongWord);
    procedure SetCountry(AValue: string);
    procedure SetDescription(AValue: string);
    procedure SetDiameter(AValue: ISizeInfo);
    procedure SetEngines(AValue: IRocketEngines);
    procedure SetFirstFlight(AValue: TDateTime);
    procedure SetFirstStage(AValue: IRocketFirstStage);
    procedure SetFlickrImages(AValue: TStringList);
    procedure SetHeight(AValue: ISizeInfo);
    procedure SetId(AValue: string);
    procedure SetLandingLegs(AValue: IRocketLandingLegs);
    procedure SetMass(AValue: IMassInfo);
    procedure SetName(AValue: string);
    procedure SetPayloadWeights(AValue: IRocketPotentialPayloadWeightList);
    procedure SetSecondStage(AValue: ISecondStage);
    procedure SetStages(AValue: LongWord);
    procedure SetSuccessRate(AValue: LongWord);
    procedure SetTypeInfo(AValue: string);
    procedure SetWikipedia(AValue: string);
  end;

  IRocket = interface(IBaseRocket) ['{63AC2BDA-F8F5-4E2A-AB0D-2D1D939DBABF}']
    property Active: Boolean read GetActive write SetActive;
    property Boosters: LongWord read GetBoosters write SetBoosters;
    property Company: string read GetCompany write SetCompany;
    property CostPerLaunch: LongWord read GetCostPerLaunch write SetCostPerLaunch;
    property Country: string read GetCountry write SetCountry;
    property Description: string read GetDescription write SetDescription;
    property Diameter: ISizeInfo read GetDiameter write SetDiameter;
    property Engines: IRocketEngines read GetEngines write SetEngines;
    property FirstFlight: TDateTime read GetFirstFlight write SetFirstFlight;
    property FirstStage: IRocketFirstStage read GetFirstStage write SetFirstStage;
    property FlickrImages: TStringList read GetFlickrImages write SetFlickrImages;
    property Height: ISizeInfo read GetHeight write SetHeight;
    property Id: string read GetId write SetId;
    property LandingLegs: IRocketLandingLegs read GetLandingLegs write SetLandingLegs;
    property Mass: IMassInfo read GetMass write SetMass;
    property Name: string read GetName write SetName;
    property PayloadWeights: IRocketPotentialPayloadWeightList read GetPayloadWeights write SetPayloadWeights;
    property SecondStage: ISecondStage read GetSecondStage write SetSecondStage;
    property Stages: LongWord read GetStages write SetStages;
    property SuccessRate: LongWord read GetSuccessRate write SetSuccessRate;
    property TypeInfo: string read GetTypeInfo write SetTypeInfo;
    property Wikipedia: string read GetWikipedia write SetWikipedia;
  end;

  IRocketList = interface(IBaseModelList) ['{5417B83B-23A2-46A2-9AF8-13BDF9D8584A}']

  end;

  { TRocketEnumerator }

  TRocketEnumerator = class(TBaseModelEnumerator)
    function GetCurrent: IRocket;
    property Current : IRocket read GetCurrent;
  end;

function NewRocket: IRocket;
function NewRocketList: IRocketList;
operator enumerator(AList: IRocketList): TRocketEnumerator;

implementation

uses
  JSON_Helper, Variants;

type

  { TRocket }

  TRocket = class(TBaseModel, IRocket)
  private
    FActive: Boolean;
    FBoosters: LongWord;
    FCompany: string;
    FCostPerLaunch: LongWord;
    FCountry: string;
    FDescription: string;
    FDiameter: ISizeInfo;
    FEngines: IRocketEngines;
    FFirstFlight: TDateTime;
    FFirstStage: IRocketFirstStage;
    FFlickrImages: TStringList;
    FHeight: ISizeInfo;
    FId: string;
    FLandingLegs: IRocketLandingLegs;
    FMass: IMassInfo;
    FName: string;
    FPayloadWeights: IRocketPotentialPayloadWeightList;
    FSecondStage: ISecondStage;
    FStages: LongWord;
    FSuccessRate: LongWord;
    FTypeInfo: string;
    FWikipedia: string;
  private
    function GetActive: Boolean;
    function GetBoosters: LongWord;
    function GetCompany: string;
    function GetCostPerLaunch: LongWord;
    function GetCountry: string;
    function GetDescription: string;
    function GetDiameter: ISizeInfo;
    function GetEngines: IRocketEngines;
    function GetFirstFlight: TDateTime;
    function GetFirstStage: IRocketFirstStage;
    function GetFlickrImages: TStringList;
    function GetHeight: ISizeInfo;
    function GetId: string;
    function GetLandingLegs: IRocketLandingLegs;
    function GetMass: IMassInfo;
    function GetName: string;
    function GetPayloadWeights: IRocketPotentialPayloadWeightList;
    function GetSecondStage: ISecondStage;
    function GetStages: LongWord;
    function GetSuccessRate: LongWord;
    function GetTypeInfo: string;
    function GetWikipedia: string;
  private
    procedure SetActive(AValue: Boolean);
    procedure SetActive(AValue: Variant);
    procedure SetBoosters(AValue: LongWord);
    procedure SetBoosters(AValue: Variant);
    procedure SetCompany(AValue: string);
    procedure SetCompany(AValue: Variant);
    procedure SetCostPerLaunch(AValue: LongWord);
    procedure SetCostPerLaunch(AValue: Variant);
    procedure SetCountry(AValue: string);
    procedure SetCountry(AValue: Variant);
    procedure SetDescription(AValue: string);
    procedure SetDescription(AValue: Variant);
    procedure SetDiameter(AValue: ISizeInfo);
    procedure SetEngines(AValue: IRocketEngines);
    procedure SetFirstFlight(AValue: TDateTime);
    procedure SetFirstFlight(AValue: string);
    procedure SetFirstFlight(AValue: Variant);
    procedure SetFirstStage(AValue: IRocketFirstStage);
    procedure SetFlickrImages(AValue: TStringList);
    procedure SetHeight(AValue: ISizeInfo);
    procedure SetId(AValue: string);
    procedure SetId(AValue: Variant);
    procedure SetLandingLegs(AValue: IRocketLandingLegs);
    procedure SetMass(AValue: IMassInfo);
    procedure SetName(AValue: string);
    procedure SetName(AValue: Variant);
    procedure SetPayloadWeights(AValue: IRocketPotentialPayloadWeightList);
    procedure SetSecondStage(AValue: ISecondStage);
    procedure SetStages(AValue: LongWord);
    procedure SetStages(AValue: Variant);
    procedure SetSuccessRate(AValue: LongWord);
    procedure SetSuccessRate(AValue: Variant);
    procedure SetTypeInfo(AValue: string);
    procedure SetTypeInfo(AValue: Variant);
    procedure SetWikipedia(AValue: string);
    procedure SetWikipedia(AValue: Variant);
  public
    function ToString(): string; override;
  public
    procedure BuildSubObjects(const JSONData: IJSONData); override;
  public
    destructor Destroy; override;
  published
    property active: Variant write SetActive;
    property boosters: Variant write SetBoosters;
    property company: Variant write SetCompany;
    property cost_per_launch: Variant write SetCostPerLaunch;
    property country: Variant write SetCountry;
    property description: Variant write SetDescription;
    property first_flight: Variant write SetFirstFlight;
    //property flickr_images: TStringList read GetFlickrImages write SetFlickrImages;
    property id: Variant write SetId;
    property name: Variant write SetName;
    property stages: Variant write SetStages;
    property success_rate: Variant write SetSuccessRate;
    property wikipedia: Variant write SetWikipedia;
  end;

  { TRocketList }

  TRocketList = class(TBaseModelList, IRocketList)
    function NewItem: IBaseModel; override;
  end;

function NewRocket: IRocket;
begin
  Result := TRocket.Create;
  Result.FlickrImages := TStringList.Create;
end;

function NewRocketList: IRocketList;
begin
  Result := TRocketList.Create;
end;

operator enumerator(AList: IRocketList): TRocketEnumerator;
begin
  Result := TRocketEnumerator.Create;
  Result.FList := AList;
end;

{ TRocketEnumerator }

function TRocketEnumerator.GetCurrent: IRocket;
begin
  Result := FCurrent as IRocket;
end;

{ TRocketList }

function TRocketList.NewItem: IBaseModel;
begin
  Result := NewRocket;
end;

{ TRocket }

function TRocket.GetActive: Boolean;
begin
  Result := FActive;
end;

function TRocket.GetBoosters: LongWord;
begin
  Result := FBoosters;
end;

function TRocket.GetCompany: string;
begin
  Result := FCompany;
end;

function TRocket.GetCostPerLaunch: LongWord;
begin
  Result := FCostPerLaunch;
end;

function TRocket.GetCountry: string;
begin
  Result := FCountry;
end;

function TRocket.GetDescription: string;
begin
  Result := FDescription;
end;

function TRocket.GetDiameter: ISizeInfo;
begin
  Result := FDiameter;
end;

function TRocket.GetEngines: IRocketEngines;
begin
  Result := FEngines;
end;

function TRocket.GetFirstFlight: TDateTime;
begin
  Result := FFirstFlight;
end;

function TRocket.GetFirstStage: IRocketFirstStage;
begin
  Result := FFirstStage;
end;

function TRocket.GetFlickrImages: TStringList;
begin
  Result := FFlickrImages;
end;

function TRocket.GetHeight: ISizeInfo;
begin
  Result := FHeight;
end;

function TRocket.GetId: string;
begin
  Result := FId;
end;

function TRocket.GetLandingLegs: IRocketLandingLegs;
begin
  Result := FLandingLegs;
end;

function TRocket.GetMass: IMassInfo;
begin
  Result := FMass;
end;

function TRocket.GetName: string;
begin
  Result := FName;
end;

function TRocket.GetPayloadWeights: IRocketPotentialPayloadWeightList;
begin
  Result := FPayloadWeights;
end;

function TRocket.GetSecondStage: ISecondStage;
begin
  Result := FSecondStage;
end;

function TRocket.GetStages: LongWord;
begin
  Result := FStages;
end;

function TRocket.GetSuccessRate: LongWord;
begin
  Result := FSuccessRate;
end;

function TRocket.GetTypeInfo: string;
begin
  Result := FTypeInfo;
end;

function TRocket.GetWikipedia: string;
begin
  Result := FWikipedia;
end;

procedure TRocket.SetActive(AValue: Boolean);
begin
  FActive := AValue;
end;

procedure TRocket.SetActive(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FActive := False;
  end else if VarIsBool(AValue) then
    FActive := AValue;
end;

procedure TRocket.SetBoosters(AValue: LongWord);
begin
  FBoosters := AValue;
end;

procedure TRocket.SetBoosters(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FBoosters := -0;
  end else if VarIsNumeric(AValue) then
    FBoosters := AValue;
end;

procedure TRocket.SetCompany(AValue: string);
begin
  FCompany := AValue;
end;

procedure TRocket.SetCompany(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FCompany := '';
  end else if VarIsStr(AValue) then
    FCompany := AValue;
end;

procedure TRocket.SetCostPerLaunch(AValue: LongWord);
begin
  FCostPerLaunch := AValue;
end;

procedure TRocket.SetCostPerLaunch(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FCostPerLaunch := -0;
  end else if VarIsNumeric(AValue) then
    FCostPerLaunch := AValue;
end;

procedure TRocket.SetCountry(AValue: string);
begin
  FCountry := AValue;
end;

procedure TRocket.SetCountry(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FCountry := '';
  end else if VarIsStr(AValue) then
    FCountry := AValue;
end;

procedure TRocket.SetDescription(AValue: string);
begin
  FDescription := AValue;
end;

procedure TRocket.SetDescription(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FDescription := '';
  end else if VarIsStr(AValue) then
    FDescription := AValue;
end;

procedure TRocket.SetDiameter(AValue: ISizeInfo);
begin
  FDiameter := AValue;
end;

procedure TRocket.SetEngines(AValue: IRocketEngines);
begin
  FEngines := AValue;
end;

procedure TRocket.SetFirstFlight(AValue: TDateTime);
begin
  FFirstFlight := AValue;
end;

procedure TRocket.SetFirstFlight(AValue: string);
begin
  try
    FormatSettings.DateSeparator := '-';
    FormatSettings.ShortDateFormat := 'y/m/d';
    FFirstFlight := StrToDate(AValue);
  finally
    FormatSettings := DefaultFormatSettings;
  end;
end;

procedure TRocket.SetFirstFlight(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FFirstFlight := MinDateTime;
  end else if VarIsStr(AValue) then
    SetFirstFlight(VarToStr(AValue));
end;

procedure TRocket.SetFirstStage(AValue: IRocketFirstStage);
begin
  FFirstStage := AValue;
end;

procedure TRocket.SetFlickrImages(AValue: TStringList);
begin
  FFlickrImages := AValue;
end;

procedure TRocket.SetHeight(AValue: ISizeInfo);
begin
  FHeight := AValue;
end;

procedure TRocket.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TRocket.SetId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FId := '';
  end else if VarIsStr(AValue) then
    FId := AValue;
end;

procedure TRocket.SetLandingLegs(AValue: IRocketLandingLegs);
begin
  FLandingLegs := AValue;
end;

procedure TRocket.SetMass(AValue: IMassInfo);
begin
  FMass := AValue;
end;

procedure TRocket.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TRocket.SetName(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FName := '';
  end else if VarIsStr(AValue) then
    FName := AValue;
end;

procedure TRocket.SetPayloadWeights(AValue: IRocketPotentialPayloadWeightList);
begin
  FPayloadWeights := AValue;
end;

procedure TRocket.SetSecondStage(AValue: ISecondStage);
begin
  FSecondStage := AValue;
end;

procedure TRocket.SetStages(AValue: LongWord);
begin
  FStages := AValue;
end;

procedure TRocket.SetStages(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FStages := -0;
  end else if VarIsNumeric(AValue) then
    FStages := AValue;
end;

procedure TRocket.SetSuccessRate(AValue: LongWord);
begin
  FSuccessRate := AValue;
end;

procedure TRocket.SetSuccessRate(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FSuccessRate := -0;
  end else if VarIsNumeric(AValue) then
    FSuccessRate := AValue;
end;

procedure TRocket.SetTypeInfo(AValue: string);
begin
  FTypeInfo := AValue;
end;

procedure TRocket.SetTypeInfo(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FTypeInfo := '';
  end else if VarIsStr(AValue) then
    FTypeInfo := AValue;
end;

procedure TRocket.SetWikipedia(AValue: string);
begin
  FWikipedia := AValue;
end;

procedure TRocket.SetWikipedia(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FWikipedia := '';
  end else if VarIsStr(AValue) then
    FWikipedia := AValue;
end;

procedure TRocket.BuildSubObjects(const JSONData: IJSONData);
var
  Diameter, Height: ISizeInfo;
  Engines: IRocketEngines;
  FirstStage: IRocketFirstStage;
  LandingsLegs: IRocketLandingLegs;
  Mass: IMassInfo;
  PayloadWeights: IRocketPotentialPayloadWeightList;
  SecondStage: ISecondStage;
  TypeInfo: string;
  SubJSONData: IJSONData;
begin
  inherited BuildSubObjects(JSONData);

  SubJSONData := JSONData.GetPath('diameter');
  Diameter := NewSizeInfo;
  JSONToModel(SubJSONData.GetJSONData, Diameter);
  Self.FDiameter := Diameter;

  SubJSONData := JSONData.GetPath('height');
  Height := NewSizeInfo;
  JSONToModel(SubJSONData.GetJSONData, Height);
  Self.FHeight := Height;

  SubJSONData := JSONData.GetPath('engines');
  Engines := NewRocketEngines;
  JSONToModel(SubJSONData.GetJSONData, Engines);
  Self.FEngines := Engines;

  SubJSONData := JSONData.GetPath('first_stage');
  FirstStage := NewRocketFirstStage;
  JSONToModel(SubJSONData.GetJSONData, FirstStage);
  Self.FFirstStage := FirstStage;

  SubJSONData := JSONData.GetPath('landing_legs');
  LandingsLegs := NewRocketLandingLegs;
  JSONToModel(SubJSONData.GetJSONData, LandingsLegs);
  Self.FLandingLegs := LandingsLegs;

  SubJSONData := JSONData.GetPath('mass');
  Mass := NewMassInfo;
  JSONToModel(SubJSONData.GetJSONData, Mass);
  Self.FMass := Mass;

  SubJSONData := JSONData.GetPath('payload_weights');
  PayloadWeights := NewRocketPotentialPayloadWeightList;;
  JSONToModel(SubJSONData.GetJSONData, PayloadWeights);
  Self.FPayloadWeights := PayloadWeights;

  SubJSONData := JSONData.GetPath('second_stage');
  SecondStage := NewSecondStage;
  JSONToModel(SubJSONData.GetJSONData, SecondStage);
  Self.FSecondStage := SecondStage;

  TypeInfo := JSONData.GetPath('type').GetJSONData;
  Self.FTypeInfo := TypeInfo;
end;

destructor TRocket.Destroy;
begin
  FFlickrImages.Free;
  inherited Destroy;
end;

function TRocket.ToString(): string;
begin
  Result := GetName;
end;

end.

