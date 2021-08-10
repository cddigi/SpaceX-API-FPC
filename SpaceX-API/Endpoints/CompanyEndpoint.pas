unit CompanyEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Company;

type

  ICompanyEndpoint = interface(IInterface) ['{CD33E2AD-201B-4D1A-9F45-A1B74EB8BF33}']
    function Get: ICompany;
  end;

function NewCompanyEndpoint: ICompanyEndpoint;

implementation

uses
  Endpoint_Helper, fpjson, CompanyHeadquarters, CompanyLinks;

const
  Endpoint = 'company/';

type

  { TCompanyEndpoint }

  TCompanyEndpoint = class(TInterfacedObject, ICompanyEndpoint)
    function Get: ICompany;
  end;

function NewCompanyEndpoint: ICompanyEndpoint;
begin
  Result := TCompanyEndpoint.Create;
end;

{ TCompanyEndpoint }

function TCompanyEndpoint.Get: ICompany;
var
  Headquarters: ICompanyHeadquarters;
  JSON: string;
  JSONData: TJSONData;
  Links: ICompanyLinks;
begin
  Result := NewCompany;
  JSON := EndpointToModel(Endpoint, Result as TObject);

  JSONData := GetJSON(JSON);
  JSONData := JSONData.GetPath('headquarters');
  Headquarters := NewCompanyHeadquarters;
  JSONToModel(JSONData.FormatJSON, Headquarters as TObject);
  Result.Headquarters := Headquarters;

  JSONData := GetJSON(JSON);
  JSONData := JSONData.GetPath('links');
  Links := NewCompanyLinks;
  JSONToModel(JSONData.FormatJSON, Links as TObject);
  Result.Links := Links;
end;

end.

