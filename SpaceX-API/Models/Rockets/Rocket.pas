unit Rocket;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SizeInfo, MassInfo, RocketEngines, RocketFirstStage, SecondStage, RocketLandingLegs;

type

  { TRocket }

  TRocket = class(TInterfacedObject)
  public
    Id: string;
    Name: string;
    TypeInfo: string;
    Active: Boolean;
    Stages: LongWord;
    Boosters: LongWord;
    Country: string;
    Company: string;
    Wikipedia: string;
    Description: string;
    Height: ISizeInfo;
    Diameter: ISizeInfo;
    Mass: IMassInfo;
    Engines: TRocketEngines;
    CostPerLaunch: LongWord;
    SuccessRate: LongWord;
    FirstFlight: TDateTime;
    FirstStage: TRocketFirstStage;
    SecondStage: TSecondStage;
    LandingLegs: TRocketLandingLegs;
    //PayloadWeights: List<RocketPotentialPayloadWeight>;
    FlickrImages: TStringList;
    function ToString(): string; override;
  end;

implementation

{ TRocket }

function TRocket.ToString(): string;
begin
  Result := Name;
end;

end.

