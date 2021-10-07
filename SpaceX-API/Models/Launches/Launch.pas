unit Launch;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LaunchCore, LaunchLinks, LaunchFairings, LaunchFailure,
  DatePrecision, BaseModel, JSON_Helper;

type

  IBaseLaunch = interface(IBaseModel) ['{F5B330BA-09F7-4B0B-8164-FF319A07F28A}']
    function GetAutoUpdate: Boolean;
    function GetCapsulesId: TStringList;
    function GetCrewId: TStringList;
    function GetCores: ILaunchCoreList;
    function GetDateUtc: TDateTime;
    function GetDateLocal: TDateTime;
    function GetDatePrecision: TDatePrecision;
    function GetDateUnix: UInt64;
    function GetDetails: string;
    function GetFailures: ILaunchFailureList;
    function GetFairings: ILaunchFairings;
    function GetFlightNumber: LongWord;
    function GetId: string;
    function GetLaunchpadId: string;
    function GetLinks: ILaunchLinks;
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
    procedure SetDatePrecision(AValue: TDatePrecision);
    procedure SetDateUnix(AValue: UInt64);
    procedure SetDetails(AValue: string);
    procedure SetFailures(AValue: ILaunchFailureList);
    procedure SetFairings(AValue: ILaunchFairings);
    procedure SetFlightNumber(AValue: LongWord);
    procedure SetId(AValue: string);
    procedure SetLaunchpadId(AValue: string);
    procedure SetLinks(AValue: ILaunchLinks);
    procedure SetName(AValue: string);
    procedure SetNotEarlierThan(AValue: Boolean);
    procedure SetPayloadsId(AValue: TStringList);
    procedure SetRocketId(AValue: string);
    procedure SetShipsId(AValue: TStringList);
    procedure SetStaticFireDateUnix(AValue: UInt64);
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
    property DateUtc: TDateTime read GetDateUtc;
    property DateLocal: TDateTime read GetDateLocal;
    property DatePrecision: TDatePrecision read GetDatePrecision write SetDatePrecision;
    property DateUnix: UInt64 read GetDateUnix write SetDateUnix;
    property Details: string read GetDetails write SetDetails;
    property Failures: ILaunchFailureList read GetFailures write SetFailures;
    property Fairings: ILaunchFairings read GetFairings write SetFairings;
    property FlightNumber: LongWord read GetFlightNumber write SetFlightNumber;
    property Id: string read GetId write SetId;
    property LaunchpadId: string read GetLaunchpadId write SetLaunchpadId;
    property Links: ILaunchLinks read GetLinks write SetLinks;
    property Name: string read GetName write SetName;
    property NotEarlierThan: Boolean read GetNotEarlierThan write SetNotEarlierThan;
    property PayloadsId: TStringList read GetPayloadsId write SetPayloadsId;
    property RocketId: string read GetRocketId write SetRocketId;
    property ShipsId: TStringList read GetShipsId write SetShipsId;
    property StaticFireDateUnix: UInt64 read GetStaticFireDateUnix write SetStaticFireDateUnix;
    property StaticFireDateUtc: TDateTime read GetStaticFireDateUtc;
    property Success: Boolean read GetSuccess write SetSuccess;
    property ToBeDated: Boolean read GetToBeDated write SetToBeDated;
    property Upcoming: Boolean read GetUpcoming write SetUpcoming;
    property Window: UInt64 read GetWindow write SetWindow;
  end;

  ILaunchList = interface(IBaseModelList) ['{5CD79962-6E62-4B0A-881B-F7C5205B9E61}']
  end;

  { TLaunchEnumerator }

  TLaunchEnumerator = class(TBaseModelEnumerator)
    function GetCurrent: ILaunch;
    property Current : ILaunch read GetCurrent;
  end;

function NewLaunch: ILaunch;
function NewLaunchList: ILaunchList;
operator enumerator(AList: ILaunchList): TLaunchEnumerator;

implementation

uses
  DateUtils, Variants;

