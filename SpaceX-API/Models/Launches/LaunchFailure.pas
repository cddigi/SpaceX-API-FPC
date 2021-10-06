unit LaunchFailure;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type

  IBaseLaunchFailure = interface(IBaseModel) ['{26543CE7-0F08-49A6-B521-986265333702}']
    function GetAltitude: LongWord;
    function GetReason: string;
    function GetTime: Integer;

    procedure SetAltitude(AValue: LongWord);
    procedure SetReason(AValue: string);
    procedure SetTime(AValue: Integer);
  end;

  ILaunchFailure = interface(IBaseLaunchFailure) ['{AF9D2A98-A642-42A9-A15B-BEE188E6D8D6}']
    property Altitude: LongWord read GetAltitude write SetAltitude;
    property Reason: string read GetReason write SetReason;
    property Time: Integer read GetTime write SetTime;
  end;

  ILaunchFailureList = interface(IBaseModelList) ['{A9F0FE41-CB13-4DDF-9E5D-00F5826091A7}']
  end;

function NewLaunchFailure: ILaunchFailure;
function NewLaunchFailureList: ILaunchFailureList;

implementation

uses
  Variants;

type

  { TLaunchFailure }

  TLaunchFailure = class(TBaseModel, ILaunchFailure)
  private
    FAltitude: LongWord;
    FReason: string;
    FTime: Integer;
    function GetAltitude: LongWord;
    function GetReason: string;
    function GetTime: Integer;

    procedure SetAltitude(AValue: LongWord);
    procedure SetAltitude(AValue: Variant);
    procedure SetReason(AValue: string);
    procedure SetReason(AValue: Variant);
    procedure SetTime(AValue: Integer);
    procedure SetTime(AValue: Variant);
  public
    function ToString: string; override;
  published
    property altitude: Variant write SetAltitude;
    property reason: Variant write SetReason;
    property time: Variant write SetTime;
  end;

  { TLaunchFailureList }

  TLaunchFailureList = class(TBaseModelList, ILaunchFailureList)
    function NewItem: IBaseModel; override;
  end;

function NewLaunchFailure: ILaunchFailure;
begin
  Result := TLaunchFailure.Create;
end;

function NewLaunchFailureList: ILaunchFailureList;
begin
  Result := TLaunchFailureList.Create;
end;

{ TLaunchFailureList }

function TLaunchFailureList.NewItem: IBaseModel;
begin
  Result := NewLaunchFailure;
end;

{ TLaunchFailure }

function TLaunchFailure.GetAltitude: LongWord;
begin
  Result :=  FAltitude;
end;

function TLaunchFailure.GetReason: string;
begin
  Result := FReason;
end;

function TLaunchFailure.GetTime: Integer;
begin
  Result := FTime;
end;

procedure TLaunchFailure.SetAltitude(AValue: LongWord);
begin
  FAltitude := AValue;
end;

procedure TLaunchFailure.SetAltitude(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FAltitude := -0;
  end else if VarIsNumeric(AValue) then
    FAltitude := AValue;
end;

procedure TLaunchFailure.SetReason(AValue: string);
begin
  FReason := AValue;
end;

procedure TLaunchFailure.SetReason(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FReason := '';
  end else if VarIsStr(AValue) then
    FReason := AValue;
end;

procedure TLaunchFailure.SetTime(AValue: Integer);
begin
  FTime := AValue;
end;

procedure TLaunchFailure.SetTime(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FTime := -0;
  end else if VarIsNumeric(AValue) then
    FTime := AValue;
end;

function TLaunchFailure.ToString: string;
begin
  Result := Format(''
    + 'Altitude: %u' + LineEnding
    + 'Reason: %s' + LineEnding
    + 'Time: %d'
    , [
      GetAltitude,
      GetReason,
      GetTime
    ]);
end;

end.

