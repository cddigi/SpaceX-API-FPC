unit BaseEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, fpjson, jsonparser, fphttpclient, opensslsockets;

type

  IJSONData = interface(IInterface) ['{68FF4A2E-4A31-4AA7-9E3D-4F06F035F85D}']
    function GetJSONData: string;
    procedure SetJSONData(AValue: string);
  end;

function NewJSON: IJSONData;

implementation

type

  { TJSON }

  TJSON = class(TInterfacedObject, IJSONData)
  private
    FJSONData: TJSONData;
    function GetJSONData: string;
    procedure SetJSONData(AValue: string);
    destructor Destroy; override;
  end;

function NewJSON: IJSONData;
begin
  Result := TJSON.Create;
end;

{ TJSON }

function TJSON.GetJSONData: string;
begin
  Result := FJSONData.FormatJSON();
end;

procedure TJSON.SetJSONData(AValue: string);
begin
  FJSONData := GetJSON(AValue);
end;

destructor TJSON.Destroy;
begin
  FJSONData.Destroy;
 inherited Destroy;
end;

end.

