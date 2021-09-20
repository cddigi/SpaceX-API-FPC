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
  Endpoint_Helper;

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
begin
  Result := NewShipList;
  EndpointToModel(Endpoint, Result);
end;

function TShipEndpoint.One(const Id: string): IShip;
begin
  Result := NewShip;

  //JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, Id])));
  //WriteLn(JSONData.GetJSONData);
end;

end.

