unit CoreEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Core;

type

  ICoreEndpoint = interface(IInterface) ['{BAEFF00E-C8A3-4D3E-B42E-7AFEAA79E37C}']
    function All: ICoreList;
    function One(const Id: string): ICore;
  end;

function NewCoreEndpoint: ICoreEndpoint;

implementation

uses
  BaseEndpoint;

const
  Endpoint = 'cores/';

type

  { TCoreEndpoint }

  TCoreEndpoint = class(TInterfacedObject, ICoreEndpoint)
    function All: ICoreList;
    function One(const Id: string): ICore;
  end;

function NewCoreEndpoint: ICoreEndpoint;
begin
  Result := TCoreEndpoint.Create;
end;

{ TCoreEndpoint }

function TCoreEndpoint.All: ICoreList;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewCoreList;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(Endpoint));
  WriteLn(JSONData.GetJSONData);
end;

function TCoreEndpoint.One(const Id: string): ICore;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewCore;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, Id])));
  WriteLn(JSONData.GetJSONData);

end;

end.

