unit Capsule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel, JSON_Helper;

type

  { IBaseCapsule }

  IBaseCapsule = interface(IBaseModel) ['{27719B67-099C-49B3-A46F-0205F69F9FD5}']
    function GetId: string;
    function GetLandLandings: LongWord;
    function GetLastUpdate: string;
    function GetLaunchesId: TStringList;
    function GetSerial: string;
    function GetStatus: string;
    function GetReuseCount: LongWord;
    function GetWaterLandings: LongWord;

    procedure SetId(AValue: string);
    procedure SetLandLandings(AValue: LongWord);
    procedure SetLastUpdate(AValue: string);
    procedure SetLaunchesId(AValue: TStringList);
    procedure SetSerial(AValue: string);
    procedure SetStatus(AValue: string);
    procedure SetReuseCount(AValue: LongWord);
    procedure SetWaterLandings(AValue: LongWord);
  end;

  { ICapsule }

  ICapsule = interface(IBaseCapsule) ['{D8BAAA50-F1AC-4DE8-A9B7-1EA66152D68C}']
    property Id: string read GetId write SetId;
    property LandLandings: LongWord read GetLandLandings write SetLandLandings;
    property LastUpdate: string read GetLastUpdate write SetLastUpdate;
    property LaunchesId: TStringList read GetLaunchesId write SetLaunchesId;
    property Serial: string read GetSerial write SetSerial;
    property Status: string read GetStatus write SetStatus;
    property ReuseCount: LongWord read GetReuseCount write SetReuseCount;
    property WaterLandings: LongWord read GetWaterLandings write SetWaterLandings;
  end;

  { ICapsuleList }

  ICapsuleList = interface(IBaseModelList) ['{DE141E66-FCE2-4C8F-A9A4-F5CB20D41CB5}']
  end;

  { TCapsuleEnumerator }

  TCapsuleEnumerator = class(TBaseModelEnumerator)
    function GetCurrent: ICapsule;
    property Current : ICapsule read GetCurrent;
  end;

function NewCapsule: ICapsule;
function NewCapsuleList: ICapsuleList;
operator enumerator(AList: ICapsuleList): TCapsuleEnumerator;

implementation

uses
  Variants;

type

  { TCapsule }

  TCapsule = class(TBaseModel, ICapsule)
  private
    FId: string;
    FLandLandings: LongWord;
    FLastUpdate: string;
    FLaunchesId: TStringList;
    FSerial: string;
    FStatus: string;
    FReuseCount: LongWord;
    FWaterLandings: LongWord;
  private
    function GetId: string;
    function GetLandLandings: LongWord;
    function GetLastUpdate: string;
    function GetLaunchesId: TStringList;
    function GetSerial: string;
    function GetStatus: string;
    function GetReuseCount: LongWord;
    function GetWaterLandings: LongWord;
  private
    procedure SetId(AValue: string);
    procedure SetLandLandings(AValue: LongWord);
    procedure SetLastUpdate(AValue: string);
    procedure SetLaunchesId(AValue: TStringList);
    procedure SetSerial(AValue: string);
    procedure SetStatus(AValue: string);
    procedure SetReuseCount(AValue: LongWord);
    procedure SetWaterLandings(AValue: LongWord);
  private
    procedure SetId(AValue: Variant);
    procedure SetLandLandings(AValue: Variant);
    procedure SetLastUpdate(AValue: Variant);
    procedure SetSerial(AValue: Variant);    
    procedure SetStatus(AValue: Variant);
    procedure SetReuseCount(AValue: Variant);
    procedure SetWaterLandings(AValue: Variant);
  public
    function ToString: string; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property id: Variant write SetId;
    property land_landings: Variant write SetLandLandings;
    property last_update: Variant write SetLastUpdate;
    property launches_id: TStringList read GetLaunchesId write SetLaunchesId;
    property serial: Variant write SetSerial;
    property status: Variant write SetStatus;
    property reuse_count: Variant write SetReuseCount;
    property water_landings: Variant write SetWaterLandings;
  end;

  { TCapsuleList }

  TCapsuleList = class(TBaseModelList, ICapsuleList)
    function NewItem: IBaseModel; override;
  end;

