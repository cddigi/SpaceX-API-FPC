unit Launch;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LaunchCore, LaunchLinks, LaunchFairings, LaunchFailure, DatePrecision;

type

  IBaseLaunch = interface(IInterface) ['{F5B330BA-09F7-4B0B-8164-FF319A07F28A}']
    function GetAutoUpdate: Boolean;
    function GetCapsulesId: TStringList;
    function GetCrewId: TStringList;
    function GetCores: ILaunchCoreList;
    function GetDateUtc: TDateTime;
    function GetDateLocal: TDateTime;
    function GetDatePrecision: TDatePrecision;
    function GetDateUnix: UInt64;
    function GetDetails: string;
    function GetFailures: TLaunchFailureList;
    function GetFairings: TLaunchFairings;
    function GetFlightNumber: LongWord;
    function GetId: string;
    function GetLaunchpadId: string;
    function GetLinks: TLaunchLinks;
    function GetName: string;
    function GetNotEarlierThan: Boolean;
    function GetPayloadsId: TStringList;
    function GetRocketId: string;
    function GetShipsId: TStringList;
    function GetStaticFireDateUnix: UInt64;
    function GetStaticFireDateUtc: TDateTime;
    function GetSuccess: Boolean;
    function GetToBeDated: Boolean;
    function GetUpcoming: Boolean;
    function GetWindow: UInt64;

    procedure SetAutoUpdate(AValue: Boolean);
    procedure SetCapsulesId(AValue: TStringList);
    procedure SetCrewId(AValue: TStringList);
    procedure SetCores(AValue: ILaunchCoreList);
    procedure SetDateUtc(AValue: TDateTime);
    procedure SetDateLocal(AValue: TDateTime);
    procedure SetDatePrecision(AValue: TDatePrecision);
    procedure SetDateUnix(AValue: UInt64);
    procedure SetDetails(AValue: string);
    procedure SetFailures(AValue: TLaunchFailureList);
    procedure SetFairings(AValue: TLaunchFairings);
    procedure SetFlightNumber(AValue: LongWord);
    procedure SetId(AValue: string);
    procedure SetLaunchpadId(AValue: string);
    procedure SetLinks(AValue: TLaunchLinks);
    procedure SetName(AValue: string);
    procedure SetNotEarlierThan(AValue: Boolean);
    procedure SetPayloadsId(AValue: TStringList);
    procedure SetRocketId(AValue: string);
    procedure SetShipsId(AValue: TStringList);
    procedure SetStaticFireDateUnix(AValue: UInt64);
    procedure SetStaticFireDateUtc(AValue: TDateTime);
    procedure SetSuccess(AValue: Boolean);
    procedure SetToBeDated(AValue: Boolean);
    procedure SetUpcoming(AValue: Boolean);
    procedure SetWindow(AValue: UInt64);
  end;

  ILaunch = interface(IBaseLaunch) ['{A6E43CBC-30F1-45DD-A47E-B8EE8A0A3995}']
    property AutoUpdate: Boolean read GetAutoUpdate write SetAutoUpdate;
    property CapsulesId: TStringList read GetCapsulesId write SetCapsulesId;
    property CrewId: TStringList read GetCrewId write SetCrewId;
    property Cores: ILaunchCoreList read GetCores write SetCores;
    property DateUtc: TDateTime read GetDateUtc write SetDateUtc;
    property DateLocal: TDateTime read GetDateLocal write SetDateLocal;
    property DatePrecision: TDatePrecision read GetDatePrecision write SetDatePrecision;
    property DateUnix: UInt64 read GetDateUnix write SetDateUnix;
    property Details: string read GetDetails write SetDetails;
    property Failures: TLaunchFailureList read GetFailures write SetFailures;
    property Fairings: TLaunchFairings read GetFairings write SetFairings;
    property FlightNumber: LongWord read GetFlightNumber write SetFlightNumber;
    property Id: string read GetId write SetId;
    property LaunchpadId: string read GetLaunchpadId write SetLaunchpadId;
    property Links: TLaunchLinks read GetLinks write SetLinks;
    property Name: string read GetName write SetName;
    property NotEarlierThan: Boolean read GetNotEarlierThan write SetNotEarlierThan;
    property PayloadsId: TStringList read GetPayloadsId write SetPayloadsId;
    property RocketId: string read GetRocketId write SetRocketId;
    property ShipsId: TStringList read GetShipsId write SetShipsId;
    property StaticFireDateUnix: UInt64 read GetStaticFireDateUnix write SetStaticFireDateUnix;
    property StaticFireDateUtc: TDateTime read GetStaticFireDateUtc write SetStaticFireDateUtc;
    property Success: Boolean read GetSuccess write SetSuccess;
    property ToBeDated: Boolean read GetToBeDated write SetToBeDated;
    property Upcoming: Boolean read GetUpcoming write SetUpcoming;
    property Window: UInt64 read GetWindow write SetWindow;
  end;