type

  { TLaunch }

  TLaunch = class(TBaseModel, ILaunch)
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
    FFailures: ILaunchFailureList;
    FFairings: ILaunchFairings;
    FFlightNumber: LongWord;
    FId: string;
    FLaunchpadId: string;
    FLinks: ILaunchLinks;
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
    function GetFailures: ILaunchFailureList;
    function GetFairings: ILaunchFairings;
    function GetFlightNumber: LongWord;
    function GetId: string;
    function GetLaunchpadId: string;
    function GetLinks: ILaunchLinks;
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
    procedure SetAutoUpdate(AValue: Variant);
    procedure SetCapsulesId(AValue: TStringList);
    procedure SetCrewId(AValue: TStringList);
    procedure SetCores(AValue: ILaunchCoreList);
    //procedure SetDateUtc(AValue: TDateTime);
    //procedure SetDateUtc(AValue: Variant);
    //procedure SetDateLocal(AValue: TDateTime);
    //procedure SetDateLocal(AValue: Variant);
    procedure SetDatePrecision(AValue: TDatePrecision);
    procedure SetDateUnix(AValue: UInt64);
    procedure SetDateUnix(AValue: Variant);
    procedure SetDetails(AValue: string);
    procedure SetDetails(AValue: Variant);
    procedure SetFailures(AValue: ILaunchFailureList);
    procedure SetFairings(AValue: ILaunchFairings);
    procedure SetFlightNumber(AValue: LongWord);
    procedure SetFlightNumber(AValue: Variant);
    procedure SetId(AValue: string);
    procedure SetId(AValue: Variant);
    procedure SetLaunchpadId(AValue: string);
    procedure SetLaunchpadId(AValue: Variant);
    procedure SetLinks(AValue: ILaunchLinks);
    procedure SetName(AValue: string);
    procedure SetName(AValue: Variant);
    procedure SetNotEarlierThan(AValue: Boolean);
    procedure SetNotEarlierThan(AValue: Variant);
    procedure SetPayloadsId(AValue: TStringList);
    procedure SetRocketId(AValue: string);
    procedure SetRocketId(AValue: Variant);
    procedure SetShipsId(AValue: TStringList);
    procedure SetStaticFireDateUnix(AValue: UInt64);
    procedure SetStaticFireDateUnix(AValue: Variant);
    //procedure SetStaticFireDateUtc(AValue: TDateTime);
    //procedure SetStaticFireDateUtc(AValue: Variant);
    procedure SetSuccess(AValue: Boolean);
    procedure SetSuccess(AValue: Variant);
    procedure SetToBeDated(AValue: Boolean);
    procedure SetToBeDated(AValue: Variant);
    procedure SetUpcoming(AValue: Boolean);
    procedure SetUpcoming(AValue: Variant);
    procedure SetWindow(AValue: UInt64);
    procedure SetWindow(AValue: Variant);
  public
    function ToString: string; override;
  public
    procedure BuildSubObjects(const JSONData: IJSONData); override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property auto_update: Variant write SetAutoUpdate;
    property capsules: TStringList read GetCapsulesId write SetCapsulesId;
    property crew: TStringList read GetCrewId write SetCrewId;
    //property date_utc: Variant write SetDateUtc;
    //property date_local: Variant write SetDateLocal;
    property date_unix: Variant write SetDateUnix;
    property details: Variant write SetDetails;
    property flight_number: Variant write SetFlightNumber;
    property id: Variant write SetId;
    property launchpad: Variant write SetLaunchpadId;
    property name: Variant write SetName;
    property net: Variant write SetNotEarlierThan;
    property payloads: TStringList read GetPayloadsId write SetPayloadsId;
    property rocket: Variant write SetRocketId;
    property ships: TStringList read GetShipsId write SetShipsId;
    property static_fire_date_unix: Variant write SetStaticFireDateUnix;
    //property static_fire_date_utc: Variant write SetStaticFireDateUtc;
    property success: Variant write SetSuccess;
    property tbd: Variant write SetToBeDated;
    property upcoming: Variant write SetUpcoming;
    property window: Variant write SetWindow;
  end;

  { TLaunchList }

  TLaunchList = class(TBaseModelList, ILaunchList)
    function NewItem: IBaseModel; override;
  end;

operator enumerator(AList: ILaunchList): TLaunchEnumerator;
begin
  Result := TLaunchEnumerator.Create;
  Result.FList := AList;
end;

function NewLaunch: ILaunch;
begin
  Result := TLaunch.Create;
end;

function NewLaunchList: ILaunchList;
begin
  Result := TLaunchList.Create;
end;

{ TLaunchEnumerator }

function TLaunchEnumerator.GetCurrent: ILaunch;
begin
  Result := FCurrent as ILaunch;
end;

{ TLaunchList }

function TLaunchList.NewItem: IBaseModel;
begin
  Result := NewLaunch;
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
  Result := UnixToDateTime(FDateUnix);
end;

function TLaunch.GetDateLocal: TDateTime;
begin
  Result := UnixToDateTime(FDateUnix, False);
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

function TLaunch.GetFailures: ILaunchFailureList;
begin
  Result := FFailures;
