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

const
  Host = 'https://api.spacexdata.com/v4/';
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
  Dragon: IDragon;
  Path: string;
begin
  Result := NewDragonList;
  Path := SysUtils.ConcatPaths([Host, Endpoint]);
  WriteLn(Path);
  Dragon := One('hello');
  Result.Add(Dragon);
  // GET https://api.spacexdata.com/v4/dragons/
end;

function TDragonEndpoint.One(const Id: string): IDragon;
var
  Path: string;
begin
  Result := NewDragon;
  Path := SysUtils.ConcatPaths([Host, Endpoint, Id]);
  WriteLn(Path);
  // GET https://api.spacexdata.com/v4/dragons/[id]
end;

end.

