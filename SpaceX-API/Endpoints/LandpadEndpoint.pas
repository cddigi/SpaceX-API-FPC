unit LandpadEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Landpad;

type

  ILandpadEndpoint = interface(IInterface) ['{02BEB550-CE84-4ED7-A694-6DFB19F19907}']
    function All: ILandpadList;
    function One(const Id: string): ILandpad;
  end;

function NewLandpadEndpoint: ILandpadEndpoint;

implementation

uses
  Endpoint_Helper;

const
  Endpoint = 'landpads/';

type

  { TLandpadEndpoint }

  TLandpadEndpoint = class(TInterfacedObject, ILandpadEndpoint)
    function All: ILandpadList;
    function One(const Id: string): ILandpad;
  end;

function NewLandpadEndpoint: ILandpadEndpoint;
begin
  Result := TLandpadEndpoint.Create;
end;

{ TLandpadEndpoint }

function TLandpadEndpoint.All: ILandpadList;
begin
  Result := NewLandpadList;
  EndpointToModel(Endpoint, Result);
end;

function TLandpadEndpoint.One(const Id: string): ILandpad;
begin
  Result := NewLandpad;
  EndpointToModel(SysUtils.ConcatPaths([Endpoint, Id]), Result);
end;

end.