end;

function TLaunch.GetFairings: ILaunchFairings;
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

function TLaunch.GetLinks: ILaunchLinks;
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
  Result := UnixToDateTime(FStaticFireDateUnix);
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

procedure TLaunch.SetAutoUpdate(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FAutoUpdate := False;
  end else if VarIsBool(AValue) then
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

procedure TLaunch.SetDatePrecision(AValue: TDatePrecision);
begin
  FDatePrecision := AValue;
end;

procedure TLaunch.SetDateUnix(AValue: UInt64);
begin
  FDateUnix := AValue;
end;

procedure TLaunch.SetDateUnix(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FDateUnix := 0
  end else if VarIsNumeric(AValue) then
    FDateUnix := AValue;
end;

procedure TLaunch.SetDetails(AValue: string);
begin
  FDetails := AValue;
end;

procedure TLaunch.SetDetails(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    SetDetails('');
  end else if VarIsStr(AValue) then
    FDetails := AValue;
end;

procedure TLaunch.SetFailures(AValue: ILaunchFailureList);
begin
  FFailures := AValue;
end;

procedure TLaunch.SetFairings(AValue: ILaunchFairings);
begin
  FFairings := AValue;
end;

procedure TLaunch.SetFlightNumber(AValue: LongWord);
begin
  FFlightNumber := AValue;
end;

procedure TLaunch.SetFlightNumber(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FFlightNumber := -0;
  end else if VarIsNumeric(AValue) then
    FFlightNumber := AValue;
end;

procedure TLaunch.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TLaunch.SetId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FId := '';
  end else if VarIsStr(AValue) then
    FId := AValue;
end;

procedure TLaunch.SetLaunchpadId(AValue: string);
begin
  FLaunchpadId := AValue;
end;

procedure TLaunch.SetLaunchpadId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLaunchpadId := '';
  end else if VarIsStr(AValue) then
    FLaunchpadId := AValue;
end;

procedure TLaunch.SetLinks(AValue: ILaunchLinks);
begin
  FLinks := AValue;
end;

procedure TLaunch.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TLaunch.SetName(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FName := '';
  end else if VarIsStr(AValue) then
    FName := AValue;
end;

procedure TLaunch.SetNotEarlierThan(AValue: Boolean);
begin
  FNotEarlierThan := AValue;
end;

procedure TLaunch.SetNotEarlierThan(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FNotEarlierThan := False;
  end else if VarIsBool(AValue) then
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

procedure TLaunch.SetRocketId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FRocketId := '';
  end else if VarIsStr(AValue) then
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

procedure TLaunch.SetStaticFireDateUnix(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FStaticFireDateUnix := 0;
  end else if VarIsNumeric(AValue) then
    FStaticFireDateUnix := AValue;
end;

procedure TLaunch.SetSuccess(AValue: Boolean);
begin
  FSuccess := AValue;
end;

procedure TLaunch.SetSuccess(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FSuccess := False;
  end else if VarIsBool(AValue) then
    FSuccess := AValue;
end;

procedure TLaunch.SetToBeDated(AValue: Boolean);
begin
  FToBeDated := AValue;
end;

procedure TLaunch.SetToBeDated(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FToBeDated := False;
  end else if VarIsBool(AValue) then
    FToBeDated := AValue;
end;

procedure TLaunch.SetUpcoming(AValue: Boolean);
begin
  FUpcoming := AValue;
end;

procedure TLaunch.SetUpcoming(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FUpcoming := False;
  end else if VarIsBool(AValue) then
    FUpcoming := AValue;
end;

procedure TLaunch.SetWindow(AValue: UInt64);
begin
  FWindow := AValue;
end;

procedure TLaunch.SetWindow(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FWindow := -0;
  end else if VarIsNumeric(AValue) then
    FWindow := AValue;
end;

constructor TLaunch.Create;
begin
  inherited Create;
  FCapsulesId := TStringList.Create;
  FCrewId := TStringList.Create;
  FPayloadsId := TStringList.Create;
  FShipsId := TStringList.Create;

  FCapsulesId.SkipLastLineBreak := True;
  FCrewId.SkipLastLineBreak := True;    
  FPayloadsId.SkipLastLineBreak := True;
  FShipsId.SkipLastLineBreak := True;
end;

destructor TLaunch.Destroy;
begin
  FreeAndNil(FCapsulesId);
  FreeAndNil(FCrewId);
  FreeAndNil(FPayloadsId);
  FreeAndNil(FShipsId);
  inherited Destroy;
end;

procedure TLaunch.BuildSubObjects(const JSONData: IJSONData);
var
  Cores: ILaunchCoreList;
  Failures: ILaunchFailureList;
  Fairings: ILaunchFairings;
  Links: ILaunchLinks;
  SubJSONData: IJSONData;
begin
  inherited BuildSubObjects(JSONData);

  SubJSONData := JSONData.GetPath('cores');
  Cores := NewLaunchCoreList;
  JSONToModel(SubJSONData.GetJSONData, Cores);
  Self.FCores := Cores;

  SubJSONData := JSONData.GetPath('failures');
  Failures := NewLaunchFailureList;
  JSONToModel(SubJSONData.GetJSONData, Failures);
  Self.FFailures := Failures;

  SubJSONData := JSONData.GetPath('fairings');
  Fairings := NewLaunchFairings;
  JSONToModel(SubJSONData.GetJSONData, Fairings);
  Self.FFairings := Fairings;

  SubJSONData := JSONData.GetPath('links');
  Links := NewLaunchLinks;
  JSONToModel(SubJSONData.GetJSONData, Links);
  Self.FLinks := Links;
end;

function TLaunch.ToString(): string;
begin
  Result := Format(''
    + 'Auto Update: %s' + LineEnding
    + 'Capsule IDs: [' + LineEnding + '  %s' + LineEnding + ']' + LineEnding
    + 'Crew IDs: [' + LineEnding + '  %s' + LineEnding + ']' + LineEnding
    + 'Cores: [' + LineEnding + '  %s' + LineEnding + ']' + LineEnding
    + 'Date UTC: %s' + LineEnding
    + 'Date Local: %s' + LineEnding
    + 'Date Precision: %s' + LineEnding
    + 'Date Unix: %u' + LineEnding
    + 'Details: %s' + LineEnding
    + 'Failures: [' + LineEnding + '  %s' + LineEnding + ']' + LineEnding
    + 'Fairings: [' + LineEnding + '  %s' + LineEnding + ']' + LineEnding
    + 'Flight Number: %u' + LineEnding
    + 'ID: %s' + LineEnding
    + 'Launchpad ID: %s' + LineEnding
    + 'Links: [' + LineEnding + '  %s' + LineEnding + ']' + LineEnding
    + 'Name: %s' + LineEnding
    + 'Not Earlier Than: %s' + LineEnding
    + 'Payload IDs: [' + LineEnding + '  %s' + LineEnding + ']' + LineEnding
    + 'Rocket ID: %s' + LineEnding
    + 'Ship IDs: [' + LineEnding + '  %s' + LineEnding + ']' + LineEnding
    + 'Static Fire Date Unix: %u' + LineEnding
    + 'Static Fire Date UTC: %s' + LineEnding
    + 'Success: %s' + LineEnding
    + 'To Be Dated: %s' + LineEnding
    + 'Upcoming: %s' + LineEnding
    + 'Window: %u'
    , [
      BoolToStr(GetAutoUpdate, True),
      StringReplace(
        GetCapsulesId.Text, LineEnding, LineEnding + '  ', [rfReplaceAll]),
      StringReplace(
        GetCrewId.Text, LineEnding, LineEnding + '  ', [rfReplaceAll]),
      StringReplace(
        GetCores.ToString(LineEnding + ',' + LineEnding), LineEnding, LineEnding + '  ', [rfReplaceAll]),
      DateToStr(GetDateUtc),
      DateToStr(GetDateLocal),
      DatePrecisionToCode(GetDatePrecision),
      GetDateUnix,
      GetDetails,
      StringReplace(
        GetFailures.ToString, LineEnding, LineEnding + '  ', [rfReplaceAll]),
      StringReplace(
        GetFairings.ToString, LineEnding, LineEnding + '  ', [rfReplaceAll]),
      GetFlightNumber,
      GetId,
      GetLaunchpadId,
      StringReplace(
        GetLinks.ToString, LineEnding, LineEnding + '  ', [rfReplaceAll]),
      GetName,
      BoolToStr(GetNotEarlierThan, True),
      StringReplace(
        GetPayloadsId.Text, LineEnding, LineEnding + '  ', [rfReplaceAll]),
      GetRocketId,
      StringReplace(
        GetShipsId.Text, LineEnding, LineEnding + '  ', [rfReplaceAll]),
      GetStaticFireDateUnix,
      DateToStr(GetStaticFireDateUtc),
      BoolToStr(GetSuccess, True),
      BoolToStr(GetToBeDated, True),
      BoolToStr(GetUpcoming, True),
      GetWindow
    ]);
end;

end.

