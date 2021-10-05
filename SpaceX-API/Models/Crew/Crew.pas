unit Crew;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel, JSON_Helper;

type

  { IBaseCrew }

  IBaseCrew = interface(IBaseModel) ['{DA70EF6F-6B72-4891-A598-5928D05F6232}']
    function GetAgency: string;
    function GetId: string;
    function GetImage: string;
    function GetLaunches: TStringList;
    function GetName: string;
    function GetStatus: string;
    function GetWikipedia: string;

    procedure SetAgency(AValue: string);
    procedure SetId(AValue: string);
    procedure SetImage(AValue: string);
    procedure SetLaunches(AValue: TStringList);
    procedure SetName(AValue: string);
    procedure SetStatus(AValue: string);
    procedure SetWikipedia(AValue: string);
  end;

  { ICrew }

  ICrew = interface(IBaseCrew) ['{054BB0E4-D572-4ECA-9D8E-754F8EA9ACFA}']
    property Agency: string read GetAgency write SetAgency;
    property Id: string read GetId write SetId;
    property Image: string read GetImage write SetImage;
    property Launches: TStringList read GetLaunches write SetLaunches;
    property Name: string read GetName write SetName;
    property Status: string read GetStatus write SetStatus;
    property Wikipedia: string read GetWikipedia write SetWikipedia;
  end;

  { ICrewList }

  ICrewList = interface(IBaseModelList) ['{4245CBC5-4C4D-42AB-8AFA-3CACD4677566}']
  end;

  { TCrewEnumerator }

  TCrewEnumerator = class(TBaseModelEnumerator)
    function GetCurrent: ICrew;
    property Current : ICrew read GetCurrent;
  end;

function NewCrew: ICrew;
function NewCrewList: ICrewList;
operator enumerator(AList: ICrewList): TCrewEnumerator;

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
    FLaunches: TStringList;
    FName: string;
    FStatus: string;
    FWikipedia: string;
  private
    function GetAgency: string;
    function GetId: string;
    function GetImage: string;
    function GetLaunches: TStringList;
    function GetName: string;
    function GetStatus: string;
    function GetWikipedia: string;
  private
    procedure SetAgency(AValue: string);
    procedure SetAgency(AValue: Variant);
    procedure SetId(AValue: string);
    procedure SetId(AValue: Variant);
    procedure SetImage(AValue: string);
    procedure SetImage(AValue: Variant);
    procedure SetLaunches(AValue: TStringList);
    procedure SetName(AValue: string);
    procedure SetName(AValue: Variant);
    procedure SetStatus(AValue: string);
    procedure SetStatus(AValue: Variant);
    procedure SetWikipedia(AValue: string);
    procedure SetWikipedia(AValue: Variant);
  public
    function ToString(): string; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property agency: Variant write SetAgency;
    property id: Variant write SetId;
    property image: Variant write SetImage;
    property launches: TStringList read GetLaunches write SetLaunches;
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

operator enumerator(AList: ICrewList): TCrewEnumerator;
begin
  Result := TCrewEnumerator.Create;
  Result.FList := AList;
end;

{ TCrewEnumerator }

function TCrewEnumerator.GetCurrent: ICrew;
begin
  Result := FCurrent as ICrew;
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

function TCrew.GetLaunches: TStringList;
begin
  Result := FLaunches;
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
  if VarIsNull(AValue) then
    AValue := '';

  FAgency := AValue;
end;

procedure TCrew.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TCrew.SetId(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := '';

  FId := AValue;
end;

procedure TCrew.SetImage(AValue: string);
begin
  FImage := AValue;
end;

procedure TCrew.SetImage(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := '';

  FImage := AValue;
end;

procedure TCrew.SetLaunches(AValue: TStringList);
begin
  FLaunches := AValue;
end;

procedure TCrew.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TCrew.SetName(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := '';

  FName := AValue;
end;

procedure TCrew.SetStatus(AValue: string);
begin
  FStatus := AValue;
end;

procedure TCrew.SetStatus(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := '';

  FStatus := AValue;
end;

procedure TCrew.SetWikipedia(AValue: string);
begin
  FWikipedia := AValue;
end;

procedure TCrew.SetWikipedia(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := '';

  FWikipedia := AValue;
end;

constructor TCrew.Create;
begin
  inherited Create;
  FLaunches := TStringList.Create;
  FLaunches.SkipLastLineBreak := True;
  FLaunches.LineBreak := ', ';
end;

destructor TCrew.destroy;
begin
  FreeAndNil(FLaunches);
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
      GetLaunches.Text,
      GetName,
      GetStatus,
      GetWikipedia
    ]);
end;

end.

