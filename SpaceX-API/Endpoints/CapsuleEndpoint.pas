unit CapsuleEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Capsule;

type

  ICapsuleEndpoint = interface(IInterface) ['{3034C771-6CC0-47E0-826D-9C4608A2D84D}']
    function All: ICapsuleList;
    function One(const Id: string): ICapsule;
  end;

function NewCapsuleEndpoint: ICapsuleEndpoint;

implementation

uses
  BaseEndpoint;

const
  Endpoint = 'capsules/';

type

  { TCapsulesEndpoint }

  TCapsuleEndpoint = class(TInterfacedObject, ICapsuleEndpoint)
    function All: ICapsuleList;
    function One(const Id: string): ICapsule;
  end;

function NewCapsuleEndpoint: ICapsuleEndpoint;
begin
  Result := TCapsuleEndpoint.Create;
end;

{ TCapsulesEndpoint }

function TCapsuleEndpoint.All: ICapsuleList;
var
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewCapsuleList;

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  JSONData.SetJSONData(HTTPClient.GetRequest(Endpoint));
  WriteLn(JSONData.GetJSONData);
end;

function TCapsuleEndpoint.One(const Id: string): ICapsule;
var
  Path, Response: string;
  HTTPClient: IHTTPClient;
  JSONData: IJSONData;
begin
  Result := NewCapsule;
  Path := SysUtils.ConcatPaths([Endpoint, Id]);

  HTTPClient := NewHTTPClient;
  JSONData := NewJSON;

  Response := HTTPClient.GetRequest(Path);
  JSONData.SetJSONData(Response);
  WriteLn(JSONData.GetJSONData);

end;


end.

