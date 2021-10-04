unit Crew;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel, JSON_Helper;

type

  IBaseCrew = interface(IBaseModel) ['{DA70EF6F-6B72-4891-A598-5928D05F6232}']
    function GetAgency: string;
    function GetId: string;
    function GetImage: string;
    function GetLaunchesId: TStringList;
    function GetName: string;
    function GetStatus: string;
    function GetWikipedia: string;

    procedure SetAgency(AValue: string);
    procedure SetId(AValue: string);
    procedure SetImage(AValue: string);
    procedure SetLaunchesId(AValue: TStringList);
    procedure SetName(AValue: string);
    procedure SetStatus(AValue: string);
    procedure SetWikipedia(AValue: string);
  end;

  ICrew = interface(IBaseCrew) ['{054BB0E4-D572-4ECA-9D8E-754F8EA9ACFA}']
    property Agency: string read GetAgency write SetAgency;
    property Id: string read GetId write SetId;
    property Image: string read GetImage write SetImage;
    property LaunchesId: TStringList read GetLaunchesId write SetLaunchesId;
    property Name: string read GetName write SetName;
    property Status: string read GetStatus write SetStatus;
    property Wikipedia: string read GetWikipedia write SetWikipedia;
  end;

  ICrewList = interface(IBaseModelList) ['{4245CBC5-4C4D-42AB-8AFA-3CACD4677566}']
  end;

function NewCrew: ICrew;
function NewCrewList: ICrewList;

implementation

uses
  Variants;

type

  { TCrew }

  TCrew = class(TBaseModel, ICrew)
  private
    FAgency: string;
    FId: string;
    FImage: string;
    FLaunchesId: TStringList;
    FName: string;
    FStatus: string;
    FWikipedia: string;
    function GetAgency: string;
    function GetId: string;
    function GetImage: string;
    function GetLaunchesId: TStringList;
    function GetName: string;
    function GetStatus: string;
    function GetWikipedia: string;

    procedure SetAgency(AValue: string);
    procedure SetAgency(AValue: Variant);
    procedure SetId(AValue: string);
    procedure SetId(AValue: Variant);
    procedure SetImage(AValue: string);
    procedure SetImage(AValue: Variant);
    procedure SetLaunchesId(AValue: TStringList);
    procedure SetLaunchesId(AValue: Variant);
    procedure SetName(AValue: string);
    procedure SetName(AValue: Variant);
    procedure SetStatus(AValue: string);
    procedure SetStatus(AValue: Variant);
    procedure SetWikipedia(AValue: string);
    procedure SetWikipedia(AValue: Variant);
  public
    constructor Create;
    destructor destroy; override;
    function ToString(): string; override;
  published
    property agency: Variant write SetAgency;
    property id: Variant write SetId;
    property image: Variant write SetImage;
    property launches: TStringList read GetLaunchesId write SetLaunchesId;
    property name: Variant write SetName;
    property status: Variant write SetStatus;
    property wikipedia: Variant write SetWikipedia;
  end;

  { TCrewList }

  TCrewList = class(TBaseModelList, ICrewList)
    function NewItem: IBaseModel; override;
  end;

function NewCrew: ICrew;
begin
  Result := TCrew.Create;
end;

function NewCrewList: ICrewList;
begin
  Result := TCrewList.Create;
end;

{ TCrewList }

function TCrewList.NewItem: IBaseModel;
begin
  Result := NewCrew;
end;

{ TCrew }

function TCrew.GetAgency: string;
begin
  Result := FAgency;
end;

function TCrew.GetId: string;
begin
  Result := FId;
end;

function TCrew.GetImage: string;
begin
  Result := FImage;
end;

function TCrew.GetLaunchesId: TStringList;
begin
  Result := FLaunchesId;
end;

function TCrew.GetName: string;
begin
  Result := FName;
end;

function TCrew.GetStatus: string;
begin
  Result := FStatus;
end;

function TCrew.GetWikipedia: string;
begin
  Result := FWikipedia;
end;

procedure TCrew.SetAgency(AValue: string);
begin
  FAgency := AValue;
end;

procedure TCrew.SetAgency(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FAgency := '';
  end else if VarIsStr(AValue) then
    FAgency := AValue;
end;

procedure TCrew.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TCrew.SetId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FId := '';
  end else if VarIsStr(AValue) then
    FId := AValue;
end;

procedure TCrew.SetImage(AValue: string);
begin
  FImage := AValue;
end;

procedure TCrew.SetImage(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FImage := '';
  end else if VarIsStr(AValue) then
    FImage := AValue;
end;

procedure TCrew.SetLaunchesId(AValue: TStringList);
begin
  FLaunchesId := AValue;
end;

procedure TCrew.SetLaunchesId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLaunchesId := TStringList.Create;
  end else if VarIsStr(AValue) then
    FLaunchesId.AddDelimitedtext(AValue);
end;

procedure TCrew.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TCrew.SetName(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FName := '';
  end else if VarIsStr(AValue) then
    FName := AValue;
end;

procedure TCrew.SetStatus(AValue: string);
begin
  FStatus := AValue;
end;

procedure TCrew.SetStatus(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FStatus := '';
  end else if VarIsStr(AValue) then
    FStatus := AValue;
end;

procedure TCrew.SetWikipedia(AValue: string);
begin
  FWikipedia := AValue;
end;

procedure TCrew.SetWikipedia(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FWikipedia := '';
  end else if VarIsStr(AValue) then
    FWikipedia := AValue;
end;

constructor TCrew.Create;
begin
  inherited Create;
  FLaunchesId := TStringList.Create;
  FLaunchesId.SkipLastLineBreak := True;
end;

destructor TCrew.destroy;
begin
  FreeAndNil(FLaunchesId);
  inherited destroy;
end;

function TCrew.ToString(): string;
begin
  Result := Format(''
    + 'Agency: %s' + LineEnding
    + 'ID: %s' + LineEnding
    + 'Image: %s' + LineEnding
    + 'Launches: %s' + LineEnding
    + 'Name: %s' + LineEnding
    + 'Status: %s' + LineEnding
    + 'Wikipedia: %s'
    , [
      GetAgency,
      GetId,
      GetImage,
      GetLaunchesId.Text,
      GetName,
      GetStatus,
      GetWikipedia
    ]);
end;

end.

