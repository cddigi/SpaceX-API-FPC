unit ThrustInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseThrustInfo = interface(IInterface) ['{01321C1D-0807-4991-93C7-B089343DB671}']
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

type

  { TThrustInfo }

  TThrustInfo = class(TInterfacedObject, IThrustInfo)
  private
    FKilonewtons: Double;
    FPoundForce: Double;
  private
    function GetKilonewtons: Double;
    function GetPoundForce: Double;
  private
    procedure SetKilonewtons(AValue: Double);
    procedure SetPoundForce(AValue: Double);
  published
    property kN: Double read GetKilonewtons write SetKilonewtons;
    property lbf: Double read GetPoundForce write SetPoundForce;
  public
    function ToString(): string; override;
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

procedure TThrustInfo.SetPoundForce(AValue: Double);
begin
  FPoundForce := AValue;
end;

function TThrustInfo.ToString(): string;
begin
  Result := GetKilonewtons.ToString() + ' kn (' + GetPoundForce.ToString() + ' lbf)';
end;

end.

