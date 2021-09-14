unit Core;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, CoreStatus, BaseModel, JSON_Helper;

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
    function GetStatus: TCoreStatus;

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
    procedure SetStatus(AValue: TCoreStatus);
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
    property Status: TCoreStatus read GetStatus write SetStatus;
  end;

  ICoreList = interface(IBaseModelList) ['{6280AF36-5EE5-4714-ACC7-65787AA56325}']
  end;

function NewCore: ICore;
function NewCoreList: ICoreList;

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
    FStatus: TCoreStatus;
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
    function GetStatus: TCoreStatus;

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
    procedure SetStatus(AValue: TCoreStatus);
  public
    procedure BuildSubObjects(const JSONData: IJSONData); override;
    function ToString(): string; override;
  published
    property asds_attempts: LongWord read GetAsdsAttempts write SetAsdsAttempts;
    property asds_landings: LongWord read GetAsdsLandings write SetAsdsLandings;
    property block: LongWord read GetBlock write SetBlock;
    property id: string read GetId write SetId;
    property last_update: string read GetLastUpdate write SetLastUpdate;
    //property LaunchesId: TStringList read GetLaunchesId write SetLaunchesId;
    property reuse_count: LongWord read GetReuseCount write SetReuseCount;
    property rtls_attempts: LongWord read GetRtlsAttempts write SetRtlsAttempts;
    property rtls_landings: LongWord read GetRtlsLandings write SetRtlsLandings;
    property serial: string read GetSerial write SetSerial;
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

function TCore.GetStatus: TCoreStatus;
begin
  Result := FStatus;
end;

procedure TCore.SetAsdsAttempts(AValue: LongWord);
begin
  FAsdsAttempts := AValue;
end;

procedure TCore.SetAsdsLandings(AValue: LongWord);
begin
  FAsdsLandings := AValue;
end;

procedure TCore.SetBlock(AValue: LongWord);
begin
  FBlock := AValue;
end;

procedure TCore.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TCore.SetLastUpdate(AValue: string);
begin
  FLastUpdate := AValue;
end;

procedure TCore.SetLaunchesId(AValue: TStringList);
begin
  FLaunchesId := AValue;
end;

procedure TCore.SetReuseCount(AValue: LongWord);
begin
  FReuseCount := AValue;
end;

procedure TCore.SetRtlsAttempts(AValue: LongWord);
begin
  FRtlsAttempts := AValue;
end;

procedure TCore.SetRtlsLandings(AValue: LongWord);
begin
  FRtlsLandings := AValue;
end;

procedure TCore.SetSerial(AValue: string);
begin
  FSerial := AValue;
end;

procedure TCore.SetStatus(AValue: TCoreStatus);
begin
  FStatus := AValue;
end;

procedure TCore.BuildSubObjects(const JSONData: IJSONData);
var
  SubJSONData: IJSONData;
  CoreStatus: TCoreStatus;
begin
  inherited BuildSubObjects(JSONData);

  SubJSONData := JSONData.GetPath('status');
  CoreStatus := CodeToCoreStatus(SubJSONData.GetJSONData.Split('"')[1]);
  Self.FStatus := CoreStatus;
end;

function TCore.ToString(): string;
begin
  Result := GetSerial;
end;

end.

