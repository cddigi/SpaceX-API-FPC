unit ThrustInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type

  IBaseThrustInfo = interface(IBaseModel) ['{01321C1D-0807-4991-93C7-B089343DB671}']
    function GetKilonewtons: Double;
    function GetPoundForce: Double;

    procedure SetKilonewtons(AValue: Double);
    procedure SetPoundForce(AValue: Double);
  end;

  IThrustInfo = interface(IBaseThrustInfo) ['{1F955138-D0FF-4A69-8236-52096CEA1978}']
    property Kilonewtons: Double read GetKilonewtons write SetKilonewtons;
    property PoundForce: Double read GetPoundForce write SetPoundForce;
  end;

function NewThrustInfo: IThrustInfo;

implementation

uses
  Variants;

type

  { TThrustInfo }

  TThrustInfo = class(TBaseModel, IThrustInfo)
  private
    FKilonewtons: Double;
    FPoundForce: Double;
  private
    function GetKilonewtons: Double;
    function GetPoundForce: Double;
  private
    procedure SetKilonewtons(AValue: Double);
    procedure SetKilonewtons(AValue: Variant);
    procedure SetPoundForce(AValue: Double);
    procedure SetPoundForce(AValue: Variant);
  public
    function ToString: string; override;
  published
    property kN: Variant write SetKilonewtons;
    property lbf: Variant write SetPoundForce;
  end;

function NewThrustInfo: IThrustInfo;
begin
  Result := TThrustInfo.Create;
end;

{ TThrustInfo }

function TThrustInfo.GetKilonewtons: Double;
begin
  Result := FKilonewtons;
end;

function TThrustInfo.GetPoundForce: Double;
begin
  Result := FPoundForce;
end;

procedure TThrustInfo.SetKilonewtons(AValue: Double);
begin
  FKilonewtons := AValue;
end;

procedure TThrustInfo.SetKilonewtons(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := 0;

  FKilonewtons := AValue;
end;

procedure TThrustInfo.SetPoundForce(AValue: Double);
begin
  FPoundForce := AValue;
end;

procedure TThrustInfo.SetPoundForce(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := 0;

  FPoundForce := AValue;
end;

function TThrustInfo.ToString: string;
begin
  Result := Format(''
    + '%fkN ('
    + '%flbf)'
    , [
      GetKilonewtons,
      GetPoundForce
    ]);
end;

end.

