unit DragonEndpoint;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dragon;

type

  { IDragonEndpoint }

  IDragonEndpoint = interface ['{7FBDA707-A648-4843-AD7D-25B2E845A879}']
    function All: IDragonList;
    function One(const Id: string): IDragon;
  end;

function NewDragonEndpoint: IDragonEndpoint;

implementation

uses
  Endpoint_Helper;

const
  Endpoint = 'dragons/';

type

  { TDragonEndpoint }

  TDragonEndpoint = class(TInterfacedObject, IDragonEndpoint)
    function All: IDragonList;
    function One(const Id: string): IDragon;
  end;

function NewDragonEndpoint: IDragonEndpoint;
begin
  Result := TDragonEndpoint.Create;
end;

{ TDragonEndpoint }

function TDragonEndpoint.All: IDragonList;
var
  JSON: string;
begin
  Result := NewDragonList;
  JSON := EndpointToModel(Endpoint, Result);
  WriteLn(JSON)
end;

function TDragonEndpoint.One(const Id: string): IDragon;
var
  JSON, Path: string;
begin
  Result := NewDragon;
  Path := SysUtils.ConcatPaths([Endpoint, Id]);
  JSON := EndpointToModel(Path, Result);
end;

end.

