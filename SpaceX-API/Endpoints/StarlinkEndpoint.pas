unit StarlinkEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Starlink;

type

  IStarlinkEndpoint = interface(IInterface) ['{A3429FAC-1813-4095-BC2C-414A114479B0}']
    function All: IStarlinkList;
    function One(const Id: string): IStarlink;
  end;

function NewStarlinkEndpoint: IStarlinkEndpoint;

implementation

uses
  Endpoint_Helper;

const
  Endpoint = 'starlink/';

type

  { TStarlinkEndpoint }

  TStarlinkEndpoint = class(TInterfacedObject, IStarlinkEndpoint)
    function All: IStarlinkList;
    function One(const Id: string): IStarlink;
  end;

function NewStarlinkEndpoint: IStarlinkEndpoint;
begin
  Result := TStarlinkEndpoint.Create;
end;

{ TStarlinkEndpoint }

function TStarlinkEndpoint.All: IStarlinkList;
begin
   Result := NewStarlinkList;
   EndpointToModel(Endpoint, Result);
end;

function TStarlinkEndpoint.One(const Id: string): IStarlink;
begin
  Result := NewStarlink;
  EndpointToModel(SysUtils.ConcatPaths([Endpoint, Id]), Result);
end;

end.

