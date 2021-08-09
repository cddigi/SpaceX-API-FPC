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
  BaseEndpoint, fpjsonrtti;

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
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
  DeStreamer: TJSONDeStreamer;
begin
  // Will need to map JSON to CompanyHeadquarters and CompanyLinks sub-objects
  Result := NewCompany;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;
  JSONData.SetJSONData(HTTPClient.GetRequest(Endpoint));

  DeStreamer := TJSONDeStreamer.Create(nil);
  DeStreamer.JSONToObject(JSONData.GetJSONData, Result as TObject);

  WriteLn(Result.ToString);
end;

end.

