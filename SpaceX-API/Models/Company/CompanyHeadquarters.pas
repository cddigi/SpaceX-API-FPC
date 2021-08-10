unit CompanyHeadquarters;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseCompanyHeadquarters = interface(IInterface) ['{78384C70-2A65-4103-93DA-917B5F09A390}']
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

type

  { TCompanyHeadquarters }

  TCompanyHeadquarters = class(TInterfacedObject, ICompanyHeadquarters)
  private
    FAddress: string;
    FCity: string;
    FState: string;

    function GetAddress: string;
    function GetCity: string;
    function GetState: string;

    procedure SetAddress(AValue: string);
    procedure SetCity(AValue: string);
    procedure SetState(AValue: string);

  published
    property address: string read GetAddress write SetAddress;
    property city: string read GetCity write SetCity;
    property state: string read GetState write SetState;
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

procedure TCompanyHeadquarters.SetCity(AValue: string);
begin
  FCity := AValue;
end;

procedure TCompanyHeadquarters.SetState(AValue: string);
begin
  FState := AValue;
end;

end.

