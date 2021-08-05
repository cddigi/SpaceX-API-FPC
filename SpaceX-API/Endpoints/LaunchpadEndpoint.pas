unit LaunchpadEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Launchpad;

type

  { ILaunchpadEndpoint }

  ILaunchpadEndpoint = interface(IInterface) ['{16A5EB17-DE7F-4D6A-BF4D-6E66647C36D8}']
    function All: ILaunchpadList;
    function One(const Id: string): ILaunchpad;
  end;

function NewLaunchpadEndpoint: ILaunchpadEndpoint;

implementation

uses
  BaseEndpoint;

const
  Endpoint = 'launchpads/';

type

  { TLaunchEndpoint }

  TLaunchEndpoint = class(TInterfacedObject, ILaunchpadEndpoint)
    function All: ILaunchpadList;
    function One(const Id: string): ILaunchpad;
  end;

function NewLaunchpadEndpoint: ILaunchpadEndpoint;
begin
  Result := TLaunchEndpoint.Create;
end;

{ TLaunchEndpoint }

function TLaunchEndpoint.All: ILaunchpadList;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewLaunchpadList;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(Endpoint));
  WriteLn(JSONData.GetJSONData);
end;

function TLaunchEndpoint.One(const Id: string): ILaunchpad;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewLaunchpad;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, Id])));
  WriteLn(JSONData.GetJSONData);
end;

end.

