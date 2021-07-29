unit LaunchLinks;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LaunchPatch, LaunchReddit, LaunchFlickr;

type

  IBaseLaunchLinks = interface(IInterface) ['{CD2B10FD-4184-42A2-BB85-D47DB841C103}']
    function GetArticle: string;
    function GetFlickr: ILaunchFlickr;
    function GetPatch: ILaunchPatch;
    function GetPresskit: string;
    function GetReddit: ILaunchReddit;
    function GetWebcast: string;
    function GetWikipedia: string;
    function GetYouTubeId: string;

    procedure SetArticle(AValue: string);
    procedure SetFlickr(AValue: ILaunchFlickr);
    procedure SetPatch(AValue: ILaunchPatch);
    procedure SetPresskit(AValue: string);
    procedure SetReddit(AValue: ILaunchReddit);
    procedure SetWebcast(AValue: string);
    procedure SetWikipedia(AValue: string);
    procedure SetYouTubeId(AValue: string);
  end;

  ILaunchLinks = interface(IBaseLaunchLinks) ['{7BB39FA9-B797-4362-B9D4-04215E0B7B55}']
    property Article: string read GetArticle write SetArticle;
    property Flickr: ILaunchFlickr read GetFlickr write SetFlickr;
    property Patch: ILaunchPatch read GetPatch write SetPatch;
    property Presskit: string read GetPresskit write SetPresskit;
    property Reddit: ILaunchReddit read GetReddit write SetReddit;
    property Webcast: string read GetWebcast write SetWebcast;
    property Wikipedia: string read GetWikipedia write SetWikipedia;
    property YouTubeId: string read GetYouTubeId write SetYouTubeId;
  end;

function NewLaunchLinks: ILaunchLinks;

implementation

type

  { TLaunchLinks }

  TLaunchLinks = class(TInterfacedObject, ILaunchLinks)
  private
    FArticle: string;
    FFlickr: ILaunchFlickr;
    FPatch: ILaunchPatch;
    FPresskit: string;
    FReddit: ILaunchReddit;
    FWebcast: string;
    FWikipedia: string;
    FYouTubeId: string;
    function GetArticle: string;
    function GetFlickr: ILaunchFlickr;
    function GetPatch: ILaunchPatch;
    function GetPresskit: string;
    function GetReddit: ILaunchReddit;
    function GetWebcast: string;
    function GetWikipedia: string;
    function GetYouTubeId: string;

    procedure SetArticle(AValue: string);
    procedure SetFlickr(AValue: ILaunchFlickr);
    procedure SetPatch(AValue: ILaunchPatch);
    procedure SetPresskit(AValue: string);
    procedure SetReddit(AValue: ILaunchReddit);
    procedure SetWebcast(AValue: string);
    procedure SetWikipedia(AValue: string);
    procedure SetYouTubeId(AValue: string);
  end;

function NewLaunchLinks: ILaunchLinks;
begin
  Result := TLaunchLinks.Create;
end;

{ TLaunchLinks }

function TLaunchLinks.GetArticle: string;
begin
  Result := FArticle;
end;

function TLaunchLinks.GetFlickr: ILaunchFlickr;
begin
  Result := FFlickr;
end;

function TLaunchLinks.GetPatch: ILaunchPatch;
begin
  Result := FPatch;
end;

function TLaunchLinks.GetPresskit: string;
begin
  Result := FPresskit;
end;

function TLaunchLinks.GetReddit: ILaunchReddit;
begin
  Result := FReddit;
end;

function TLaunchLinks.GetWebcast: string;
begin
  Result := FWebcast;
end;

function TLaunchLinks.GetWikipedia: string;
begin
  Result := FWikipedia;
end;

function TLaunchLinks.GetYouTubeId: string;
begin
  Result := FYouTubeId;
end;

procedure TLaunchLinks.SetArticle(AValue: string);
begin
  FArticle := AValue;
end;

procedure TLaunchLinks.SetFlickr(AValue: ILaunchFlickr);
begin
  FFlickr := AValue;
end;

procedure TLaunchLinks.SetPatch(AValue: ILaunchPatch);
begin
  FPatch := AValue;
end;

procedure TLaunchLinks.SetPresskit(AValue: string);
begin
  FPresskit := AValue;
end;

procedure TLaunchLinks.SetReddit(AValue: ILaunchReddit);
begin
  FReddit := AValue;
end;

procedure TLaunchLinks.SetWebcast(AValue: string);
begin
  FWebcast := AValue;
end;

procedure TLaunchLinks.SetWikipedia(AValue: string);
begin
  FWikipedia := AValue;
end;

procedure TLaunchLinks.SetYouTubeId(AValue: string);
begin
  FYouTubeId := AValue;
end;

end.

