unit Ship;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TShip }

  TShip = class(TInterfacedObject)
    public
      Id: string;
      Name: string;
      Active: Boolean;
      Model: string;
      TypeInfo: string;
      Imo: LongWord;
      Mmsi: LongWord;
      Abs: LongWord;
      ClassSize: LongWord;
      Status: string;
      Latitude: Double;
      Longitude: Double;
      Link: string;
      Image: string;
      Roles: TStringList;
      LegacyId: string;
      MassKilograms: Double;
      MassPounds: Double;
      YearBuilt: LongWord;
      HomePort: string;
      SpeedKnots: Double;
      CourseDegrees: Double;
      LastAisUpdate: TDateTime;
      LaunchesId: TStringList;
        { get => _launchesId;
          set( _launchesId = value;
               Launches = _launchesId.Select(p => new Lazy<LaunchInfo>(() => Context.LaunchesEndpoint.Get(p).Execute())).ToList();)}
        //public List<Lazy<LaunchInfo>> Launches
      function ToString(): string; override;
    private
      _launchesId: TStringList;
  end;

implementation

{ TShip }

function TShip.ToString(): string;
begin
  Result := Name;
end;

end.

