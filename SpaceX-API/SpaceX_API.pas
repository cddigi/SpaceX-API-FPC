program SpaceX_API;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp, Dragon, VolumeInfo, ThrustInfo, IspInfo, SizeInfo,
  MassInfo, CompanyHeadquarters, Company, CompanyLinks, SpaceTrackInfo,
  Capsule, Core, CrewStatus, Crew, LandpadStatus,
  Landpad, DatePrecision, LaunchCore, LaunchFailure, LaunchFairings,
  LaunchFlickr, LaunchLinks, LaunchPatch, LaunchReddit, Launch, LaunchpadStatus,
  Launchpad, DragonPayload, Payload, Roadster, RocketEngines, RocketFairing,
  RocketFirstStage, RocketLandingLegs, RocketPotentialPayload,
  RocketPotentialPayloadWeight, SecondStage, Rocket, Ship, Starlink,
  DragonEndpoint, CapsuleEndpoint, CompanyEndpoint, CoreEndpoint,
  CrewEndpoint, LandpadEndpoint, LaunchEndpoint, LaunchpadEndpoint,
  PayloadEndpoint, RoadsterEndpoint, RocketEndpoint, ShipEndpoint,
  StarlinkEndpoint, Endpoint_Helper, BaseModel;

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
  Dragon: IDragon;
  DragonList: IDragonList;
  DragonEndpoint: IDragonEndpoint;
  RocketList: IRocketList;
  RocketEndpoint: IRocketEndpoint;
  CapsuleList: ICapsuleList;
  CapsuleEndpoint: ICapsuleEndpoint;
  Company: ICompany;
  CompanyEndpoint: ICompanyEndpoint;
  CoreList: ICoreList;
  CoreEndpoint: ICoreEndpoint;
  CrewList: ICrewList;
  CrewEndpoint: ICrewEndpoint;
  LandpadList: ILandpadList;
  LandpadEndpoint: ILandpadEndpoint;
  LaunchpadList: ILaunchpadList;
  LaunchpadEndpoint: ILaunchpadEndpoint;
  PayloadList: IPayloadList;
  PayloadEndpoint: IPayloadEndpoint;
  LaunchList: ILaunchList;
  LaunchEndpoint: ILaunchEndpoint;
  Roadster: IRoadster;
  RoadsterEndpoint: IRoadsterEndpoint;
  ShipList: IShipList;
  ShipEndpoint: IShipEndpoint;
  StarlinkList: IStarlinkList;
  StarlinkEndpoint: IStarlinkEndpoint;
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

  //DragonEndpoint := NewDragonEndpoint;
  //DragonList := DragonEndpoint.All;
  //Dragon := DragonEndpoint.One((DragonList.Last as IDragon).Id);
  //WriteLn(Dragon.Name);

  //CompanyEndpoint := NewCompanyEndpoint;
  //Company := CompanyEndpoint.Get;
  //WriteLn(Company.ToString);

  //RocketEndpoint := NewRocketEndpoint;
  //RocketList := RocketEndpoint.All;
  //WriteLn((RocketList.Last as IRocket).TypeInfo);

  //CapsuleEndpoint := NewCapsuleEndpoint;
  //CapsuleList := CapsuleEndpoint.All;
  //WriteLn(Roadster.Name);
  //Capsules.One('5e9e2c5df359185f973b2675');

  CoreEndpoint := NewCoreEndpoint;
  CoreList := CoreEndpoint.All;
  WriteLn((CoreList.Last as ICore).Status);

  //CrewEndpoint := NewCrewEndpoint;
  //CrewList := CrewEndpoint.All;

  //LandpadEndpoint := NewLandpadEndpoint;
  //LandpadList := LandpadEndpoint.All;

  //LaunchpadEndpoint := NewLaunchpadEndpoint;
  //LaunchpadList := LaunchpadEndpoint.All;

  //PayloadEndpoint := NewPayloadEndpoint;
  //PayloadList := PayloadEndpoint.All;
  //WriteLn((PayloadList.Last as IPayload).Name);

  //LaunchEndpoint := NewLaunchEndpoint;
  //LaunchList := LaunchEndpoint.All;

  //RoadsterEndpoint := NewRoadsterEndpoint;
  //Roadster := RoadsterEndpoint.All;
  //WriteLn(Roadster.DateTimeUtc);
  //WriteLn(Roadster.name);

  //ShipEndpoint := NewShipEndpoint;
  //ShipList := ShipEndpoint.All;

  //StarlinkEndpoint := NewStarlinkEndpoint;
  //StarlinkList := StarlinkEndpoint.All;
  //WriteLn((StarlinkList.First as IStarlink).Id);

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

