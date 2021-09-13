unit PayloadEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Payload;

type

  IPayloadEndpoint = interface(IInterface) ['{DBDD30FF-4F98-4DBC-9827-0B77FC95D82B}']
    function All: IPayloadList;
    function One(const Id: string): IPayload;
  end;

function NewPayloadEndpoint: IPayloadEndpoint;

implementation

uses
  BaseEndpoint;

const
  Endpoint = 'payloads/';

type

  { IPayloadEndpoint }

  TPayloadEndpoint = class(TInterfacedObject, IPayloadEndpoint)
    function All: IPayloadList;
    function One(const Id: string): IPayload;
  end;

function NewPayloadEndpoint: IPayloadEndpoint;
begin
  Result := TPayloadEndpoint.Create;
end;

{ IPayloadEndpoint }

function TPayloadEndpoint.All: IPayloadList;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewPayloadList;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(Endpoint));
  WriteLn(JSONData.GetJSONData);
end;

function TPayloadEndpoint.One(const Id: string): IPayload;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewPayload;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, Id])));
  WriteLn(JSONData.GetJSONData);
end;

end.

