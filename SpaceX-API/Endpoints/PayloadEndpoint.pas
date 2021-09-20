unit PayloadEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Payload;

type

  IPayloadEndpoint = interface(IInterface) ['{DBDD30FF-4F98-4DBC-9827-0B77FC95D82B}']
    function All: IPayloadList;
    function One(const Id: string): IPayload;
  end;

function NewPayloadEndpoint: IPayloadEndpoint;

implementation

uses
  Endpoint_Helper;

const
  Endpoint = 'payloads/';

type

  { IPayloadEndpoint }

  TPayloadEndpoint = class(TInterfacedObject, IPayloadEndpoint)
    function All: IPayloadList;
    function One(const Id: string): IPayload;
  end;

function NewPayloadEndpoint: IPayloadEndpoint;
begin
  Result := TPayloadEndpoint.Create;
end;

{ IPayloadEndpoint }

function TPayloadEndpoint.All: IPayloadList;
begin
  Result := NewPayloadList;
  EndpointToModel(Endpoint, Result);
end;

function TPayloadEndpoint.One(const Id: string): IPayload;
begin
  Result := NewPayload;
  EndpointToModel(SysUtils.ConcatPaths([Endpoint, Id]), Result);
end;

end.

