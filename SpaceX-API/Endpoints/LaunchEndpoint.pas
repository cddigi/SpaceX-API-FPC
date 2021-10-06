unit LaunchEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Launch;

type

  ILaunchEndpoint = interface(IInterface) ['{E8332819-B2FC-478D-B818-32F7B13516CA}']
    function All: ILaunchList;
    function Latest: ILaunch;
    function Next: ILaunch;
    function One(const Id: string): ILaunch;
    function Past: ILaunchList;
    function Upcoming: ILaunchList;
  end;

function NewLaunchEndpoint: ILaunchEndpoint;

implementation

uses
  Endpoint_Helper;

const
  Endpoint = 'launches/';

type

  { TLaunchEndpoint }

  TLaunchEndpoint = class(TInterfacedObject, ILaunchEndpoint)
    function All: ILaunchList;
    function Latest: ILaunch;
    function Next: ILaunch;
    function One(const Id: string): ILaunch;
    function Past: ILaunchList;
    function Upcoming: ILaunchList;
  end;

function NewLaunchEndpoint: ILaunchEndpoint;
begin
  Result := TLaunchEndpoint.Create;
end;

{ TLaunchEndpoint }

function TLaunchEndpoint.All: ILaunchList;
begin
  Result := NewLaunchList;
  EndpointToModel(Endpoint, Result);
end;

function TLaunchEndpoint.Latest: ILaunch;
begin
  Result := NewLaunch;
  EndpointToModel(SysUtils.ConcatPaths([Endpoint, 'latest']), Result);
end;

function TLaunchEndpoint.Next: ILaunch;
begin
  Result := NewLaunch;
  EndpointToModel(SysUtils.ConcatPaths([Endpoint, 'next']), Result);
end;

function TLaunchEndpoint.One(const Id: string): ILaunch;
begin
  Result := NewLaunch;
  EndpointToModel(SysUtils.ConcatPaths([Endpoint, Id]), Result);
end;

function TLaunchEndpoint.Past: ILaunchList;
begin
  Result := NewLaunchList;
  EndpointToModel(SysUtils.ConcatPaths([Endpoint, 'past']), Result);
end;

function TLaunchEndpoint.Upcoming: ILaunchList;
begin
  Result := NewLaunchList;
  EndpointToModel(SysUtils.ConcatPaths([Endpoint, 'upcoming']), Result);
end;

end.

