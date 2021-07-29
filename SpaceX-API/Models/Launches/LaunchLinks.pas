unit LaunchLinks;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LaunchPatch, LaunchReddit, LaunchFlickr;

type
  TLaunchLinks = class(TInterfacedObject)
    Presskit: string;
    Webcast: string;
    Article: string;
    Wikipedia: string;
    Patch: TLaunchPatch;
    Reddit: TLaunchReddit;
    Flickr: ILaunchFlickr;
    YouTubeId: string;
  end;

implementation

end.

