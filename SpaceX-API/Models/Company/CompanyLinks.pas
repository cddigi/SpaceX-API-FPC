unit CompanyLinks;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBaseCompanyLinks = interface(IInterface) ['{1947D844-0B77-4B86-AA73-95960C0AA320}']
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

type

  { TCompanyLinks }

  TCompanyLinks = class(TInterfacedObject, ICompanyLinks)
  private
    FWebsite: string;
    FFlickr: string;
    FTwitter: string;
    FElonTwitter: string;
    function GetWebsite: string;
    function GetFlickr: string;
    function GetTwitter: string;
    function GetElonTwitter: string;

    procedure SetWebsite(AValue: string);
    procedure SetFlickr(AValue: string);
    procedure SetTwitter(AValue: string);
    procedure SetElonTwitter(AValue: string);
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

procedure TCompanyLinks.SetFlickr(AValue: string);
begin
  FFlickr := AValue;
end;

procedure TCompanyLinks.SetTwitter(AValue: string);
begin
  FTwitter := AValue;
end;

procedure TCompanyLinks.SetElonTwitter(AValue: string);
begin
  FElonTwitter := AValue;
end;

end.

