unit LaunchpadEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Launchpad;

type

  { ILaunchpadEndpoint }

  ILaunchpadEndpoint = interface(IInterface) ['{16A5EB17-DE7F-4D6A-BF4D-6E66647C36D8}']
    function All: ILaunchpadList;
    function One(const Id: string): ILaunchpad;
  end;

function NewLaunchpadEndpoint: ILaunchpadEndpoint;

implementation

uses
  Endpoint_Helper;

const
  Endpoint = 'launchpads/';

type

  { TLaunchEndpoint }

  TLaunchEndpoint = class(TInterfacedObject, ILaunchpadEndpoint)
    function All: ILaunchpadList;
    function One(const Id: string): ILaunchpad;
  end;

function NewLaunchpadEndpoint: ILaunchpadEndpoint;
begin
  Result := TLaunchEndpoint.Create;
end;

{ TLaunchEndpoint }

function TLaunchEndpoint.All: ILaunchpadList;
begin
  Result := NewLaunchpadList;
  EndpointToModel(Endpoint, Result);
end;

function TLaunchEndpoint.One(const Id: string): ILaunchpad;
begin
  Result := NewLaunchpad;
  EndpointToModel(SysUtils.ConcatPaths([Endpoint, Id]), Result);
end;

end.

