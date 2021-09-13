unit VolumeInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseVolumeInfo = interface(IInterface) ['{A313D343-9BEE-4548-8D30-ACD9887EEC2E}']
    function GetCubicMeters: Double;
    function GetCubicFeet: Double;

    procedure SetCubicMeters(AValue: Double);
    procedure SetCubicFeet(AValue: Double);
  end;

  IVolumeInfo = interface(IBaseVolumeInfo) ['{35292449-0298-42C9-B54B-2A60D7AAAFA3}']
    property CubicMeters: Double read GetCubicMeters write SetCubicMeters;
    property CubicFeet: Double read GetCubicFeet write SetCubicFeet;
  end;

function NewVolumeInfo: IVolumeInfo;

implementation

type

  { TVolumeInfo }

  TVolumeInfo = class(TInterfacedObject, IVolumeInfo)
  private
    FCubicMeters: Double;
    FCubicFeet: Double;
  private
    function GetCubicMeters: Double;
    function GetCubicFeet: Double;
  private
    procedure SetCubicMeters(AValue: Double);
    procedure SetCubicFeet(AValue: Double);
  published
    property cubic_meters: Double read GetCubicMeters write SetCubicMeters;
    property cubic_feet: Double read GetCubicFeet write SetCubicFeet;
  public
    function ToString(): string; override;
  end;

function NewVolumeInfo: IVolumeInfo;
begin
  Result := TVolumeInfo.Create;
end;

function TVolumeInfo.GetCubicMeters: Double;
begin
  Result := FCubicMeters;
end;

function TVolumeInfo.GetCubicFeet: Double;
begin
  Result := FCubicFeet;
end;

procedure TVolumeInfo.SetCubicMeters(AValue: Double);
begin
  FCubicMeters := AValue;
end;

procedure TVolumeInfo.SetCubicFeet(AValue: Double);
begin
  FCubicFeet := AValue;
end;

function TVolumeInfo.ToString(): string;
begin
  Result := GetCubicFeet.ToString() + ' m^3 ' + GetCubicFeet.ToString() + ' ft^3';
end;

end.

