unit RocketPotentialPayload;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, RocketFairing, BaseModel;

type

  IBaseRocketPotentialPayload = interface(IBaseModel) ['{C03BF20A-6BC5-4A86-9648-B98D0B84EDA8}']
    function GetFairing: IRocketFairing;
    function GetOption: string;

    procedure SetFairing(AValue: IRocketFairing);
    procedure SetOption(AValue: string);
  end;

  IRocketPotentialPayload = interface(IBaseRocketPotentialPayload) ['{F24B024B-40ED-4F8D-AD83-A8BA286C2E7B}']
    property Fairing: IRocketFairing read GetFairing write SetFairing;
    property Option: string read GetOption write SetOption;
  end;

function NewRocketPotentialPayload: IRocketPotentialPayload;

implementation

uses
  JSON_Helper;

type

  { TRocketPotentialPayload }

  TRocketPotentialPayload = class(TBaseModel, IRocketPotentialPayload)
  private
    FFairing: IRocketFairing;
    FOption: string;
  private
    function GetFairing: IRocketFairing;
    function GetOption: string;
  private
    procedure SetFairing(AValue: IRocketFairing);
    procedure SetOption(AValue: string);
  public
    procedure BuildSubObjects(const JSONData: IJSONData); override;
  published
    //property Fairing: IRocketFairing read GetFairing write SetFairing;
    property option_1: string read GetOption write SetOption;
  end;

function NewRocketPotentialPayload: IRocketPotentialPayload;
begin
  Result := TRocketPotentialPayload.Create;
end;

{ TRocketPotentialPayload }

function TRocketPotentialPayload.GetFairing: IRocketFairing;
begin
  Result := FFairing;
end;

function TRocketPotentialPayload.GetOption: string;
begin
  Result := FOption;
end;

procedure TRocketPotentialPayload.SetFairing(AValue: IRocketFairing);
begin
  FFairing := AValue;
end;

procedure TRocketPotentialPayload.SetOption(AValue: string);
begin
  FOption := AValue;
end;

procedure TRocketPotentialPayload.BuildSubObjects(const JSONData: IJSONData);
var
  SubJSONData: IJSONData;
  Fairing: IRocketFairing;
begin
  inherited BuildSubObjects(JSONData);

  SubJSONData := JSONData.GetPath('fairing');
  Fairing := NewRocketFairing;
  JSONToModel(SubJSONData.GetJSONData, Fairing as TObject);
  Self.FFairing := Fairing;
end;

end.

