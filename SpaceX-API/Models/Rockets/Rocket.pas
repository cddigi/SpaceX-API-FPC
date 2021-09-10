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

function NewRocket: IRocket;
function NewRocketList: IRocketList;

implementation

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
    procedure SetBoosters(AValue: LongWord);
    procedure SetCompany(AValue: string);
    procedure SetCostPerLaunch(AValue: LongWord);
    procedure SetCountry(AValue: string);
    procedure SetDescription(AValue: string);
    procedure SetDiameter(AValue: ISizeInfo);
    procedure SetEngines(AValue: IRocketEngines);
    procedure SetFirstFlight(AValue: TDateTime);
    procedure SetFirstFlight(AValue: string);
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
  published
    property active: Boolean read GetActive write SetActive;
    property boosters: LongWord read GetBoosters write SetBoosters;
    property company: string read GetCompany write SetCompany;
    property cost_per_launch: LongWord read GetCostPerLaunch write SetCostPerLaunch;
    property country: string read GetCountry write SetCountry;
    property description: string read GetDescription write SetDescription;
    //property Diameter: ISizeInfo read GetDiameter write SetDiameter;
    //property Engines: IRocketEngines read GetEngines write SetEngines;
    property first_flight: string write SetFirstFlight;
    //property FirstStage: IRocketFirstStage read GetFirstStage write SetFirstStage;
    //property flickr_images: TStringList read GetFlickrImages write SetFlickrImages;
    //property Height: ISizeInfo read GetHeight write SetHeight;
    property id: string read GetId write SetId;
    //property LandingLegs: IRocketLandingLegs read GetLandingLegs write SetLandingLegs;
    //property Mass: IMassInfo read GetMass write SetMass;
    property name: string read GetName write SetName;
    //property PayloadWeights: IRocketPotentialPayloadWeightList read GetPayloadWeights write SetPayloadWeights;
    //property SecondStage: ISecondStage read GetSecondStage write SetSecondStage;
    property stages: LongWord read GetStages write SetStages;
    property success_rate: LongWord read GetSuccessRate write SetSuccessRate;
    //property type_info: string read GetTypeInfo write SetTypeInfo;
    property wikipedia: string read GetWikipedia write SetWikipedia;
  public
    function ToString(): string; override;
  end;

  { TRocketList }

  TRocketList = class(TBaseModelList, IRocketList)
    function NewItem: IBaseModel; override;
  end;

function NewRocket: IRocket;
begin
  Result := TRocket.Create;
end;

function NewRocketList: IRocketList;
begin
  Result := TRocketList.Create;
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

procedure TRocket.SetBoosters(AValue: LongWord);
begin
  FBoosters := AValue;
end;

procedure TRocket.SetCompany(AValue: string);
begin
  FCompany := AValue;
end;

procedure TRocket.SetCostPerLaunch(AValue: LongWord);
begin
  FCostPerLaunch := AValue;
end;

procedure TRocket.SetCountry(AValue: string);
begin
  FCountry := AValue;
end;

procedure TRocket.SetDescription(AValue: string);
begin
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

procedure TRocket.SetSuccessRate(AValue: LongWord);
begin
  FSuccessRate := AValue;
end;

procedure TRocket.SetTypeInfo(AValue: string);
begin
  FTypeInfo := AValue;
end;

procedure TRocket.SetWikipedia(AValue: string);
begin
  FWikipedia := AValue;
end;

function TRocket.ToString(): string;
begin
  Result := GetName;
end;

end.

