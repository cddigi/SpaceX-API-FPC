unit Core;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel, JSON_Helper;

type

  IBaseCore = interface(IBaseModel) ['{00F93490-4378-4E56-B193-B69B5B1B9ACE}']
    function GetAsdsAttempts: LongWord;
    function GetAsdsLandings: LongWord;
    function GetBlock: LongWord;
    function GetId: string;
    function GetLastUpdate: string;
    function GetLaunchesId: TStringList;
    function GetReuseCount: LongWord;
    function GetRtlsAttempts: LongWord;
    function GetRtlsLandings: LongWord;
    function GetSerial: string;
    function GetStatus: string;

    procedure SetAsdsAttempts(AValue: LongWord);
    procedure SetAsdsLandings(AValue: LongWord);
    procedure SetBlock(AValue: LongWord);
    procedure SetId(AValue: string);
    procedure SetLastUpdate(AValue: string);
    procedure SetLaunchesId(AValue: TStringList);
    procedure SetReuseCount(AValue: LongWord);
    procedure SetRtlsAttempts(AValue: LongWord);
    procedure SetRtlsLandings(AValue: LongWord);
    procedure SetSerial(AValue: string);
    procedure SetStatus(AValue: string);
  end;

  ICore = interface(IBaseCore) ['{63DB40A2-5215-4EB9-8B52-8BA3213D8A6A}']
    property AsdsAttempts: LongWord read GetAsdsAttempts write SetAsdsAttempts;
    property AsdsLandings: LongWord read GetAsdsLandings write SetAsdsLandings;
    property Block: LongWord read GetBlock write SetBlock;
    property Id: string read GetId write SetId;
    property LastUpdate: string read GetLastUpdate write SetLastUpdate;
    property LaunchesId: TStringList read GetLaunchesId write SetLaunchesId;
    property ReuseCount: LongWord read GetReuseCount write SetReuseCount;
    property RtlsAttempts: LongWord read GetRtlsAttempts write SetRtlsAttempts;
    property RtlsLandings: LongWord read GetRtlsLandings write SetRtlsLandings;
    property Serial: string read GetSerial write SetSerial;
    property Status: string read GetStatus write SetStatus;
  end;

  ICoreList = interface(IBaseModelList) ['{6280AF36-5EE5-4714-ACC7-65787AA56325}']
  end;

  { TCoreEnumerator }

  TCoreEnumerator = class(TBaseModelEnumerator)
    function GetCurrent: ICore;
    property Current : ICore read GetCurrent;
  end;

function NewCore: ICore;
function NewCoreList: ICoreList;
operator enumerator(AList: ICoreList): TCoreEnumerator;

implementation

uses
  Variants;

type

  { TCore }

  TCore = class(TBaseModel, ICore)
  private
    FAsdsAttempts: LongWord;
    FAsdsLandings: LongWord;
    FBlock: LongWord;
    FId: string;
    FLastUpdate: string;
    FLaunchesId: TStringList;
    FReuseCount: LongWord;
    FRtlsAttempts: LongWord;
    FRtlsLandings: LongWord;
    FSerial: string;
    FStatus: string;
    function GetAsdsAttempts: LongWord;
    function GetAsdsLandings: LongWord;
    function GetBlock: LongWord;
    function GetId: string;
    function GetLastUpdate: string;
    function GetLaunchesId: TStringList;
    function GetReuseCount: LongWord;
    function GetRtlsAttempts: LongWord;
    function GetRtlsLandings: LongWord;
    function GetSerial: string;
    function GetStatus: string;

    procedure SetAsdsAttempts(AValue: LongWord);
    procedure SetAsdsAttempts(AValue: Variant);
    procedure SetAsdsLandings(AValue: LongWord);
    procedure SetAsdsLandings(AValue: Variant);
    procedure SetBlock(AValue: LongWord);
    procedure SetBlock(AValue: Variant);
    procedure SetId(AValue: string);
    procedure SetId(AValue: Variant);
    procedure SetLastUpdate(AValue: string);
    procedure SetLastUpdate(AValue: Variant);
    procedure SetLaunchesId(AValue: TStringList);
    procedure SetLaunchesId(AValue: Variant);
    procedure SetReuseCount(AValue: LongWord);
    procedure SetReuseCount(AValue: Variant);
    procedure SetRtlsAttempts(AValue: LongWord);
    procedure SetRtlsAttempts(AValue: Variant);
    procedure SetRtlsLandings(AValue: LongWord);
    procedure SetRtlsLandings(AValue: Variant);
    procedure SetSerial(AValue: string);
    procedure SetSerial(AValue: Variant);
    procedure SetStatus(AValue: string);
    procedure SetStatus(AValue: Variant);
  public
    constructor Create;
    destructor Destroy; override;
    function ToString(): string; override;
  published
    property asds_attempts: Variant write SetAsdsAttempts;
    property asds_landings: Variant write SetAsdsLandings;
    property block: Variant write SetBlock;
    property id: Variant write SetId;
    property last_update: Variant write SetLastUpdate;
    property launches: Variant write SetLaunchesId;
    property reuse_count: Variant write SetReuseCount;
    property rtls_attempts: Variant write SetRtlsAttempts;
    property rtls_landings: Variant write SetRtlsLandings;
    property serial: Variant write SetSerial;
    property status: Variant write SetStatus;
  end;

  { TCoreList }

  TCoreList = class(TBaseModelList, ICoreList)
    function NewItem: IBaseModel; override;
  end;

function NewCore: ICore;
begin
  Result := TCore.Create;
end;

