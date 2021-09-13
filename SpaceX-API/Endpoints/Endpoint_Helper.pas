unit Endpoint_Helper;

{$mode ObjFPC}{$H+}

interface

uses
 Classes, SysUtils;

function EndpointToModel(const Endpoint: string; const Model: IInterface): string;

implementation

uses
  fphttpclient, opensslsockets, JSON_Helper;

type

  IHTTPClient = interface(IInterface) ['{EBA0E8BA-DF22-4F24-AE98-8E71E74314DB}']
    function GetRequest(AValue: string): string;
  end;

  { THTTPClient }

  THTTPClient = class(TInterfacedObject, IHTTPClient)
  private
    FHttpClient: TFPCustomHTTPClient;
    function GetRequest(AValue: string): string;
  public
    constructor Create;
    destructor Destroy; override;
  end;

function NewHTTPClient: IHTTPClient; forward;

const
  K_HOST = 'https://api.spacexdata.com/v4/';

function EndpointToModel(const Endpoint: string; const Model: IInterface): string;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  HTTPClient := NewHTTPClient;
  JSONData := NewJSONData;
  JSONData.SetJSONData(HTTPClient.GetRequest(Endpoint));
  Result := JSONData.GetJSONData;
  JSONToModel(Result, Model);
end;

function NewHTTPClient: IHTTPClient;
begin
  Result := THTTPClient.Create;
end;

{ THTTPClient }

function THTTPClient.GetRequest(AValue: string): string;
begin
  WriteLn(AValue);
  Result := FHttpClient.Get(SysUtils.ConcatPaths([K_HOST, AValue]));
end;

constructor THTTPClient.Create;
begin
 FHttpClient := TFPCustomHTTPClient.Create(nil);
end;

destructor THTTPClient.Destroy;
begin
 FHttpClient.Destroy;
 inherited Destroy;
end;

end.

