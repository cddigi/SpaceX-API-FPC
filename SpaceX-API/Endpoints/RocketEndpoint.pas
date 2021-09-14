unit RocketEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Rocket;

type

  IRocketEndpoint = interface(IInterface) ['{A5D91091-21F4-4671-9D04-21C57C7475B9}']
    function All: IRocketList;
    function One(const Id: string): IRocket;
  end;

function NewRocketEndpoint: IRocketEndpoint;

implementation

uses
  Endpoint_Helper, fpjson;

const
  Endpoint = 'rockets/';

type

  { TRocketEndpoint }

  TRocketEndpoint = class(TInterfacedObject, IRocketEndpoint)
    function All: IRocketList;
    function One(const Id: string): IRocket;
  end;

function NewRocketEndpoint: IRocketEndpoint;
begin
  Result := TRocketEndpoint.Create;
end;

{ TRocketEndpoint }

function TRocketEndpoint.All: IRocketList;
begin
  Result := NewRocketList;
  EndpointToModel(Endpoint, Result);
end;

function TRocketEndpoint.One(const Id: string): IRocket;
var
  JSONData: TJSONData;
begin
  Result := NewRocket;
end;

end.

