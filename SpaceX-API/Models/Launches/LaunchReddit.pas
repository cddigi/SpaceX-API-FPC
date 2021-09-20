unit LaunchReddit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type

  IBaseLaunchReddit = interface(IBaseModel) ['{9159D6AA-11F4-4705-B2EF-144184C1BC01}']
    function GetCampaign: string;
    function GetLaunch: string;
    function GetMedia: string;
    function GetRecovery: string;

    procedure SetCampaign(AValue: string);
    procedure SetLaunch(AValue: string);
    procedure SetMedia(AValue: string);
    procedure SetRecovery(AValue: string);
  end;

  ILaunchReddit = interface(IBaseLaunchReddit) ['{6277682B-C2FB-4742-92DA-DCDAB71D0598}']
    property Campaign: string read GetCampaign write SetCampaign;
    property Launch: string read GetLaunch write SetLaunch;
    property Media: string read GetMedia write SetMedia;
    property Recovery: string read GetRecovery write SetRecovery;
  end;

function NewLaunchReddit: ILaunchReddit;

implementation

uses
  Variants;

type

  { TLaunchReddit }

  TLaunchReddit = class(TBaseModel, ILaunchReddit)
  private
    FCampaign: string;
    FLaunch: string;
    FMedia: string;
    FRecovery: string;
    function GetCampaign: string;
    function GetLaunch: string;
    function GetMedia: string;
    function GetRecovery: string;

    procedure SetCampaign(AValue: string);
    procedure SetCampaign(AValue: Variant);
    procedure SetLaunch(AValue: string);
    procedure SetLaunch(AValue: Variant);
    procedure SetMedia(AValue: string);
    procedure SetMedia(AValue: Variant);
    procedure SetRecovery(AValue: string);
    procedure SetRecovery(AValue: Variant);
  published
    property campaign: Variant write SetCampaign;
    property launch: Variant write SetLaunch;
    property media: Variant write SetMedia;
    property recovery: Variant write SetRecovery;
  end;

function NewLaunchReddit: ILaunchReddit;
begin
  Result := TLaunchReddit.Create;
end;

{ TLaunchReddit }

function TLaunchReddit.GetCampaign: string;
begin
  Result := FCampaign;
end;

function TLaunchReddit.GetLaunch: string;
begin
  Result := FLaunch;
end;

function TLaunchReddit.GetMedia: string;
begin
  Result := FMedia;
end;

function TLaunchReddit.GetRecovery: string;
begin
  Result := FRecovery;
end;

procedure TLaunchReddit.SetCampaign(AValue: string);
begin
  FCampaign := AValue;
end;

procedure TLaunchReddit.SetCampaign(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FCampaign := '';
  end else if VarIsStr(AValue) then
    FCampaign := AValue;
end;

procedure TLaunchReddit.SetLaunch(AValue: string);
begin
  FLaunch := AValue;
end;

procedure TLaunchReddit.SetLaunch(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLaunch := '';
  end else if VarIsStr(AValue) then
    FLaunch := AValue;
end;

procedure TLaunchReddit.SetMedia(AValue: string);
begin
  FMedia := AValue;
end;

procedure TLaunchReddit.SetMedia(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FMedia := '';
  end else if VarIsStr(AValue) then
    FMedia := AValue;
end;

procedure TLaunchReddit.SetRecovery(AValue: string);
begin
  FRecovery := AValue;
end;

procedure TLaunchReddit.SetRecovery(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FRecovery := '';
  end else if VarIsStr(AValue) then
    FRecovery := AValue;
end;

end.