function NewLaunch: ILaunch;

implementation

type

  { TLaunch }

  TLaunch = class(TInterfacedObject, ILaunch)
  private
    FAutoUpdate: Boolean;
    FCapsulesId: TStringList;
    FCrewId: TStringList;
    FCores: ILaunchCoreList;
    FDateUtc: TDateTime;
    FDateLocal: TDateTime;
    FDatePrecision: TDatePrecision;
    FDateUnix: UInt64;
    FDetails: string;
    FFailures: TLaunchFailureList;
    FFairings: TLaunchFairings;
    FFlightNumber: LongWord;
    FId: string;
    FLaunchpadId: string;
    FLinks: TLaunchLinks;
    FName: string;
    FNotEarlierThan: Boolean;
    FPayloadsId: TStringList;
    FRocketId: string;
    FShipsId: TStringList;
    FStaticFireDateUnix: UInt64;
    FStaticFireDateUtc: TDateTime;
    FSuccess: Boolean;
    FToBeDated: Boolean;
    FUpcoming: Boolean;
    FWindow: UInt64;
    //Rocket: Lazy<RocketInfo>;
    //Crew: List<Lazy<CrewInfo>>;
    //Ships: List<Lazy<ShipInfo>>;
    //Capsules: List<Lazy<CapsuleInfo>>;
    //Payloads: List<Lazy<PayloadInfo>>;
    //Launchpad: Lazy<LaunchpadInfo>;
    function GetAutoUpdate: Boolean;
    function GetCapsulesId: TStringList;
    function GetCrewId: TStringList;
    function GetCores: ILaunchCoreList;
    function GetDateUtc: TDateTime;
    function GetDateLocal: TDateTime;
    function GetDatePrecision: TDatePrecision;
    function GetDateUnix: UInt64;
    function GetDetails: string;
    function GetFailures: TLaunchFailureList;
    function GetFairings: TLaunchFairings;
    function GetFlightNumber: LongWord;
    function GetId: string;
    function GetLaunchpadId: string;
    function GetLinks: TLaunchLinks;
    function GetName: string;
    function GetNotEarlierThan: Boolean;
    function GetPayloadsId: TStringList;
    function GetRocketId: string;
    function GetShipsId: TStringList;
    function GetStaticFireDateUnix: UInt64;
    function GetStaticFireDateUtc: TDateTime;
    function GetSuccess: Boolean;
    function GetToBeDated: Boolean;
    function GetUpcoming: Boolean;
    function GetWindow: UInt64;

    procedure SetAutoUpdate(AValue: Boolean);
    procedure SetCapsulesId(AValue: TStringList);
    procedure SetCrewId(AValue: TStringList);
    procedure SetCores(AValue: ILaunchCoreList);
    procedure SetDateUtc(AValue: TDateTime);
    procedure SetDateLocal(AValue: TDateTime);
    procedure SetDatePrecision(AValue: TDatePrecision);
    procedure SetDateUnix(AValue: UInt64);
    procedure SetDetails(AValue: string);
    procedure SetFailures(AValue: TLaunchFailureList);
    procedure SetFairings(AValue: TLaunchFairings);
    procedure SetFlightNumber(AValue: LongWord);
    procedure SetId(AValue: string);
    procedure SetLaunchpadId(AValue: string);
    procedure SetLinks(AValue: TLaunchLinks);
    procedure SetName(AValue: string);
    procedure SetNotEarlierThan(AValue: Boolean);
    procedure SetPayloadsId(AValue: TStringList);
    procedure SetRocketId(AValue: string);
    procedure SetShipsId(AValue: TStringList);
    procedure SetStaticFireDateUnix(AValue: UInt64);
    procedure SetStaticFireDateUtc(AValue: TDateTime);
    procedure SetSuccess(AValue: Boolean);
    procedure SetToBeDated(AValue: Boolean);
    procedure SetUpcoming(AValue: Boolean);
    procedure SetWindow(AValue: UInt64);
  public
    function ToString(): string; override;
  end;

function NewLaunch: ILaunch;
begin
  Result := TLaunch.Create;
end;

{ TLaunch }

function TLaunch.GetAutoUpdate: Boolean;
begin
  Result := FAutoUpdate;
end;

function TLaunch.GetCapsulesId: TStringList;
begin
  Result := FCapsulesId;
end;

function TLaunch.GetCrewId: TStringList;
begin
  Result := FCrewId;
end;

function TLaunch.GetCores: ILaunchCoreList;
begin
  Result := FCores;
end;

function TLaunch.GetDateUtc: TDateTime;
begin
  Result := FDateUtc;
end;

function TLaunch.GetDateLocal: TDateTime;
begin
  Result := FDateLocal;
end;

function TLaunch.GetDatePrecision: TDatePrecision;
begin
  Result := FDatePrecision;
