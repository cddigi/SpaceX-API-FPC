unit DragonEndpoint;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dragon;

type

  { IDragonEndpoint }

  IDragonEndpoint = interface ['{7FBDA707-A648-4843-AD7D-25B2E845A879}']
    function All: IDragonList;
    function One(const Id: string): IDragon;
  end;

function NewDragonEndpoint: IDragonEndpoint;

implementation

uses
  BaseEndpoint;

const
  Endpoint = 'dragons/';

type

  { TDragonEndpoint }

  TDragonEndpoint = class(TInterfacedObject, IDragonEndpoint)
    function All: IDragonList;
    function One(const Id: string): IDragon;
  end;

function NewDragonEndpoint: IDragonEndpoint;
begin
  Result := TDragonEndpoint.Create;
end;

{ TDragonEndpoint }

function TDragonEndpoint.All: IDragonList;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewDragonList;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(Endpoint));
  WriteLn(JSONData.GetJSONData);
  // GET https://api.spacexdata.com/v4/dragons/
end;

function TDragonEndpoint.One(const Id: string): IDragon;
var
  Path: string;
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewDragon;
  Path := SysUtils.ConcatPaths([Endpoint, Id]);

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(Path));
  WriteLn(JSONData.GetJSONData);
  // GET https://api.spacexdata.com/v4/dragons/[id]
end;

end.

