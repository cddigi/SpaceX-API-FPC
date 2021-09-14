unit CoreEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Core;

type

  ICoreEndpoint = interface(IInterface) ['{BAEFF00E-C8A3-4D3E-B42E-7AFEAA79E37C}']
    function All: ICoreList;
    function One(const Id: string): ICore;
  end;

function NewCoreEndpoint: ICoreEndpoint;

implementation

uses
  Endpoint_Helper;

const
  Endpoint = 'cores/';

type

  { TCoreEndpoint }

  TCoreEndpoint = class(TInterfacedObject, ICoreEndpoint)
    function All: ICoreList;
    function One(const Id: string): ICore;
  end;

function NewCoreEndpoint: ICoreEndpoint;
begin
  Result := TCoreEndpoint.Create;
end;

{ TCoreEndpoint }

function TCoreEndpoint.All: ICoreList;
begin
  Result := NewCoreList;
  EndpointToModel(Endpoint, Result);
end;

function TCoreEndpoint.One(const Id: string): ICore;
begin
  Result := NewCore;
end;

end.

