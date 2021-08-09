unit CrewEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Crew;

type

  ICrewEndpoint = interface(IInterface) ['{8EE44A68-4366-4298-B89A-96C76FD1B80E}']
    function All: ICrewList;
    function One(const Id: string): ICrew;
  end;

function NewCrewEndpoint: ICrewEndpoint;

implementation

uses
  BaseEndpoint;

const
  Endpoint = 'crew/';

type

  { TCrewEndpoint }

  TCrewEndpoint = class(TInterfacedObject, ICrewEndpoint)
    function All: ICrewList;
    function One(const Id: string): ICrew;
  end;

function NewCrewEndpoint: ICrewEndpoint;
begin
  Result := TCrewEndpoint.Create;
end;

{ TCrewEndpoint }

function TCrewEndpoint.All: ICrewList;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewCrewList;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(Endpoint));
  WriteLn(JSONData.GetJSONData);
end;

function TCrewEndpoint.One(const Id: string): ICrew;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewCrew;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, Id])));
  WriteLn(JSONData.GetJSONData);
end;

end.

