program SpaceX_API;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp, Dragon, VolumeInfo, ThrustInfo, IspInfo, SizeInfo,
  MassInfo, CompanyHeadquarters, Company, CompanyLinks, SpaceTrackInfo,
  CapsuleStatus, Capsule, CoreStatus, Core, CrewStatus, Crew, LandpadStatus,
  Landpad, DatePrecision, LaunchCore, LaunchFailure, LaunchFairings,
  LaunchFlickr, LaunchLinks, LaunchPatch, LaunchReddit, Launch, LaunchpadStatus,
  Launchpad, DragonPayload, Payload, Roadster, RocketEngines, RocketFairing,
  RocketFirstStage, RocketLandingLegs, RocketPotentialPayload,
  RocketPotentialPayloadWeight, SecondStage, Rocket, Ship, Starlink,
  DragonEndpoint, fphttpclient, fpjson, CapsulesEndpoint, jsonparser, BaseEndpoint;

type

  { SpaceX }

  SpaceX = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

{ SpaceX }

procedure SpaceX.DoRun;
var
  Dragon: IDragonEndpoint;
  Capsules: ICapsulesEndpoint;
  HttpClient: TFPCustomHTTPClient;
  Response: string;
  JSONData: TJSONData;
  ErrorMsg: String;
begin
  // quick check parameters
  ErrorMsg:=CheckOptions('h', 'help');
  if ErrorMsg<>'' then begin
    ShowException(Exception.Create(ErrorMsg));
    Terminate;
    Exit;
  end;

  // parse parameters
  if HasOption('h', 'help') then begin
    WriteHelp;
    Terminate;
    Exit;
  end;

  { add your program here }
  Dragon := NewDragonEndpoint;
  Dragon.All;

  Capsules := NewCapsulesEndpoint;
  Capsules.All;
  Capsules.One('5e9e2c5df359185f973b2675');

  HttpClient := TFPCustomHTTPClient.Create(nil);
  try
     Response := HttpClient.Get('https://api.spacexdata.com/v4/launches/latest');
     JSONData := GetJSON(Response);
     JSONData := GetJSON(HttpClient.Get('https://api.spacexdata.com/v4/launches/latest'));
  finally
    WriteLn(JSONData.FormatJSON());
    WriteLn();

    JSONData.Free;
    HttpClient.Free;
  end;

  // stop program loop
  Terminate;
end;

constructor SpaceX.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor SpaceX.Destroy;
begin
  inherited Destroy;
end;

procedure SpaceX.WriteHelp;
begin
  { add your help code here }
  writeln('Usage: ', ExeName, ' -h');
end;

var
  Application: SpaceX;
begin
  Application:=SpaceX.Create(nil);
  Application.Title:='SpaceX';
  Application.Run;
  Application.Free;
end.

