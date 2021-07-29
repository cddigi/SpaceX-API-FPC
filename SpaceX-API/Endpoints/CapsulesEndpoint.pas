unit CapsulesEndpoint;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Capsule;

type

  ICapsulesEndpoint = interface(IInterface) ['{3034C771-6CC0-47E0-826D-9C4608A2D84D}']
    function All: ICapsuleList;
    function One(const Id: string): ICapsule;
  end;

function NewCapsulesEndpoint: ICapsulesEndpoint;

implementation

uses
  fpjson, fphttpclient, opensslsockets, jsonparser, BaseEndpoint;

const
  Host = 'https://api.spacexdata.com/v4/';
  Endpoint = 'capsules/';

type

  { TCapsulesEndpoint }

  TCapsulesEndpoint = class(TInterfacedObject, ICapsulesEndpoint)
    function All: ICapsuleList;
    function One(const Id: string): ICapsule;
  end;

function NewCapsulesEndpoint: ICapsulesEndpoint;
begin
  Result := TCapsulesEndpoint.Create;
end;

{ TCapsulesEndpoint }

function TCapsulesEndpoint.All: ICapsuleList;
var
  Path: string;
  HttpClient: TFPCustomHTTPClient;
  JSONData: IJSON;
begin
  Result := NewCapsuleList;
  Path := SysUtils.ConcatPaths([Host, Endpoint]);
  WriteLn(Path);

  HttpClient := TFPCustomHTTPClient.Create(nil);
  try
    JSONData := NewJSON;
    JSONData._setJSON(HttpClient.Get(Path));
  finally
    WriteLn(JSONData._getJSON);
    WriteLn();

    HttpClient.Free;
  end;
end;

function TCapsulesEndpoint.One(const Id: string): ICapsule;
var
  Path: string;
  HttpClient: TFPCustomHTTPClient;
  JSONData: TJSONData;
begin
  Result := NewCapsule;
  Path := SysUtils.ConcatPaths([Host, Endpoint, Id]);
  WriteLn(Path);

  HttpClient := TFPCustomHTTPClient.Create(nil);
  try
    JSONData := GetJSON(HttpClient.Get(Path));
  finally
    WriteLn(JSONData.FormatJSON());
    WriteLn();

    JSONData.Free;
    HttpClient.Free;
  end;
end;


end.

