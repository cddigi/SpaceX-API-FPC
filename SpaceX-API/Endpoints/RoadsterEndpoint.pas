unit RoadsterEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Roadster;

type

  IRoadsterEndpoint = interface(IInterface) ['{7FF4DAB2-86C0-4E25-A5D8-A23EA5CFE57A}']
    function All: IRoadster;
  end;

function NewRoadsterEndpoint: IRoadsterEndpoint;

implementation

uses
  Endpoint_Helper;

const
  Endpoint = 'roadster/';

type

  { TRoadsterEndpoint }

  TRoadsterEndpoint = class(TInterfacedObject, IRoadsterEndpoint)
    function All: IRoadster;
  end;

function NewRoadsterEndpoint: IRoadsterEndpoint;
begin
  Result := TRoadsterEndpoint.Create;
end;

{ TRoadsterEndpoint }

function TRoadsterEndpoint.All: IRoadster;
var
  JSON: string;
begin
  Result := NewRoadster;
  JSON := EndpointToModel(Endpoint, Result as TObject);
  //WriteLn(JSON);
end;

end.

