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
  Endpoint_Helper, fpjson;

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
begin
  Result := NewCapsuleList;
  EndpointToModel(Endpoint, Result);
end;

function TCapsuleEndpoint.One(const Id: string): ICapsule;
var
  Path, Response: string;
begin
  Result := NewCapsule;
  Path := SysUtils.ConcatPaths([Endpoint, Id]);

  //Response := HTTPClient.GetRequest(Path);
  //JSONData.SetJSONData(Response);
  //WriteLn(JSONData.GetJSONData);

end;


end.

