unit LaunchPatch;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseLaunchPatch = interface(IInterface) ['{7DC64C34-50AB-48E2-927D-E6206AA28A45}']
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

type

  { TLaunchPatch }

  TLaunchPatch = class(TInterfacedObject, ILaunchPatch)
  private
    FLarge: string;
    FSmall: string;
    function GetLarge: string;
    function GetSmall: string;

    procedure SetLarge(AValue: string);
    procedure SetSmall(AValue: string);
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

procedure TLaunchPatch.SetSmall(AValue: string);
begin
  FSmall := AValue;
end;

end.

