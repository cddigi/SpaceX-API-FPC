unit Capsule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, CapsuleStatus;

type

  { IBaseCapsule }

  IBaseCapsule = interface(IInterface) ['{27719B67-099C-49B3-A46F-0205F69F9FD5}']
    function GetId: string;
    function GetLandLandings: LongWord;
    function GetLastUpdate: string;
    function GetLaunchesId: TStringList;
    function GetSerial: string;
    function GetStatus: TCapsuleStatus;
    function GetReuseCount: LongWord;
    function GetWaterLandings: LongWord;

    procedure SetId(AValue: string);
    procedure SetLandLandings(AValue: LongWord);
    procedure SetLastUpdate(AValue: string);
    procedure SetLaunchesId(AValue: TStringList);
    procedure SetSerial(AValue: string);
    procedure SetStatus(AValue: TCapsuleStatus);
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
    property Status: TCapsuleStatus read GetStatus write SetStatus;
    property ReuseCount: LongWord read GetReuseCount write SetReuseCount;
    property WaterLandings: LongWord read GetWaterLandings write SetWaterLandings;
  end;

  { ICapsuleList }

  ICapsuleList = interface(IInterfaceList) ['{DE141E66-FCE2-4C8F-A9A4-F5CB20D41CB5}']
  end;

function NewCapsule: ICapsule;
function NewCapsuleList: ICapsuleList;



type
  { TCapsule }
  TCapsule = class(TInterfacedObject, ICapsule)
  private
    FId: string;
    FLandLandings: LongWord;
    FLastUpdate: string;
    FLaunchesId: TStringList;
    FSerial: string;
    FStatus: TCapsuleStatus;
    FReuseCount: LongWord;
    FWaterLandings: LongWord;
    function GetId: string;
    function GetLandLandings: LongWord;
    function GetLastUpdate: string;
    function GetLaunchesId: TStringList;
    function GetSerial: string;
    function GetStatus: TCapsuleStatus;
    function GetReuseCount: LongWord;
    function GetWaterLandings: LongWord;

    procedure SetId(AValue: string);
    procedure SetLandLandings(AValue: LongWord);
    procedure SetLastUpdate(AValue: string);
    procedure SetLaunchesId(AValue: TStringList);
    procedure SetSerial(AValue: string);
    procedure SetStatus(AValue: TCapsuleStatus);
    procedure SetReuseCount(AValue: LongWord);
    procedure SetWaterLandings(AValue: LongWord);
  public
    function ToString(): string; override;
  published
    property Serial: string read GetSerial write SetSerial;
  end;

implementation

type
  { TCapsuleList }

  TCapsuleList = class(TInterfaceList, ICapsuleList)

  end;

function NewCapsule: ICapsule;
begin
  Result := TCapsule.Create;
end;

function NewCapsuleList: ICapsuleList;
begin
  Result := TCapsuleList.Create;
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

function TCapsule.GetStatus: TCapsuleStatus;
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

procedure TCapsule.SetLandLandings(AValue: LongWord);
begin
  FLandLandings := AValue;
end;

procedure TCapsule.SetLastUpdate(AValue: string);
begin
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

procedure TCapsule.SetStatus(AValue: TCapsuleStatus);
begin
  FStatus := AValue;
end;

procedure TCapsule.SetReuseCount(AValue: LongWord);
begin
  FReuseCount := AValue;
end;

procedure TCapsule.SetWaterLandings(AValue: LongWord);
begin
  FWaterLandings := AValue;
end;

function TCapsule.ToString(): string;
begin
  Result := GetSerial;
end;

end.

