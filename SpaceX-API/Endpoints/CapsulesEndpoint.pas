unit CapsulesEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Capsule;

type

  ICapsulesEndpoint = interface(IInterface) ['{3034C771-6CC0-47E0-826D-9C4608A2D84D}']
    function All: ICapsuleList;
    function One(const Id: string): ICapsule;
  end;

function NewCapsulesEndpoint: ICapsulesEndpoint;

implementation

uses
  BaseEndpoint;

const
  Endpoint = 'capsules/';

type

  { TCapsulesEndpoint }

  TCapsulesEndpoint = class(TInterfacedObject, ICapsulesEndpoint)
    function All: ICapsuleList;
    function One(const Id: string): ICapsule;
  end;

function NewCapsulesEndpoint: ICapsulesEndpoint;
begin
  Result := TCapsulesEndpoint.Create;
end;

{ TCapsulesEndpoint }

function TCapsulesEndpoint.All: ICapsuleList;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewCapsuleList;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(Endpoint));
  WriteLn(JSONData.GetJSONData);
  WriteLn();
end;

function TCapsulesEndpoint.One(const Id: string): ICapsule;
var
  Path: string;
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewCapsule;
  Path := SysUtils.ConcatPaths([Endpoint, Id]);

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(Path));
  WriteLn(JSONData.GetJSONData);
  WriteLn();
end;


end.

