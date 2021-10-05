unit RocketPotentialPayloadWeight;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type

  IBaseRocketPotentialPayloadWeight = interface(IBaseModel) ['{5A89D92B-A810-40AF-9FC6-DB5FC1E20854}']
    function GetId: string;
    function GetKilograms: Double;
    function GetName: string;
    function GetPounds: Double;

    procedure SetId(AValue: string);
    procedure SetKilograms(AValue: Double);
    procedure SetName(AValue: string);
    procedure SetPounds(AValue: Double);
  end;

  IRocketPotentialPayloadWeight = interface(IBaseRocketPotentialPayloadWeight) ['{63F840A2-75BA-476B-B7EF-D83BD0956654}']
    property Id: string read GetId write SetId;
    property Kilograms: Double read GetKilograms write SetKilograms;
    property Name: string read GetName write SetName;
    property Pounds: Double read GetPounds write SetPounds;
  end;

  IRocketPotentialPayloadWeightList = interface(IBaseModelList) ['{9BD75D9F-F862-49DA-ABA8-22A78A860D3E}']
  end;

  { TRocketPotentialPayloadWeightEnumerator }

  TRocketPotentialPayloadWeightEnumerator = class(TBaseModelEnumerator)
    function GetCurrent: IRocketPotentialPayloadWeight;
    property Current : IRocketPotentialPayloadWeight read GetCurrent;
  end;

function NewRocketPotentialPayloadWeight: IRocketPotentialPayloadWeight;
function NewRocketPotentialPayloadWeightList: IRocketPotentialPayloadWeightList;
operator enumerator(AList: IRocketPotentialPayloadWeightList): TRocketPotentialPayloadWeightEnumerator;

implementation

uses
  Variants;

type

  { TRocketPotentialPayloadWeight }

  TRocketPotentialPayloadWeight = class(TBaseModel, IRocketPotentialPayloadWeight)
  private
    FId: string;
    FKilograms: Double;
    FName: string;
    FPounds: Double;
  private
    function GetId: string;
    function GetKilograms: Double;
    function GetName: string;
    function GetPounds: Double;
  private
    procedure SetId(AValue: string);
    procedure SetId(AValue: Variant);
    procedure SetKilograms(AValue: Double);
    procedure SetKilograms(AValue: Variant);
    procedure SetName(AValue: string);
    procedure SetName(AValue: Variant);
    procedure SetPounds(AValue: Double);
    procedure SetPounds(AValue: Variant);
  public
    function ToString: string; override;
  published
    property id: Variant write SetId;
    property kg: Variant write SetKilograms;
    property name: Variant write SetName;
    property lb: Variant write SetPounds;
  end;

  { TRocketPotentialPayloadWeightList }

  TRocketPotentialPayloadWeightList = class(TBaseModelList, IRocketPotentialPayloadWeightList)
    function NewItem: IBaseModel; override;
    function ToString: string; override;
  end;

function NewRocketPotentialPayloadWeight: IRocketPotentialPayloadWeight;
begin
  Result := TRocketPotentialPayloadWeight.Create;
end;

function NewRocketPotentialPayloadWeightList: IRocketPotentialPayloadWeightList;
begin
  Result := TRocketPotentialPayloadWeightList.Create;
end;

operator enumerator(AList: IRocketPotentialPayloadWeightList
  ): TRocketPotentialPayloadWeightEnumerator;
begin
  Result := TRocketPotentialPayloadWeightEnumerator.Create;
  Result.FList := AList;
end;

{ TRocketPotentialPayloadWeightEnumerator }

function TRocketPotentialPayloadWeightEnumerator.GetCurrent: IRocketPotentialPayloadWeight;
begin
  Result := FCurrent as IRocketPotentialPayloadWeight;
end;

{ TRocketPotentialPayloadWeightList }

function TRocketPotentialPayloadWeightList.NewItem: IBaseModel;
begin
  Result := NewRocketPotentialPayloadWeight;
end;

function TRocketPotentialPayloadWeightList.ToString: string;
var
  RocketPotentialPayloadWeight: IRocketPotentialPayloadWeight;
begin
  for RocketPotentialPayloadWeight in Self do begin
    RocketPotentialPayloadWeight.ToString;
  end;
end;

{ TRocketPotentialPayloadWeight }

function TRocketPotentialPayloadWeight.GetId: string;
begin
  Result := FId;
end;

function TRocketPotentialPayloadWeight.GetKilograms: Double;
begin
  Result := FKilograms;
end;

function TRocketPotentialPayloadWeight.GetName: string;
begin
  Result := FName;
end;

function TRocketPotentialPayloadWeight.GetPounds: Double;
begin
  Result := FPounds;
end;

procedure TRocketPotentialPayloadWeight.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TRocketPotentialPayloadWeight.SetId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FId := '';
  end else if VarIsStr(AValue) then
    FId := AValue;
end;

procedure TRocketPotentialPayloadWeight.SetKilograms(AValue: Double);
begin
  FKilograms := AValue;
end;

procedure TRocketPotentialPayloadWeight.SetKilograms(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FKilograms := -0;
  end else if VarIsNumeric(AValue) then
    FKilograms := AValue;
end;

procedure TRocketPotentialPayloadWeight.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TRocketPotentialPayloadWeight.SetName(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FName := '';
  end else if VarIsStr(AValue) then
    FName := AValue;
end;

procedure TRocketPotentialPayloadWeight.SetPounds(AValue: Double);
begin
  FPounds := AValue;
end;

procedure TRocketPotentialPayloadWeight.SetPounds(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FPounds := -0;
  end else if VarIsNumeric(AValue) then
    FPounds := AValue;
end;

function TRocketPotentialPayloadWeight.ToString: string;
begin
  Result := Format(''
    + 'ID: %s' + LineEnding
    + 'Kilograms: %f' + LineEnding
    + 'Name: %s' + LineEnding
    + 'Pounds: %f'
    , [
      GetId,
      GetKilograms,
      GetName,
      GetPounds
    ]);
end;

end.

