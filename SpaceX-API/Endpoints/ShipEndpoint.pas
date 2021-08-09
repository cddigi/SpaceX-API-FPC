unit ShipEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Ship;

type

  IShipEndpoint = interface(IInterface) ['{6B69CB38-0BD3-4828-B63D-2A2475367E24}']
    function All: IShipList;
    function One(const Id: string): IShip;
  end;

function NewShipEndpoint: IShipEndpoint;

implementation

uses
  BaseEndpoint;

const
  Endpoint = 'ships/';

type

  { TShipEndpoint }

  TShipEndpoint = class(TInterfacedObject, IShipEndpoint)
    function All: IShipList;
    function One(const Id: string): IShip;
  end;

function NewShipEndpoint: IShipEndpoint;
begin
  Result := TShipEndpoint.Create;
end;

{ TShipEndpoint }

function TShipEndpoint.All: IShipList;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewShipList;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(Endpoint));
  WriteLn(JSONData.GetJSONData);
end;

function TShipEndpoint.One(const Id: string): IShip;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewShip;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, Id])));
  WriteLn(JSONData.GetJSONData);
end;

end.

