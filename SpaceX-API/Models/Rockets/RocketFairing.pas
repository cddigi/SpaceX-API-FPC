unit RocketFairing;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SizeInfo, BaseModel;

type

  IBaseRocketFairing = interface(IBaseModel) ['{01AFDD2C-BF7A-4C3A-A8B4-02E70A29B369}']
    function GetDiameter: ISizeInfo;
    function GetHeight: ISizeInfo;

    procedure SetDiameter(AValue: ISizeInfo);
    procedure SetHeight(AValue: ISizeInfo);
  end;

  IRocketFairing = interface(IBaseRocketFairing) ['{A032C6D9-88D2-4550-8EF0-D2FB14FDA435}']
    property Diameter: ISizeInfo read GetDiameter write SetDiameter;
    property Height: ISizeInfo read GetHeight write SetHeight;
  end;

function NewRocketFairing: IRocketFairing;

implementation

uses
  JSON_Helper;

type

  { TRocketFairing }

  TRocketFairing = class(TBaseModel, IRocketFairing)
  private
    FDiameter: ISizeInfo;
    FHeight: ISizeInfo;
    function GetDiameter: ISizeInfo;
    function GetHeight: ISizeInfo;

    procedure SetDiameter(AValue: ISizeInfo);
    procedure SetHeight(AValue: ISizeInfo);
  public
    function ToString: string; override;
    procedure BuildSubObjects(const JSONData: IJSONData); override;
  end;

function NewRocketFairing: IRocketFairing;
begin
  Result := TRocketFairing.Create;
end;

{ TRocketFairing }

function TRocketFairing.GetDiameter: ISizeInfo;
begin
  Result := FDiameter;
end;

function TRocketFairing.GetHeight: ISizeInfo;
begin
  Result := FHeight;
end;

procedure TRocketFairing.SetDiameter(AValue: ISizeInfo);
begin
  FDiameter := AValue;
end;

procedure TRocketFairing.SetHeight(AValue: ISizeInfo);
begin
  FHeight := AValue;
end;

function TRocketFairing.ToString: string;
begin
  Result := Format(''
    + 'Diameter: %s' + LineEnding
    + 'Height: %s'
    , [
      GetDiameter.ToString,
      GetHeight.ToString
    ]);
end;

procedure TRocketFairing.BuildSubObjects(const JSONData: IJSONData);
var
  SubJSONData: IJSONData;
  Diameter, Height: ISizeInfo;
begin
  inherited BuildSubObjects(JSONData);

  SubJSONData := JSONData.GetPath('diameter');
  Diameter := NewSizeInfo;
  JSONToModel(SubJSONData.GetJSONData, Diameter);
  Self.FDiameter := Diameter;

  SubJSONData := JSONData.GetPath('height');
  Height := NewSizeInfo;
  JSONToModel(SubJSONData.GetJSONData, Height);
  Self.FHeight := Height;
end;

end.

