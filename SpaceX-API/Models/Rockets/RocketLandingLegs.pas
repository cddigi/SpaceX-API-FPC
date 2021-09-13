unit RocketLandingLegs;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type

  IBaseRocketLandingLegs = interface(IBaseModel) ['{1F2C4C51-3A40-4F12-8F81-39F77FB6BD7B}']
    function GetMaterial: string;
    function GetNumber: LongWord;

    procedure SetMaterial(AValue: string);
    procedure SetNumber(AValue: LongWord);
  end;

  IRocketLandingLegs = interface(IBaseRocketLandingLegs) ['{E6766294-6C72-470B-9265-195419DA2A81}']
    property Material: string read GetMaterial write SetMaterial;
    property Number: LongWord read GetNumber write SetNumber;
  end;

function NewRocketLandingLegs: IRocketLandingLegs;

implementation

type

  { TRocketLandingLegs }

  TRocketLandingLegs = class(TBaseModel, IRocketLandingLegs)
  private
    FMaterial: string;
    FNumber: LongWord;
  private
    function GetMaterial: string;
    function GetNumber: LongWord;
  private
    procedure SetMaterial(AValue: string);
    procedure SetNumber(AValue: LongWord);
  published
    property material: string read GetMaterial write SetMaterial;
    property number: LongWord read GetNumber write SetNumber;
  end;

function NewRocketLandingLegs: IRocketLandingLegs;
begin
  Result := TRocketLandingLegs.Create;
end;

{ TRocketLandingLegs }

function TRocketLandingLegs.GetMaterial: string;
begin
  Result := FMaterial;
end;

function TRocketLandingLegs.GetNumber: LongWord;
begin
  Result := FNumber;
end;

procedure TRocketLandingLegs.SetMaterial(AValue: string);
begin
  FMaterial := AValue;
end;

procedure TRocketLandingLegs.SetNumber(AValue: LongWord);
begin
  FNumber := AValue;
end;

end.

