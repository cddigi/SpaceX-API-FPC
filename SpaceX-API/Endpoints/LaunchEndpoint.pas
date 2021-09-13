unit LaunchEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Launch;

type

  ILaunchEndpoint = interface(IInterface) ['{E8332819-B2FC-478D-B818-32F7B13516CA}']
    function All: ILaunchList;
    function Latest: ILaunch;
    function Next: ILaunch;
    function One(const Id: string): ILaunch;
    function Past: ILaunchList;
    function Upcoming: ILaunchList;
  end;

function NewLaunchEndpoint: ILaunchEndpoint;

implementation

uses
  BaseEndpoint;

const
  Endpoint = 'launches/';

type

  { TLaunchEndpoint }

  TLaunchEndpoint = class(TInterfacedObject, ILaunchEndpoint)
    function All: ILaunchList;
    function Latest: ILaunch;
    function Next: ILaunch;
    function One(const Id: string): ILaunch;
    function Past: ILaunchList;
    function Upcoming: ILaunchList;
  end;

function NewLaunchEndpoint: ILaunchEndpoint;
begin
  Result := TLaunchEndpoint.Create;
end;

{ TLaunchEndpoint }

function TLaunchEndpoint.All: ILaunchList;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewLaunchList;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(Endpoint));
  WriteLn(JSONData.GetJSONData);
end;

function TLaunchEndpoint.Latest: ILaunch;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewLaunch;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, 'latest'])));
  WriteLn(JSONData.GetJSONData);
end;

function TLaunchEndpoint.Next: ILaunch;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewLaunch;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, 'next'])));
  WriteLn(JSONData.GetJSONData);
end;

function TLaunchEndpoint.One(const Id: string): ILaunch;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewLaunch;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, Id])));
  WriteLn(JSONData.GetJSONData);
end;

function TLaunchEndpoint.Past: ILaunchList;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewLaunchList;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, 'past'])));
  WriteLn(JSONData.GetJSONData);
end;

function TLaunchEndpoint.Upcoming: ILaunchList;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewLaunchList;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, 'upcoming'])));
  WriteLn(JSONData.GetJSONData);
end;

end.