function NewCapsule: ICapsule;
begin
  Result := TCapsule.Create;
end;

function NewCapsuleList: ICapsuleList;
begin
  Result := TCapsuleList.Create;
end;

operator enumerator(AList: ICapsuleList): TCapsuleEnumerator;
begin
  Result := TCapsuleEnumerator.Create;
  Result.FList := AList;
end;

{ TCapsuleEnumerator }

function TCapsuleEnumerator.GetCurrent: ICapsule;
begin
  Result := FCurrent as ICapsule;
end;

{ TCapsuleList }

function TCapsuleList.NewItem: IBaseModel;
begin
  Result := NewCapsule;
end;

{ TCapsule }

function TCapsule.GetId: string;
begin
 Result := FId;
end;

function TCapsule.GetLandLandings: LongWord;
begin
  Result := FLandLandings;
end;

function TCapsule.GetLastUpdate: string;
begin
  Result := FLastUpdate;
end;

function TCapsule.GetLaunchesId: TStringList;
begin
  Result := FLaunchesId;
end;

function TCapsule.GetSerial: string;
begin
  Result := FSerial;
end;

function TCapsule.GetStatus: string;
begin
  Result := FStatus;
end;

function TCapsule.GetReuseCount: LongWord;
begin
  Result := FReuseCount;
end;

function TCapsule.GetWaterLandings: LongWord;
begin
  Result := FWaterLandings;
end;

procedure TCapsule.SetId(AValue: string);
begin
  FId := AValue;
end;                

procedure TCapsule.SetId(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := '';

  FId := AValue;
end;

procedure TCapsule.SetLandLandings(AValue: LongWord);
begin
  FLandLandings := AValue;
end;                    

procedure TCapsule.SetLandLandings(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := 0;

  FLandLandings := AValue;
end;

procedure TCapsule.SetLastUpdate(AValue: string);
begin
  FLastUpdate := AValue;
end;

procedure TCapsule.SetLastUpdate(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := '';

  FLastUpdate := AValue;
end;

procedure TCapsule.SetLaunchesId(AValue: TStringList);
begin
  FLaunchesId := AValue;
end;

procedure TCapsule.SetSerial(AValue: string);
begin
  FSerial := AValue;
end;

procedure TCapsule.SetSerial(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := '';

  FSerial := AValue;
end;    

procedure TCapsule.SetStatus(AValue: string);
begin
  FStatus := AValue;
end;

procedure TCapsule.SetStatus(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := '';

  FStatus := AValue;
end;

procedure TCapsule.SetReuseCount(AValue: LongWord);
begin
  FReuseCount := AValue;
end;                

procedure TCapsule.SetReuseCount(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := 0;

  FReuseCount := AValue;
end;

procedure TCapsule.SetWaterLandings(AValue: LongWord);
begin
  FWaterLandings := AValue;
end;                        

procedure TCapsule.SetWaterLandings(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := 0;

  FWaterLandings := AValue;
end;

constructor TCapsule.Create;
begin
  inherited Create;
  FLaunchesId := TStringList.Create;
  FLaunchesId.LineBreak := ', ';
  FLaunchesId.SkipLastLineBreak:=True;
end;

destructor TCapsule.Destroy;
begin
  FreeAndNil(FLaunchesId);
  inherited Destroy;
end;

function TCapsule.ToString: string;
begin
  Result := Format(''
    + 'ID: %s' + LineEnding
    + 'Land Landings: %u' + LineEnding
    + 'Last Update: %s' + LineEnding
    + 'Launches: %s' + LineEnding
    + 'Reuse Count: %u' + LineEnding
    + 'Serial: %s' + LineEnding
    + 'Status: %s' + LineEnding
    + 'Water Landings: %u'
    , [
      GetId,
      GetLandLandings,
      GetLastUpdate,
      GetLaunchesId.Text,
      GetReuseCount,
      GetSerial,
      GetStatus,
      GetWaterLandings
    ]);
end;

end.

