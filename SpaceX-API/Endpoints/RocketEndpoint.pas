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
  Endpoint_Helper, fpjson, SizeInfo, RocketEngines, RocketFirstStage, RocketLandingLegs, MassInfo,
  RocketPotentialPayloadWeight, SecondStage;

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
var
  JSONData: TJSONData;
  JSON: string;
  Diameter, Height: ISizeInfo;
  Engines: IRocketEngines;
  FirstStage: IRocketFirstStage;
  LandingsLegs: IRocketLandingLegs;
  Mass: IMassInfo;
  PayloadWeights: IRocketPotentialPayloadWeightList;
  SecondStage: ISecondStage;
  TypeInfo: string;
begin
  Result := NewRocketList;
  JSON := EndpointToModel(Endpoint, Result as TObject);

  JSONData := GetJSON(JSON);
end;

function TRocketEndpoint.One(const Id: string): IRocket;
var
  JSONData: TJSONData;
begin
  Result := NewRocket;

  //HTTPClient := NewHTTPClient;
  //JSONData := NewJSON;

  //JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, Id])));
  //WriteLn(JSONData.GetJSONData);
end;

end.