end;

function TLaunch.GetDateUnix: UInt64;
begin
  Result := FDateUnix;
end;

function TLaunch.GetDetails: string;
begin
  Result := FDetails;
end;

function TLaunch.GetFailures: TLaunchFailureList;
begin
  Result := FFailures;
end;

function TLaunch.GetFairings: TLaunchFairings;
begin
  Result := FFairings;
end;

function TLaunch.GetFlightNumber: LongWord;
begin
  Result := FFlightNumber;
end;

function TLaunch.GetId: string;
begin
  Result := FId;
end;

function TLaunch.GetLaunchpadId: string;
begin
  Result := FLaunchpadId;
end;

function TLaunch.GetLinks: TLaunchLinks;
begin
  Result := FLinks;
end;

function TLaunch.GetName: string;
begin
  Result := FName;
end;

function TLaunch.GetNotEarlierThan: Boolean;
begin
  Result := FNotEarlierThan;
end;

function TLaunch.GetPayloadsId: TStringList;
begin
  Result := FPayloadsId;
end;

function TLaunch.GetRocketId: string;
begin
  Result := FRocketId;
end;

function TLaunch.GetShipsId: TStringList;
begin
  Result := FShipsId;
end;

function TLaunch.GetStaticFireDateUnix: UInt64;
begin
  Result := FStaticFireDateUnix;
end;

function TLaunch.GetStaticFireDateUtc: TDateTime;
begin
  Result := FStaticFireDateUtc;
end;

function TLaunch.GetSuccess: Boolean;
begin
  Result := FSuccess;
end;

function TLaunch.GetToBeDated: Boolean;
begin
  Result := FToBeDated;
end;

function TLaunch.GetUpcoming: Boolean;
begin
  Result := FUpcoming;
end;

function TLaunch.GetWindow: UInt64;
begin
  Result := FWindow;
end;

procedure TLaunch.SetAutoUpdate(AValue: Boolean);
begin
  FAutoUpdate := AValue;
end;

procedure TLaunch.SetCapsulesId(AValue: TStringList);
begin
  FCapsulesId := AValue;
end;

procedure TLaunch.SetCrewId(AValue: TStringList);
begin
  FCrewId := AValue;
end;

procedure TLaunch.SetCores(AValue: ILaunchCoreList);
begin
  FCores := AValue;
end;

procedure TLaunch.SetDateUtc(AValue: TDateTime);
begin
  FDateUtc := AValue;
end;

procedure TLaunch.SetDateLocal(AValue: TDateTime);
begin
  FDateLocal := AValue;
end;

procedure TLaunch.SetDatePrecision(AValue: TDatePrecision);
begin
  FDatePrecision := AValue;
end;

procedure TLaunch.SetDateUnix(AValue: UInt64);
begin
  FDateUnix := AValue;
end;

procedure TLaunch.SetDetails(AValue: string);
begin
  FDetails := AValue;
end;

procedure TLaunch.SetFailures(AValue: TLaunchFailureList);
begin
  FFailures := AValue;
end;

procedure TLaunch.SetFairings(AValue: TLaunchFairings);
begin
  FFairings := AValue;
end;

procedure TLaunch.SetFlightNumber(AValue: LongWord);
begin
  FFlightNumber := AValue;
end;

procedure TLaunch.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TLaunch.SetLaunchpadId(AValue: string);
begin
  FLaunchpadId := AValue;
end;

procedure TLaunch.SetLinks(AValue: TLaunchLinks);
begin
  FLinks := AValue;
end;

procedure TLaunch.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TLaunch.SetNotEarlierThan(AValue: Boolean);
begin
  FNotEarlierThan := AValue;
end;

procedure TLaunch.SetPayloadsId(AValue: TStringList);
begin
  FPayloadsId := AValue;
end;

procedure TLaunch.SetRocketId(AValue: string);
begin
  FRocketId := AValue;
end;

procedure TLaunch.SetShipsId(AValue: TStringList);
begin
  FShipsId := AValue;
end;

procedure TLaunch.SetStaticFireDateUnix(AValue: UInt64);
begin
  FStaticFireDateUnix := AValue;
end;

procedure TLaunch.SetStaticFireDateUtc(AValue: TDateTime);
begin
  FStaticFireDateUtc := AValue;
end;

procedure TLaunch.SetSuccess(AValue: Boolean);
begin
  FSuccess := AValue;
end;

procedure TLaunch.SetToBeDated(AValue: Boolean);
begin
  FToBeDated := AValue;
end;

procedure TLaunch.SetUpcoming(AValue: Boolean);
begin
  FUpcoming := AValue;
end;

procedure TLaunch.SetWindow(AValue: UInt64);
begin
  FWindow := AValue;
end;

function TLaunch.ToString(): string;
begin
  Result := GetName;
end;

end.

