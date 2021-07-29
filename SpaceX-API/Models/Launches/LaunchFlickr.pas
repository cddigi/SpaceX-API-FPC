unit LaunchFlickr;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseLaunchFlickr = interface(IInterface) ['{9D9DA20F-6818-4955-8530-9C4745D10DD2}']
    function GetOriginal: TStringList;
    function GetSmall: TStringList;

    procedure SetOriginal(AValue: TStringList);
    procedure SetSmall(AValue: TStringList);
  end;

  ILaunchFlickr = interface(IBaseLaunchFlickr) ['{7FCCADB3-1AFE-413B-B7E1-DC8FAB5EAF2B}']
    property Original: TStringList read GetOriginal write SetOriginal;
    property Small: TStringList read GetSmall write SetSmall;
  end;

implementation

type

  { TLaunchFlickr }

  TLaunchFlickr = class(TInterfacedObject, ILaunchFlickr)
    FOriginal: TStringList;
    FSmall: TStringList;
    function GetOriginal: TStringList;
    function GetSmall: TStringList;

    procedure SetOriginal(AValue: TStringList);
    procedure SetSmall(AValue: TStringList);
  end;

{ TLaunchFlickr }

function TLaunchFlickr.GetOriginal: TStringList;
begin
  Result := FOriginal;
end;

function TLaunchFlickr.GetSmall: TStringList;
begin
  Result := FSmall;
end;

procedure TLaunchFlickr.SetOriginal(AValue: TStringList);
begin
  FOriginal := AValue;
end;

procedure TLaunchFlickr.SetSmall(AValue: TStringList);
begin
  FSmall := AValue;
end;

end.

