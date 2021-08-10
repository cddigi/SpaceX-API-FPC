unit Endpoint_Helper;

{$mode ObjFPC}{$H+}

interface

uses
 Classes, SysUtils;

function EndpointToModel(const Endpoint: string; const Model: TObject): string;
procedure JSONToModel(const JSON: string; const Model: TObject);

implementation

uses
  fpjsonrtti, fpjson, jsonparser, fphttpclient, opensslsockets;

type

  IJSONData = interface(IInterface) ['{E0C90586-5A87-4248-82C1-F371951A603B}']
    function GetJSONData: string;
    procedure SetJSONData(AValue: string);
  end;

  IHTTPClient = interface(IInterface) ['{EBA0E8BA-DF22-4F24-AE98-8E71E74314DB}']
    function GetRequest(AValue: string): string;
  end;

  { TJSON }

  TJSON = class(TInterfacedObject, IJSONData)
  private
    FJSONData: TJSONData;
    function GetJSONData: string;
    procedure SetJSONData(AValue: string);
  public
    destructor Destroy; override;
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

function NewJSON: IJSONData; forward;
function NewHTTPClient: IHTTPClient; forward;

const
  K_HOST = 'https://api.spacexdata.com/v4/';

function EndpointToModel(const Endpoint: string; const Model: TObject): string;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;
  JSONData.SetJSONData(HTTPClient.GetRequest(Endpoint));
  Result := JSONData.GetJSONData;
  JSONToModel(Result, Model);
end;

procedure JSONToModel(const JSON: string; const Model: TObject);
var
  DeStreamer: TJSONDeStreamer;
begin
  DeStreamer := TJSONDeStreamer.Create(nil);
  try
    DeStreamer.JSONToObject(JSON, Model);
  finally
    DeStreamer.Free;
  end;
end;

function NewJSON: IJSONData;
begin
  Result := TJSON.Create;
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

{ TJSON }

function TJSON.GetJSONData: string;
begin
  Result := FJSONData.FormatJSON();
end;

procedure TJSON.SetJSONData(AValue: string);
begin
  FJSONData := GetJSON(AValue);
end;

destructor TJSON.Destroy;
begin
  FJSONData.Free;
  inherited Destroy;
end;

end.

