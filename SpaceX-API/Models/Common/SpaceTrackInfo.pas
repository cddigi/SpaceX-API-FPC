unit SpaceTrackInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TSpaceTrackInfo = class(TInterfacedObject)
    CcsdsOmmVers: string;
    Comment: string;
    CreationDate: TDateTime;
    Originator: string;
    ObjectName: string;
    ObjectId: string;
    CenterName: string;
    RefFrame: string;
    TimeSystem: string;
    MeanElementTheory: string;
    Epoch: TDateTime;
    MeanMotion: Double;
    Eccentricity: Double;
    Inclination: Double;
    RaOfAscNode: Double;
    ArgOfPericenter: Double;
    MeanAnomaly: Double;
    EphemerisType: LongWord;
    ClassificationType: string;
    NoradCatId: LongWord;
    NoradSetNo: LongWord;
    RevAtEpoch: LongWord;
    Bstar: Double;
    MeanMotionDot: Double;
    MeanMotionDdot: Double;
    SemimajorAxis: Double;
    Period: Double;
    Apoapsis: Double;
    Periapsis: Double;
    ObjectType: string;
    RcsSize: string;
    CountryCode: string;
    LaunchDate: TDateTime;
    Site: string;
    DecayDate: TDateTime;
    Decayed: LongWord;
    FileInfo: LongWord;
    GpId: LongWord;
    TleLine0: string;
    TleLine1: string;
    TleLine2: string;
  end;

implementation

end.

