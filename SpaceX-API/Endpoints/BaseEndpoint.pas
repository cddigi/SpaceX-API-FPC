unit BaseEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, fpjson, jsonparser, fphttpclient, opensslsockets;

type

  IJSON = interface(IInterface) ['{68FF4A2E-4A31-4AA7-9E3D-4F06F035F85D}']
    function _getJSON: string;
    procedure _setJSON(AValue: string);
  end;

function NewJSON: IJSON;

implementation

type

  { TJSON }

  TJSON = class(TInterfacedObject, IJSON)
    FJSONData: TJSONData;
    function _getJSON: string;
    procedure _setJSON(AValue: string);
    destructor Destroy; override;
  end;

function NewJSON: IJSON;
begin
  Result := TJSON.Create;
end;

{ TJSON }

function TJSON._getJSON: string;
begin
  Result := FJSONData.FormatJSON();
end;

procedure TJSON._setJSON(AValue: string);
begin
  FJSONData := GetJSON(AValue);
end;

destructor TJSON.Destroy;
begin
  FJSONData.Destroy;
 inherited Destroy;
end;

end.

