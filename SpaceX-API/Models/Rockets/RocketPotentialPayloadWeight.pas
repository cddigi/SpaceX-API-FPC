unit RocketPotentialPayloadWeight;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseRocketPotentialPayloadWeight = interface(IInterface) ['{5A89D92B-A810-40AF-9FC6-DB5FC1E20854}']
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

  IRocketPotentialPayloadWeightList = interface(IInterfaceList) ['{9BD75D9F-F862-49DA-ABA8-22A78A860D3E}']
  end;

function NewRocketPotentialPayloadWeight: IRocketPotentialPayloadWeight;
function NewRocketPotentialPayloadWeightList: IRocketPotentialPayloadWeightList;

implementation

type

  { TRocketPotentialPayloadWeight }

  TRocketPotentialPayloadWeight = class(TInterfacedObject, IRocketPotentialPayloadWeight)
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
    procedure SetKilograms(AValue: Double);
    procedure SetName(AValue: string);
    procedure SetPounds(AValue: Double);
  published
    property id: string read GetId write SetId;
    property kg: Double read GetKilograms write SetKilograms;
    property name: string read GetName write SetName;
    property lb: Double read GetPounds write SetPounds;
  end;

  TRocketPotentialPayloadWightList = class(TInterfaceList, IRocketPotentialPayloadWeightList)
  end;

function NewRocketPotentialPayloadWeight: IRocketPotentialPayloadWeight;
begin
  Result := TRocketPotentialPayloadWeight.Create;
end;

function NewRocketPotentialPayloadWeightList: IRocketPotentialPayloadWeightList;
begin
  Result := TRocketPotentialPayloadWightList.Create;
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

procedure TRocketPotentialPayloadWeight.SetKilograms(AValue: Double);
begin
  FKilograms := AValue;
end;

procedure TRocketPotentialPayloadWeight.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TRocketPotentialPayloadWeight.SetPounds(AValue: Double);
begin
  FPounds := AValue;
end;

end.

