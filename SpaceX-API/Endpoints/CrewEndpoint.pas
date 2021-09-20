unit CrewEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Crew;

type

  ICrewEndpoint = interface(IInterface) ['{8EE44A68-4366-4298-B89A-96C76FD1B80E}']
    function All: ICrewList;
    function One(const Id: string): ICrew;
  end;

function NewCrewEndpoint: ICrewEndpoint;

implementation

uses
  Endpoint_Helper;

const
  Endpoint = 'crew/';

type

  { TCrewEndpoint }

  TCrewEndpoint = class(TInterfacedObject, ICrewEndpoint)
    function All: ICrewList;
    function One(const Id: string): ICrew;
  end;

function NewCrewEndpoint: ICrewEndpoint;
begin
  Result := TCrewEndpoint.Create;
end;

{ TCrewEndpoint }

function TCrewEndpoint.All: ICrewList;
begin
  Result := NewCrewList;
  EndpointToModel(Endpoint, Result);
end;

function TCrewEndpoint.One(const Id: string): ICrew;
begin
  Result := NewCrew;
  EndpointToModel(SysUtils.ConcatPaths([Endpoint, Id]), Result);
end;

end.