function NewCoreList: ICoreList;
begin
  Result := TCoreList.Create;
end;

operator enumerator(AList: ICoreList): TCoreEnumerator;
begin
  Result := TCoreEnumerator.Create;
  Result.FList := AList;
end;

{ TCoreEnumerator }

function TCoreEnumerator.GetCurrent: ICore;
begin
  Result := FCurrent as ICore;
end;

{ TCoreList }

function TCoreList.NewItem: IBaseModel;
begin
  Result := NewCore;
end;

{ TCore }

function TCore.GetAsdsAttempts: LongWord;
begin
  Result := FAsdsAttempts;
end;

function TCore.GetAsdsLandings: LongWord;
begin
  Result := FAsdsLandings;
end;

function TCore.GetBlock: LongWord;
begin
  Result := FBlock;
end;

function TCore.GetId: string;
begin
  Result := FId;
end;

function TCore.GetLastUpdate: string;
begin
  Result := FLastUpdate;
end;

function TCore.GetLaunchesId: TStringList;
begin
  Result := FLaunchesId;
end;

function TCore.GetReuseCount: LongWord;
begin
  Result := FReuseCount;
end;

function TCore.GetRtlsAttempts: LongWord;
begin
  Result := FRtlsAttempts;
end;

function TCore.GetRtlsLandings: LongWord;
begin
  Result := FRtlsLandings;
end;

function TCore.GetSerial: string;
begin
  Result := FSerial;
end;

function TCore.GetStatus: string;
begin
  Result := FStatus;
end;

procedure TCore.SetAsdsAttempts(AValue: LongWord);
begin
  FAsdsAttempts := AValue;
end;

procedure TCore.SetAsdsAttempts(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FAsdsAttempts := -0;
  end else if VarIsNumeric(AValue) then
    FAsdsAttempts := AValue;
end;

procedure TCore.SetAsdsLandings(AValue: LongWord);
begin
  FAsdsLandings := AValue;
end;

procedure TCore.SetAsdsLandings(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FAsdsLandings := -0;
  end else if VarIsNumeric(AValue) then
    FAsdsLandings := AValue;
end;

procedure TCore.SetBlock(AValue: LongWord);
begin
  FBlock := AValue;
end;

procedure TCore.SetBlock(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FBlock := -0;
  end else if VarIsNumeric(AValue) then
    FBlock := AValue;
end;

procedure TCore.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TCore.SetId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FId := '';
  end else if VarIsStr(AValue) then
    FId := AValue;
end;

procedure TCore.SetLastUpdate(AValue: string);
begin
  FLastUpdate := AValue;
end;

procedure TCore.SetLastUpdate(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLastUpdate := '';
  end else if VarIsStr(AValue) then
    FLastUpdate := AValue;
end;

procedure TCore.SetLaunchesId(AValue: TStringList);
begin
  FLaunchesId := AValue;
end;

procedure TCore.SetLaunchesId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLaunchesId := TStringList.Create;
  end else if VarIsStr(AValue) then
    FLaunchesId.AddDelimitedText(AValue);;
end;

procedure TCore.SetReuseCount(AValue: LongWord);
begin
  FReuseCount := AValue;
end;

procedure TCore.SetReuseCount(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FReuseCount := -0;
  end else if VarIsNumeric(AValue) then
    FReuseCount := AValue;
end;

procedure TCore.SetRtlsAttempts(AValue: LongWord);
begin
  FRtlsAttempts := AValue;
end;

procedure TCore.SetRtlsAttempts(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FRtlsAttempts := -0;
  end else if VarIsNumeric(AValue) then
    FRtlsAttempts := AValue;
end;

procedure TCore.SetRtlsLandings(AValue: LongWord);
begin
  FRtlsLandings := AValue;
end;

procedure TCore.SetRtlsLandings(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FRtlsLandings := -0;
  end else if VarIsNumeric(AValue) then
    FRtlsLandings := AValue;
end;

procedure TCore.SetSerial(AValue: string);
begin
  FSerial := AValue;
end;

procedure TCore.SetSerial(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FSerial := '';
  end else if VarIsStr(AValue) then
    FSerial := AValue;
end;

procedure TCore.SetStatus(AValue: string);
begin
  FStatus := AValue;
end;

procedure TCore.SetStatus(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FStatus := '';
  end else if VarIsStr(AValue) then
    FStatus := AValue;
end;

constructor TCore.Create;
begin
  inherited Create;
  FLaunchesId := TStringList.Create;
  FLaunchesId.SkipLastLineBreak:=True;
end;

destructor TCore.Destroy;
begin
  FreeAndNil(FLaunchesId);
  inherited Destroy;
end;

function TCore.ToString(): string;
begin
  Result := Format(''
    + 'Asds Attempts: %u' + LineEnding
    + 'Asds Landings: %u' + LineEnding
    + 'Block: %u' + LineEnding
    + 'ID: %s' + LineEnding
    + 'Last Update: %u' + LineEnding
    + 'Launches: %s' + LineEnding
    + 'Reuse Count: %u' + LineEnding
    + 'Rtls Attempts: %u' + LineEnding
    + 'Rtls Landings: %u' + LineEnding
    + 'Serial: %s' + LineEnding
    + 'Status: %s'
    , [
      GetAsdsAttempts,
      GetAsdsLandings,
      GetBlock,
      GetId,
      GetLastUpdate,
      GetLaunchesId.Text,
      GetReuseCount,
      GetRtlsAttempts,
      GetRtlsLandings,
      GetSerial,
      GetStatus
    ]);
end;

end.

