unit LaunchFlickr;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type

  IBaseLaunchFlickr = interface(IBaseModel) ['{9D9DA20F-6818-4955-8530-9C4745D10DD2}']
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

  TLaunchFlickr = class(TBaseModel, ILaunchFlickr)
  private
    FOriginal: TStringList;
    FSmall: TStringList;
    function GetOriginal: TStringList;
    function GetSmall: TStringList;

    procedure SetOriginal(AValue: TStringList);
    procedure SetSmall(AValue: TStringList);
  public
    constructor Create;
    destructor Destroy; override;
    function ToString: string; override;
  published
    property original: TStringList read GetOriginal write SetOriginal;
    property small: TStringList read GetSmall write SetSmall;
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

constructor TLaunchFlickr.Create;
begin
  inherited Create;
  FOriginal := TStringList.Create;
  FSmall := TStringList.Create;

  FOriginal.SkipLastLineBreak := True;
  FSmall.SkipLastLineBreak := True;
end;

destructor TLaunchFlickr.Destroy;
begin
  FreeAndNil(FOriginal);
  FreeAndNil(FSmall);
  inherited Destroy;
end;

function TLaunchFlickr.ToString: string;
begin
  Result := Format(''
    + 'Original: %s' + LineEnding
    + 'Small: %s'
    , [
      GetOriginal.Text,
      GetSmall.Text
    ]);
end;

end.

