unit LaunchFailure;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseLaunchFailure = interface(IInterface) ['{26543CE7-0F08-49A6-B521-986265333702}']
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

  ILaunchFailureList = interface(IInterfaceList) ['{A9F0FE41-CB13-4DDF-9E5D-00F5826091A7}']
  end;

function NewLaunchFailure: ILaunchFailure;
function NewLaunchFailureList: ILaunchFailureList;

implementation

type

  { TLaunchFailure }

  TLaunchFailure = class(TInterfacedObject, ILaunchFailure)
  private
    FAltitude: LongWord;
    FReason: string;
    FTime: Integer;
    function GetAltitude: LongWord;
    function GetReason: string;
    function GetTime: Integer;

    procedure SetAltitude(AValue: LongWord);
    procedure SetReason(AValue: string);
    procedure SetTime(AValue: Integer);
  end;

  TLaunchFailureList = class(TInterfaceList, ILaunchFailureList);

function NewLaunchFailure: ILaunchFailure;
begin
  Result := TLaunchFailure.Create;
end;

function NewLaunchFailureList: ILaunchFailureList;
begin
  Result := TLaunchFailureList.Create;
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

procedure TLaunchFailure.SetReason(AValue: string);
begin
  FReason := AValue;
end;

procedure TLaunchFailure.SetTime(AValue: Integer);
begin
  FTime := AValue;
end;

end.

