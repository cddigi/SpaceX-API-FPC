unit Endpoint_Helper;

{$mode ObjFPC}{$H+}

interface

uses
 Classes, SysUtils;

function EndpointToModel(const Endpoint: string; const Model: TObject): string;
procedure JSONToModel(const JSON: string; const Model: TObject);

implementation

uses
  fpjsonrtti, fpjson, jsonparser, fphttpclient, opensslsockets, BaseModel;

type

  IJSONData = interface(IInterface) ['{E0C90586-5A87-4248-82C1-F371951A603B}']
    function Count: Integer;
    function Items(Index: Integer): IJSONData;
    function GetJSONData: string;
    procedure SetJSONData(AValue: string);
  end;

  IHTTPClient = interface(IInterface) ['{EBA0E8BA-DF22-4F24-AE98-8E71E74314DB}']
    function GetRequest(AValue: string): string;
  end;

  { TJSON }

  TJSONData = class(TInterfacedObject, IJSONData)
  private
    FJSONData: fpjson.TJSONData;
    function Count: Integer;
    function Items(Index: Integer): IJSONData;
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

function NewJSONData: IJSONData; forward;
function NewHTTPClient: IHTTPClient; forward;

const
  K_HOST = 'https://api.spacexdata.com/v4/';

function EndpointToModel(const Endpoint: string; const Model: TObject): string;
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

procedure JSONToModel(const JSON: string; const Model: TObject);
var
  Count, Idx: Integer;
  DeStreamer: TJSONDeStreamer;
  Item: IBaseModel;
  JSONData, JSONItem: IJSONData;
begin
  DeStreamer := TJSONDeStreamer.Create(nil);
  try
    if Supports(Model, IBaseModelList) then begin
      JSONData := NewJSONData;
      JSONData.SetJSONData(JSON);
      Count := JSONData.Count;

      for Idx := 0 to Count - 1 do begin
        JSONItem := JSONData.Items(Idx);
        Item := (Model as IBaseModelList).NewItem;
        WriteLn(JSONItem.GetJSONData);
        DeStreamer.JSONToObject(JSONItem.GetJSONData, Item as TObject);
        (Model as IBaseModelList).Add(Item);
      end;
    end else
      DeStreamer.JSONToObject(JSON, Model);
  finally
    DeStreamer.Free;
  end;
end;

function NewJSONData: IJSONData;
begin
  Result := TJSONData.Create;
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

{ TJSONData }

function TJSONData.Count: Integer;
begin
  Result := FJSONData.Count;
end;

function TJSONData.Items(Index: Integer): IJSONData;
var
  JSONData: TJSONData;
begin
  JSONData := TJSONData.Create;
  try
    JSONData.FJSONData := FJSONData.Items[Index];
  except
    JSONData.Free;
    raise;
  end;

  Result := JSONData;
end;

function TJSONData.GetJSONData: string;
begin
  Result := FJSONData.FormatJSON();
end;

procedure TJSONData.SetJSONData(AValue: string);
begin
  FJSONData := GetJSON(AValue);
end;

destructor TJSONData.Destroy;
begin
  FreeMemAndNil(FJSONData);
  inherited Destroy;
end;

end.

