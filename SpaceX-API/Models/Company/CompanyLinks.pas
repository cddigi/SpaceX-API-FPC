unit CompanyLinks;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type

  IBaseCompanyLinks = interface(IBaseModel) ['{1947D844-0B77-4B86-AA73-95960C0AA320}']
    function GetWebsite: string;
    function GetFlickr: string;
    function GetTwitter: string;
    function GetElonTwitter: string;

    procedure SetWebsite(AValue: string);
    procedure SetFlickr(AValue: string);
    procedure SetTwitter(AValue: string);
    procedure SetElonTwitter(AValue: string);
  end;

  ICompanyLinks = interface(IBaseCompanyLinks) ['{24CA7C51-49B0-4A2A-8A7C-A093391890FF}']
    property Website: string read GetWebsite write SetWebsite;
    property Flickr: string read GetFlickr write SetFlickr;
    property Twitter: string read GetTwitter write SetTwitter;
    property ElonTwitter: string read GetElonTwitter write SetElonTwitter;
  end;

function NewCompanyLinks: ICompanyLinks;

implementation

uses
  Variants;

type

  { TCompanyLinks }

  TCompanyLinks = class(TBaseModel, ICompanyLinks)
  private
    FWebsite: string;
    FFlickr: string;
    FTwitter: string;
    FElonTwitter: string;
  private
    function GetWebsite: string;
    function GetFlickr: string;
    function GetTwitter: string;
    function GetElonTwitter: string;
  private
    procedure SetWebsite(AValue: string);
    procedure SetWebsite(AValue: Variant);
    procedure SetFlickr(AValue: string);
    procedure SetFlickr(AValue: Variant);
    procedure SetTwitter(AValue: string);
    procedure SetTwitter(AValue: Variant);
    procedure SetElonTwitter(AValue: string);
    procedure SetElonTwitter(AValue: Variant);
  public
    function ToString: string; override;
  published
    property website: Variant write SetWebsite;
    property flickr: Variant write SetFlickr;
    property twitter: Variant write SetTwitter;
    property elon_twitter: Variant write SetElonTwitter;
  end;

function NewCompanyLinks: ICompanyLinks;
begin
  Result := TCompanyLinks.Create;
end;

{ TCompanyLinks }

function TCompanyLinks.GetWebsite: string;
begin
  Result := FWebsite;
end;

function TCompanyLinks.GetFlickr: string;
begin
  Result := FFlickr;
end;

function TCompanyLinks.GetTwitter: string;
begin
  Result := FTwitter;
end;

function TCompanyLinks.GetElonTwitter: string;
begin
  Result := FElonTwitter;
end;

procedure TCompanyLinks.SetWebsite(AValue: string);
begin
  FWebsite := AValue;
end;

procedure TCompanyLinks.SetWebsite(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := '';

  FWebsite := AValue;
end;

procedure TCompanyLinks.SetFlickr(AValue: string);
begin
  FFlickr := AValue;
end;

procedure TCompanyLinks.SetFlickr(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := '';

  FFlickr := AValue;
end;

procedure TCompanyLinks.SetTwitter(AValue: string);
begin
  FTwitter := AValue;
end;

procedure TCompanyLinks.SetTwitter(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := '';

  FTwitter := AValue;
end;

procedure TCompanyLinks.SetElonTwitter(AValue: string);
begin
  FElonTwitter := AValue;
end;

procedure TCompanyLinks.SetElonTwitter(AValue: Variant);
begin
  if VarIsNull(AValue) then
    AValue := '';

  FElonTwitter := AValue;
end;

function TCompanyLinks.ToString: string;
begin
  Result := Format(''
    + 'Flicker: %s' + LineEnding
    + 'Twitter: %s' + LineEnding     
    + 'Twitter, Elon: %s' + LineEnding
    + 'Website: %s'
    , [
      GetFlickr,
      GetTwitter,
      GetElonTwitter,
      GetWebsite
    ]);
end;

end.

