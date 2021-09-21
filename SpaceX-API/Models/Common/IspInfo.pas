unit IspInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type
  IBaseIspInfo = interface(IBaseModel) ['{AFE9B991-6AF5-4D28-9506-FCB0B3E94601}']
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

uses
  Variants;

type

  { TIspInfo }

  TIspInfo = class(TBaseModel, IIspInfo)
  private
    FVacuum: LongWord;
    FSeaLevel: LongWord;
  private
    function GetVacuum: LongWord;
    function GetSeaLevel: LongWord;
  private
    procedure SetVacuum(AValue: LongWord);
    procedure SetVacuum(AValue: Variant);
    procedure SetSeaLevel(AValue: LongWord);
    procedure SetSeaLevel(AValue: Variant);   
  public
    function ToString: string; override;
  published
    property vacuum: Variant write SetVacuum;
    property sea_level: Variant write SetSeaLevel;
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

procedure TIspInfo.SetVacuum(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := 0;

  FVacuum := AValue;
end;

procedure TIspInfo.SetSeaLevel(AValue: LongWord);
begin
  FSeaLevel := AValue;
end;

procedure TIspInfo.SetSeaLevel(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := 0;

  FSeaLevel := AValue;
end;

function TIspInfo.ToString: string;
begin
  Result := Format(''
    + '%f Isp, '
    + '%f Isp'
    , [
      GetSeaLevel,
      GetVacuum
    ]);
end;

end.

