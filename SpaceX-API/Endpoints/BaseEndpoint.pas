unit BaseEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, fpjson, jsonparser, fphttpclient, opensslsockets;

type

  IJSONData = interface(IInterface) ['{68FF4A2E-4A31-4AA7-9E3D-4F06F035F85D}']
    function GetJSONData: string;
    procedure SetJSONData(AValue: string);
  end;

  IHTTPClient = interface(IInterface) ['{C6304D20-B428-49A0-B8A9-9490A4A5E271}']
    function GetRequest(AValue: string): string;
  end;

function NewJSON: IJSONData;
function NewHTTPClient: IHTTPClient;

const
  K_HOST = 'https://api.spacexdata.com/v4/';

implementation

type

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

