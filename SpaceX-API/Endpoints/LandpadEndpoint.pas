unit LandpadEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Landpad;

type

  ILandpadEndpoint = interface(IInterface) ['{02BEB550-CE84-4ED7-A694-6DFB19F19907}']
    function All: ILandpadList;
    function One(const Id: string): ILandpad;
  end;

function NewLandpadEndpoint: ILandpadEndpoint;

implementation

uses
  BaseEndpoint;

const
  Endpoint = 'landpads/';

type

  { TLandpadEndpoint }

  TLandpadEndpoint = class(TInterfacedObject, ILandpadEndpoint)
    function All: ILandpadList;
    function One(const Id: string): ILandpad;
  end;

function NewLandpadEndpoint: ILandpadEndpoint;
begin
  Result := TLandpadEndpoint.Create;
end;

{ TLandpadEndpoint }

function TLandpadEndpoint.All: ILandpadList;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewLandpadList;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(Endpoint));
  WriteLn(JSONData.GetJSONData)
end;

function TLandpadEndpoint.One(const Id: string): ILandpad;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewLandpad;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, Id])));
  WriteLn(JSONData.GetJSONData)
end;

end.

