unit LaunchPatch;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type

  IBaseLaunchPatch = interface(IBaseModel) ['{7DC64C34-50AB-48E2-927D-E6206AA28A45}']
    function GetLarge: string;
    function GetSmall: string;

    procedure SetLarge(AValue: string);
    procedure SetSmall(AValue: string);
  end;

  ILaunchPatch = interface(IBaseLaunchPatch) ['{27E37272-FB24-488B-BF7F-FD9BF63F5E12}']
    property Large: string read GetLarge write SetLarge;
    property Small: string read GetSmall write SetSmall;
  end;

function NewLaunchPatch: ILaunchPatch;

implementation

uses
  Variants;

type

  { TLaunchPatch }

  TLaunchPatch = class(TBaseModel, ILaunchPatch)
  private
    FLarge: string;
    FSmall: string;
    function GetLarge: string;
    function GetSmall: string;

    procedure SetLarge(AValue: string);
    procedure SetLarge(AValue: Variant);
    procedure SetSmall(AValue: string);
    procedure SetSmall(AValue: Variant);
  published
    property large: Variant write SetLarge;
    property small: Variant write SetSmall;
  end;

function NewLaunchPatch: ILaunchPatch;
begin
  Result := TLaunchPatch.Create;
end;

{ TLaunchPatch }

function TLaunchPatch.GetLarge: string;
begin
  Result := FLarge;
end;

function TLaunchPatch.GetSmall: string;
begin
  Result := FSmall;
end;

procedure TLaunchPatch.SetLarge(AValue: string);
begin
  FLarge := AValue;
end;

procedure TLaunchPatch.SetLarge(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FLarge := '';
  end else if VarIsStr(AValue) then
    FLarge := AValue;
end;

procedure TLaunchPatch.SetSmall(AValue: string);
begin
  FSmall := AValue;
end;

procedure TLaunchPatch.SetSmall(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FSmall := '';
  end else if VarIsStr(AValue) then
    FSmall := AValue;
end;

end.

