unit CompanyHeadquarters;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type

  IBaseCompanyHeadquarters = interface(IBaseModel) ['{78384C70-2A65-4103-93DA-917B5F09A390}']
    function GetAddress: string;
    function GetCity: string;
    function GetState: string;

    procedure SetAddress(AValue: string);
    procedure SetCity(AValue: string);
    procedure SetState(AValue: string);
  end;

  ICompanyHeadquarters = interface(IBaseCompanyHeadquarters) ['{230F0DE6-D825-4600-A4CC-E568C88E1D86}']
    property Address: string read GetAddress write SetAddress;
    property City: string read GetCity write SetCity;
    property State: string read GetState write SetState;
  end;

function NewCompanyHeadquarters: ICompanyHeadquarters;

implementation

uses
  Variants;

type

  { TCompanyHeadquarters }

  TCompanyHeadquarters = class(TBaseModel, ICompanyHeadquarters)
  private
    FAddress: string;
    FCity: string;
    FState: string;
  private
    function GetAddress: string;
    function GetCity: string;
    function GetState: string;
  private
    procedure SetAddress(AValue: string);
    procedure SetAddress(AValue: Variant);
    procedure SetCity(AValue: string);
    procedure SetCity(AValue: Variant);
    procedure SetState(AValue: string);
    procedure SetState(AValue: Variant);
  public
    function ToString: string; override;
  published
    property address: Variant write SetAddress;
    property city: Variant write SetCity;
    property state: Variant write SetState;
  end;

function NewCompanyHeadquarters: ICompanyHeadquarters;
begin
  Result := TCompanyHeadquarters.Create;
end;

{ TCompanyHeadquarters }

function TCompanyHeadquarters.GetAddress: string;
begin
  Result := FAddress;
end;

function TCompanyHeadquarters.GetCity: string;
begin
  Result := FCity;
end;

function TCompanyHeadquarters.GetState: string;
begin
  Result := FState;
end;

procedure TCompanyHeadquarters.SetAddress(AValue: string);
begin
  FAddress := AValue;
end;

procedure TCompanyHeadquarters.SetAddress(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := '';

  FAddress := AValue;
end;

procedure TCompanyHeadquarters.SetCity(AValue: string);
begin
  FCity := AValue;
end;

procedure TCompanyHeadquarters.SetCity(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := '';

  FCity := AValue;
end;

procedure TCompanyHeadquarters.SetState(AValue: string);
begin
  FState := AValue;
end;

procedure TCompanyHeadquarters.SetState(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := '';

  FState := AValue;
end;

function TCompanyHeadquarters.ToString: string;
begin
  Result := Format('%s, %s, %s', [GetAddress, GetCity, GetState]);
end;

end.

