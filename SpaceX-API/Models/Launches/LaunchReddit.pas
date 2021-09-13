unit LaunchReddit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseLaunchReddit = interface(IInterface) ['{9159D6AA-11F4-4705-B2EF-144184C1BC01}']
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

type

  { TLaunchReddit }

  TLaunchReddit = class(TInterfacedObject, ILaunchReddit)
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
    procedure SetLaunch(AValue: string);
    procedure SetMedia(AValue: string);
    procedure SetRecovery(AValue: string);
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

procedure TLaunchReddit.SetLaunch(AValue: string);
begin
  FLaunch := AValue;
end;

procedure TLaunchReddit.SetMedia(AValue: string);
begin
  FMedia := AValue;
end;

procedure TLaunchReddit.SetRecovery(AValue: string);
begin
  FRecovery := AValue;
end;

end.

