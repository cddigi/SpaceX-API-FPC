unit Crew;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, CrewStatus;

type

  IBaseCrew = interface(IInterface) ['{DA70EF6F-6B72-4891-A598-5928D05F6232}']
    function GetAgency: string;
    function GetId: string;
    function GetImage: string;
    function GetLaunchesId: TStringList;
    function GetName: string;
    function GetStatus: TCrewStatus;
    function GetWikipedia: string;

    procedure SetAgency(AValue: string);
    procedure SetId(AValue: string);
    procedure SetImage(AValue: string);
    procedure SetLaunchesId(AValue: TStringList);
    procedure SetName(AValue: string);
    procedure SetStatus(AValue: TCrewStatus);
    procedure SetWikipedia(AValue: string);
  end;

  ICrew = interface(IBaseCrew) ['{054BB0E4-D572-4ECA-9D8E-754F8EA9ACFA}']
    property Agency: string read GetAgency write SetAgency;
    property Id: string read GetId write SetId;
    property Image: string read GetImage write SetImage;
    property LaunchesId: TStringList read GetLaunchesId write SetLaunchesId;
    property Name: string read GetName write SetName;
    property Status: TCrewStatus read GetStatus write SetStatus;
    property Wikipedia: string read GetWikipedia write SetWikipedia;
  end;

  ICrewList = interface(IInterface) ['{4245CBC5-4C4D-42AB-8AFA-3CACD4677566}']
  end;

function NewCrew: ICrew;
function NewCrewList: ICrewList;

implementation

type

  { TCrew }

  TCrew = class(TInterfacedObject, ICrew)
  private
    FAgency: string;
    FId: string;
    FImage: string;
    FLaunchesId: TStringList;
    FName: string;
    FStatus: TCrewStatus;
    FWikipedia: string;
    function GetAgency: string;
    function GetId: string;
    function GetImage: string;
    function GetLaunchesId: TStringList;
    function GetName: string;
    function GetStatus: TCrewStatus;
    function GetWikipedia: string;

    procedure SetAgency(AValue: string);
    procedure SetId(AValue: string);
    procedure SetImage(AValue: string);
    procedure SetLaunchesId(AValue: TStringList);
    procedure SetName(AValue: string);
    procedure SetStatus(AValue: TCrewStatus);
    procedure SetWikipedia(AValue: string);
  public
    function ToString(): string; override;
  end;

  TCrewList = class(TInterfaceList, ICrewList)
  end;

function NewCrew: ICrew;
begin
  Result := TCrew.Create;
end;

function NewCrewList: ICrewList;
begin
  Result := TCrewList.Create;
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

function TCrew.GetStatus: TCrewStatus;
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

procedure TCrew.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TCrew.SetImage(AValue: string);
begin
  FImage := AValue;
end;

procedure TCrew.SetLaunchesId(AValue: TStringList);
begin
  FLaunchesId := AValue;
end;

procedure TCrew.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TCrew.SetStatus(AValue: TCrewStatus);
begin
  FStatus := AValue;
end;

procedure TCrew.SetWikipedia(AValue: string);
begin
  FWikipedia := AValue;
end;

function TCrew.ToString(): string;
begin
  Result := GetName;
end;

end.

