unit StarlinkEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Starlink;

type

  IStarlinkEndpoint = interface(IInterface) ['{A3429FAC-1813-4095-BC2C-414A114479B0}']
    function All: IStarlinkList;
    function One(const Id: string): IStarlink;
  end;

function NewStarlinkEndpoint: IStarlinkEndpoint;

implementation

uses
  BaseEndpoint;

const
  Endpoint = 'starlink/';

type

  { TStarlinkEndpoint }

  TStarlinkEndpoint = class(TInterfacedObject, IStarlinkEndpoint)
    function All: IStarlinkList;
    function One(const Id: string): IStarlink;
  end;

function NewStarlinkEndpoint: IStarlinkEndpoint;
begin
  Result := TStarlinkEndpoint.Create;
end;

{ TStarlinkEndpoint }

function TStarlinkEndpoint.All: IStarlinkList;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
   Result := NewStarlinkList;

   HTTPClient := NewHTTPClient;
   JSONData := NewJSON;

   JSONData.SetJSONData(HTTPClient.GetRequest(Endpoint));
   WriteLn(JSONData.GetJSONData);
end;

function TStarlinkEndpoint.One(const Id: string): IStarlink;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewStarlink;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, Id])));
  WriteLn(JSONData.GetJSONData);
end;

end.

