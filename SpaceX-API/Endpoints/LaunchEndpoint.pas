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
  //JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, 'latest'])));
end;

function TLaunchEndpoint.Next: ILaunch;
begin
  Result := NewLaunch;
  //JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, 'next'])));
end;

function TLaunchEndpoint.One(const Id: string): ILaunch;
begin
  Result := NewLaunch;
  //JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, Id])));
end;

function TLaunchEndpoint.Past: ILaunchList;
begin
  Result := NewLaunchList;
  //JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, 'past'])));
end;

function TLaunchEndpoint.Upcoming: ILaunchList;
begin
  Result := NewLaunchList;
  //JSONData.SetJSONData(HTTPClient.GetRequest(SysUtils.ConcatPaths([Endpoint, 'upcoming'])));
end;

end.

