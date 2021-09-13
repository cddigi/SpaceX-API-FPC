unit IspInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  IBaseIspInfo = interface(IInterface) ['{AFE9B991-6AF5-4D28-9506-FCB0B3E94601}']
    function GetVacuum: LongWord;
    function GetSeaLevel: LongWord;

    procedure SetVacuum(AValue: LongWord);
    procedure SetSeaLevel(AValue: LongWord);
  end;

  IIspInfo = interface(IBaseIspInfo) ['{6480F0EA-0479-4BA1-89DB-2CB24D627C6C}']
    property Vacuum: LongWord read GetVacuum write SetVacuum;
    property SeaLevel: LongWord read GetSeaLevel write SetSeaLevel;
  end;

function NewIspInfo: IIspInfo;

implementation

type

  { TIspInfo }

  TIspInfo = class(TInterfacedObject, IIspInfo)
  private
    FVacuum: LongWord;
    FSeaLevel: LongWord;
  private
    function GetVacuum: LongWord;
    function GetSeaLevel: LongWord;
  private
    procedure SetVacuum(AValue: LongWord);
    procedure SetSeaLevel(AValue: LongWord);
  published
    property vacuum: LongWord read GetVacuum write SetVacuum;
    property sea_level: LongWord read GetSeaLevel write SetSeaLevel;
  end;

function NewIspInfo: IIspInfo;
begin
  Result := TIspInfo.Create;
end;

{ TIspInfo }

function TIspInfo.GetVacuum: LongWord;
begin
 Result := FVacuum;
end;

function TIspInfo.GetSeaLevel: LongWord;
begin
  Result := FSeaLevel;
end;

procedure TIspInfo.SetVacuum(AValue: LongWord);
begin
  FVacuum := AValue;
end;

procedure TIspInfo.SetSeaLevel(AValue: LongWord);
begin
  FSeaLevel := AValue;
end;

end.

