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
  JSON_Helper, Variants;

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
    procedure SetOption(AValue: Variant);
  public
    procedure BuildSubObjects(const JSONData: IJSONData); override;
    function ToString: string; override;
  published
    property option_1: Variant write SetOption;
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

procedure TRocketPotentialPayload.SetOption(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FOption := '';
  end else if VarIsStr(AValue) then
    FOption := AValue;
end;

procedure TRocketPotentialPayload.BuildSubObjects(const JSONData: IJSONData);
var
  SubJSONData: IJSONData;
  Fairing: IRocketFairing;
begin
  inherited BuildSubObjects(JSONData);

  SubJSONData := JSONData.GetPath('composite_fairing');
  Fairing := NewRocketFairing;
  JSONToModel(SubJSONData.GetJSONData, Fairing);
  Self.FFairing := Fairing;
end;

function TRocketPotentialPayload.ToString: string;
begin
  Result := Format(''
    + 'Fairing: %s' + LineEnding
    + 'Option: %s'
    , [
      GetFairing.ToString,
      GetOption
    ]);
end;

end.

