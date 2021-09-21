unit VolumeInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type

  IBaseVolumeInfo = interface(IBaseModel) ['{A313D343-9BEE-4548-8D30-ACD9887EEC2E}']
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

uses
  Variants;

type

  { TVolumeInfo }

  TVolumeInfo = class(TBaseModel, IVolumeInfo)
  private
    FCubicMeters: Double;
    FCubicFeet: Double;
  private
    function GetCubicMeters: Double;
    function GetCubicFeet: Double;
  private
    procedure SetCubicMeters(AValue: Double);
    procedure SetCubicMeters(AValue: Variant);
    procedure SetCubicFeet(AValue: Double);
    procedure SetCubicFeet(AValue: Variant); 
  public
    function ToString: string; override;
  published
    property cubic_meters: Variant write SetCubicMeters;
    property cubic_feet: Variant write SetCubicFeet;
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

procedure TVolumeInfo.SetCubicMeters(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := 0;

  FCubicMeters := AValue;
end;

procedure TVolumeInfo.SetCubicFeet(AValue: Double);
begin
  FCubicFeet := AValue;
end;

procedure TVolumeInfo.SetCubicFeet(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := 0;

  FCubicFeet := AValue;
end;

function TVolumeInfo.ToString(): string;
begin
  Result := Format(''
    + '%fm^3 ('
    + '%fft^3)'
    , [
      GetCubicMeters,
      GetCubicFeet
    ]);
end;

end.

