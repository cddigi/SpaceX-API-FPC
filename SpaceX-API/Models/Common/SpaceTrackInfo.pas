unit SpaceTrackInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel;

type

  IBaseSpaceTrackInfo = interface(IBaseModel) ['{06D3FA28-0FBE-4245-8461-41D45FF36C77}']
    function GetCcsdsOmmVers: string;
    function GetComment: string;
    function GetCreationDate: TDateTime;
    function GetOriginator: string;
    function GetObjectName: string;
    function GetObjectId: string;
    function GetCenterName: string;
    function GetRefFrame: string;
    function GetTimeSystem: string;
    function GetMeanElementTheory: string;
    function GetEpoch: TDateTime;
    function GetMeanMotion: Double;
    function GetEccentricity: Double;
    function GetInclination: Double;
    function GetRaOfAscNode: Double;
    function GetArgOfPericenter: Double;
    function GetMeanAnomaly: Double;
    function GetEphemerisType: LongWord;
    function GetClassificationType: string;
    function GetNoradCatId: LongWord;
    function GetNoradSetNo: LongWord;
    function GetRevAtEpoch: LongWord;
    function GetBstar: Double;
    function GetMeanMotionDot: Double;
    function GetMeanMotionDdot: Double;
    function GetSemimajorAxis: Double;
    function GetPeriod: Double;
    function GetApoapsis: Double;
    function GetPeriapsis: Double;
    function GetObjectType: string;
    function GetRcsSize: string;
    function GetCountryCode: string;
    function GetLaunchDate: TDateTime;
    function GetSite: string;
    function GetDecayDate: TDateTime;
    function GetDecayed: LongWord;
    function GetFileInfo: LongWord;
    function GetGpId: LongWord;
    function GetTleLine0: string;
    function GetTleLine1: string;
    function GetTleLine2: string;

    procedure SetCcsdsOmmVers(AValue: string);
    procedure SetComment(AValue: string);
    procedure SetCreationDate(AValue: TDateTime);
    procedure SetOriginator(AValue: string);
    procedure SetObjectName(AValue: string);
    procedure SetObjectId(AValue: string);
    procedure SetCenterName(AValue: string);
    procedure SetRefFrame(AValue: string);
    procedure SetTimeSystem(AValue: string);
    procedure SetMeanElementTheory(AValue: string);
    procedure SetEpoch(AValue: TDateTime);
    procedure SetMeanMotion(AValue: Double);
    procedure SetEccentricity(AValue: Double);
    procedure SetInclination(AValue: Double);
    procedure SetRaOfAscNode(AValue: Double);
    procedure SetArgOfPericenter(AValue: Double);
    procedure SetMeanAnomaly(AValue: Double);
    procedure SetEphemerisType(AValue: LongWord);
    procedure SetClassificationType(AValue: string);
    procedure SetNoradCatId(AValue: LongWord);
    procedure SetNoradSetNo(AValue: LongWord);
    procedure SetRevAtEpoch(AValue: LongWord);
    procedure SetBstar(AValue: Double);
    procedure SetMeanMotionDot(AValue: Double);
    procedure SetMeanMotionDdot(AValue: Double);
    procedure SetSemimajorAxis(AValue: Double);
    procedure SetPeriod(AValue: Double);
    procedure SetApoapsis(AValue: Double);
    procedure SetPeriapsis(AValue: Double);
    procedure SetObjectType(AValue: string);
    procedure SetRcsSize(AValue: string);
    procedure SetCountryCode(AValue: string);
    procedure SetLaunchDate(AValue: TDateTime);
    procedure SetSite(AValue: string);
    procedure SetDecayDate(AValue: TDateTime);
    procedure SetDecayed(AValue: LongWord);
    procedure SetFileInfo(AValue: LongWord);
    procedure SetGpId(AValue: LongWord);
    procedure SetTleLine0(AValue: string);
    procedure SetTleLine1(AValue: string);
    procedure SetTleLine2(AValue: string);
  end;

  ISpaceTrackInfo = interface(IBaseSpaceTrackInfo) ['{777181F6-64A9-48D6-9ECD-E0CF47B21621}']
    property CcsdsOmmVers: string read GetCcsdsOmmVers write SetCcsdsOmmVers;
    property Comment: string read GetComment write SetComment;
    property CreationDate: TDateTime read GetCreationDate write SetCreationDate;
    property Originator: string read GetOriginator write SetOriginator;
    property ObjectName: string read GetObjectName write SetObjectName;
    property ObjectId: string read GetObjectId write SetObjectId;
    property CenterName: string read GetCenterName write SetCenterName;
    property RefFrame: string read GetRefFrame write SetRefFrame;
    property TimeSystem: string read GetTimeSystem write SetTimeSystem;
    property MeanElementTheory: string read GetMeanElementTheory write SetMeanElementTheory;
    property Epoch: TDateTime read GetEpoch write SetEpoch;
    property MeanMotion: Double read GetMeanMotion write SetMeanMotion;
    property Eccentricity: Double read GetEccentricity write SetEccentricity;
    property Inclination: Double read GetInclination write SetInclination;
    property RaOfAscNode: Double read GetRaOfAscNode write SetRaOfAscNode;
    property ArgOfPericenter: Double read GetArgOfPericenter write SetArgOfPericenter;
    property MeanAnomaly: Double read GetMeanAnomaly write SetMeanAnomaly;
    property EphemerisType: LongWord read GetEphemerisType write SetEphemerisType;
    property ClassificationType: string read GetClassificationType write SetClassificationType;
    property NoradCatId: LongWord read GetNoradCatId write SetNoradCatId;
    property NoradSetNo: LongWord read GetNoradSetNo write SetNoradSetNo;
    property RevAtEpoch: LongWord read GetRevAtEpoch write SetRevAtEpoch;
    property Bstar: Double read GetBstar write SetBstar;
    property MeanMotionDot: Double read GetMeanMotionDot write SetMeanMotionDot;
    property MeanMotionDdot: Double read GetMeanMotionDdot write SetMeanMotionDdot;
    property SemimajorAxis: Double read GetSemimajorAxis write SetSemimajorAxis;
    property Period: Double read GetPeriod write SetPeriod;
    property Apoapsis: Double read GetApoapsis write SetApoapsis;
    property Periapsis: Double read GetPeriapsis write SetPeriapsis;
    property ObjectType: string read GetObjectType write SetObjectType;
    property RcsSize: string read GetRcsSize write SetRcsSize;
    property CountryCode: string read GetCountryCode write SetCountryCode;
    property LaunchDate: TDateTime read GetLaunchDate write SetLaunchDate;
    property Site: string read GetSite write SetSite;
    property DecayDate: TDateTime read GetDecayDate write SetDecayDate;
    property Decayed: LongWord read GetDecayed write SetDecayed;
    property FileInfo: LongWord read GetFileInfo write SetFileInfo;
    property GpId: LongWord read GetGpId write SetGpId;
    property TleLine0: string read GetTleLine0 write SetTleLine0;
    property TleLine1: string read GetTleLine1 write SetTleLine1;
    property TleLine2: string read GetTleLine2 write SetTleLine2;
  end;

function NewSpaceTrackInfo: ISpaceTrackInfo;

implementation

uses
  Variants;

type

  { TSpaceTrackInfo }

  TSpaceTrackInfo = class(TBaseModel, ISpaceTrackInfo)
  private
    FCcsdsOmmVers: string;
    FComment: string;
    FCreationDate: TDateTime;
    FOriginator: string;
    FObjectName: string;
    FObjectId: string;
    FCenterName: string;
    FRefFrame: string;
    FTimeSystem: string;
    FMeanElementTheory: string;
    FEpoch: TDateTime;
    FMeanMotion: Double;
    FEccentricity: Double;
    FInclination: Double;
    FRaOfAscNode: Double;
    FArgOfPericenter: Double;
    FMeanAnomaly: Double;
    FEphemerisType: LongWord;
    FClassificationType: string;
    FNoradCatId: LongWord;
    FNoradSetNo: LongWord;
    FRevAtEpoch: LongWord;
    FBstar: Double;
    FMeanMotionDot: Double;
    FMeanMotionDdot: Double;
    FSemimajorAxis: Double;
    FPeriod: Double;
    FApoapsis: Double;
    FPeriapsis: Double;
    FObjectType: string;
    FRcsSize: string;
    FCountryCode: string;
    FLaunchDate: TDateTime;
    FSite: string;
    FDecayDate: TDateTime;
    FDecayed: LongWord;
    FFileInfo: LongWord;
    FGpId: LongWord;
    FTleLine0: string;
    FTleLine1: string;
    FTleLine2: string;
  private
    function GetCcsdsOmmVers: string;
    function GetComment: string;
    function GetCreationDate: TDateTime;
    function GetOriginator: string;
    function GetObjectName: string;
    function GetObjectId: string;
    function GetCenterName: string;
    function GetRefFrame: string;
    function GetTimeSystem: string;
    function GetMeanElementTheory: string;
    function GetEpoch: TDateTime;
    function GetMeanMotion: Double;
    function GetEccentricity: Double;
    function GetInclination: Double;
    function GetRaOfAscNode: Double;
    function GetArgOfPericenter: Double;
    function GetMeanAnomaly: Double;
    function GetEphemerisType: LongWord;
    function GetClassificationType: string;
    function GetNoradCatId: LongWord;
    function GetNoradSetNo: LongWord;
    function GetRevAtEpoch: LongWord;
    function GetBstar: Double;
    function GetMeanMotionDot: Double;
    function GetMeanMotionDdot: Double;
    function GetSemimajorAxis: Double;
    function GetPeriod: Double;
    function GetApoapsis: Double;
    function GetPeriapsis: Double;
    function GetObjectType: string;
    function GetRcsSize: string;
    function GetCountryCode: string;
    function GetLaunchDate: TDateTime;
    function GetSite: string;
    function GetDecayDate: TDateTime;
    function GetDecayed: LongWord;
    function GetFileInfo: LongWord;
    function GetGpId: LongWord;
    function GetTleLine0: string;
    function GetTleLine1: string;
    function GetTleLine2: string;
  private
    procedure SetCcsdsOmmVers(AValue: string);
    procedure SetCcsdsOmmVers(AValue: Variant);
    procedure SetComment(AValue: string);
    procedure SetComment(AValue: Variant);
    procedure SetCreationDate(AValue: TDateTime);
    procedure SetOriginator(AValue: string);
    procedure SetOriginator(AValue: Variant);
    procedure SetObjectName(AValue: string);
    procedure SetObjectName(AValue: Variant);
    procedure SetObjectId(AValue: string);
    procedure SetObjectId(AValue: Variant);
    procedure SetCenterName(AValue: string);
    procedure SetCenterName(AValue: Variant);
    procedure SetRefFrame(AValue: string);
    procedure SetRefFrame(AValue: Variant);
    procedure SetTimeSystem(AValue: string);
    procedure SetTimeSystem(AValue: Variant);
    procedure SetMeanElementTheory(AValue: string);
    procedure SetMeanElementTheory(AValue: Variant);
    procedure SetEpoch(AValue: TDateTime);
    procedure SetMeanMotion(AValue: Double);
    procedure SetMeanMotion(AValue: Variant);
    procedure SetEccentricity(AValue: Double);
    procedure SetEccentricity(AValue: Variant);
    procedure SetInclination(AValue: Double);
    procedure SetInclination(AValue: Variant);
    procedure SetRaOfAscNode(AValue: Double);
    procedure SetRaOfAscNode(AValue: Variant);
    procedure SetArgOfPericenter(AValue: Double);
    procedure SetArgOfPericenter(AValue: Variant);
    procedure SetMeanAnomaly(AValue: Double);
    procedure SetMeanAnomaly(AValue: Variant);
    procedure SetEphemerisType(AValue: LongWord);
    procedure SetEphemerisType(AValue: Variant);
    procedure SetClassificationType(AValue: string);
    procedure SetClassificationType(AValue: Variant);
    procedure SetNoradCatId(AValue: LongWord);
    procedure SetNoradCatId(AValue: Variant);
    procedure SetNoradSetNo(AValue: LongWord);
    procedure SetNoradSetNo(AValue: Variant);
    procedure SetRevAtEpoch(AValue: LongWord);
    procedure SetRevAtEpoch(AValue: Variant);
    procedure SetBstar(AValue: Double);
    procedure SetBstar(AValue: Variant);
    procedure SetMeanMotionDot(AValue: Double);
    procedure SetMeanMotionDot(AValue: Variant);
    procedure SetMeanMotionDdot(AValue: Double);
    procedure SetMeanMotionDdot(AValue: Variant);
    procedure SetSemimajorAxis(AValue: Double);
    procedure SetSemimajorAxis(AValue: Variant);
    procedure SetPeriod(AValue: Double);
    procedure SetPeriod(AValue: Variant);
    procedure SetApoapsis(AValue: Double);
    procedure SetApoapsis(AValue: Variant);
    procedure SetPeriapsis(AValue: Double);
    procedure SetPeriapsis(AValue: Variant);
    procedure SetObjectType(AValue: string);
    procedure SetObjectType(AValue: Variant);
    procedure SetRcsSize(AValue: string);
    procedure SetRcsSize(AValue: Variant);
    procedure SetCountryCode(AValue: string);
    procedure SetCountryCode(AValue: Variant);
    procedure SetLaunchDate(AValue: TDateTime);
    procedure SetSite(AValue: string);
    procedure SetSite(AValue: Variant);
    procedure SetDecayDate(AValue: TDateTime);
    procedure SetDecayDate(AValue: Variant);
    procedure SetDecayed(AValue: LongWord);
    procedure SetDecayed(AValue: Variant);
    procedure SetFileInfo(AValue: LongWord);
    procedure SetFileInfo(AValue: Variant);
    procedure SetGpId(AValue: LongWord);
    procedure SetGpId(AValue: Variant);
    procedure SetTleLine0(AValue: string);
    procedure SetTleLine0(AValue: Variant);
    procedure SetTleLine1(AValue: string);
    procedure SetTleLine1(AValue: Variant);
    procedure SetTleLine2(AValue: string);
    procedure SetTleLine2(AValue: Variant);
  published
    property CCDS_OMM_VERS: Variant write SetCcsdsOmmVers;
    property COMMENT: Variant write SetComment;

    property CREATION_DATE: TDateTime read GetCreationDate write SetCreationDate;

    property ORIGINATOR: Variant write SetOriginator;
    property OBJECT_NAME: Variant write SetObjectName;
    property OBJECT_ID: Variant write SetObjectId;
    property CENTER_NAME: Variant write SetCenterName;
    property REF_FRAME: Variant write SetRefFrame;
    property TIME_SYSTEM: Variant write SetTimeSystem;
    property MEAN_ELEMENT_THEORY: Variant write SetMeanElementTheory;

    property EPOCH: TDateTime read GetEpoch write SetEpoch;

    property MEAN_MOTION: Variant write SetMeanMotion;
    property ECCENTRICITY: Variant write SetEccentricity;
    property INCLINATION: Variant write SetInclination;
    property RA_OF_ASC_NODE: Variant write SetRaOfAscNode;
    property ARG_OF_PERICENTER: Variant write SetArgOfPericenter;
    property MEAN_ANOMALY: Variant write SetMeanAnomaly;
    property EPHEMERIS_TYPE: Variant write SetEphemerisType;
    property CLASSIFICATION_TYPE: Variant write SetClassificationType;
    property NORAD_CAT_ID: Variant write SetNoradCatId;
    property ELEMENT_SET_NO: Variant write SetNoradSetNo;
    property REV_AT_EPOCH: Variant write SetRevAtEpoch;
    property BSTAR: Variant write SetBstar;
    property MEAN_MOTION_DOT: Variant write SetMeanMotionDot;
    property MEAN_MOTION_DDOT: Variant write SetMeanMotionDdot;
    property SEMIMAJOR_AXIS: Variant write SetSemimajorAxis;
    property PERIOD: Variant write SetPeriod;
    property APOAPSIS: Variant write SetApoapsis;
    property PERIAPSIS: Variant write SetPeriapsis;
    property OBJECT_TYPE: Variant write SetObjectType;
    property RCS_SIZE: Variant write SetRcsSize;
    property COUNTRY_CODE: Variant write SetCountryCode;

    property LAUNCH_DATE: TDateTime read GetLaunchDate write SetLaunchDate;

    property SITE: Variant write SetSite;
    property DECAY_DATE: Variant write SetDecayDate;
    property DECAYED: Variant write SetDecayed;
    property FILE_INFO: Variant write SetFileInfo;
    property GP_ID: Variant write SetGpId;
    property TLE_LINE0: Variant write SetTleLine0;
    property TLE_LINE1: Variant write SetTleLine1;
    property TLE_LINE2: Variant write SetTleLine2;
  end;

function NewSpaceTrackInfo: ISpaceTrackInfo;
begin
  Result := TSpaceTrackInfo.Create;
end;

{ TSpaceTrackInfo }

function TSpaceTrackInfo.GetCcsdsOmmVers: string;
begin
  Result := FCcsdsOmmVers;
end;

function TSpaceTrackInfo.GetComment: string;
begin
  Result := FComment;
end;

function TSpaceTrackInfo.GetCreationDate: TDateTime;
begin
  Result := FCreationDate;
end;

function TSpaceTrackInfo.GetOriginator: string;
begin
  Result := FOriginator;
end;

function TSpaceTrackInfo.GetObjectName: string;
begin
  Result := FObjectName;
end;

function TSpaceTrackInfo.GetObjectId: string;
begin
  Result := FObjectId;
end;

function TSpaceTrackInfo.GetCenterName: string;
begin
  Result := FCenterName;
end;

function TSpaceTrackInfo.GetRefFrame: string;
begin
  Result := FRefFrame;
end;

function TSpaceTrackInfo.GetTimeSystem: string;
begin
  Result := FTimeSystem;
end;

function TSpaceTrackInfo.GetMeanElementTheory: string;
begin
  Result := FMeanElementTheory;
end;

function TSpaceTrackInfo.GetEpoch: TDateTime;
begin
  Result := FEpoch;
end;

function TSpaceTrackInfo.GetMeanMotion: Double;
begin
  Result := FMeanMotion;
end;

function TSpaceTrackInfo.GetEccentricity: Double;
begin
  Result := FEccentricity;
end;

function TSpaceTrackInfo.GetInclination: Double;
begin
  Result := FInclination;
end;

function TSpaceTrackInfo.GetRaOfAscNode: Double;
begin
  Result := FRaOfAscNode;
end;

function TSpaceTrackInfo.GetArgOfPericenter: Double;
begin
  Result := FArgOfPericenter;
end;

function TSpaceTrackInfo.GetMeanAnomaly: Double;
begin
  Result := FMeanAnomaly;
end;

function TSpaceTrackInfo.GetEphemerisType: LongWord;
begin
  Result := FEphemerisType;
end;

function TSpaceTrackInfo.GetClassificationType: string;
begin
  Result := FClassificationType;
end;

function TSpaceTrackInfo.GetNoradCatId: LongWord;
begin
  Result := FNoradCatId;
end;

function TSpaceTrackInfo.GetNoradSetNo: LongWord;
begin
  Result := FNoradSetNo;
end;

function TSpaceTrackInfo.GetRevAtEpoch: LongWord;
begin
  Result := FRevAtEpoch;
end;

function TSpaceTrackInfo.GetBstar: Double;
begin
  Result := FBstar;
end;

function TSpaceTrackInfo.GetMeanMotionDot: Double;
begin
  Result := FMeanMotionDot;
end;

function TSpaceTrackInfo.GetMeanMotionDdot: Double;
begin
  Result := FMeanMotionDdot;
end;

function TSpaceTrackInfo.GetSemimajorAxis: Double;
begin
  Result := FSemimajorAxis;
end;

function TSpaceTrackInfo.GetPeriod: Double;
begin
  Result := FPeriod;
end;

function TSpaceTrackInfo.GetApoapsis: Double;
begin
  Result := FApoapsis;
end;

function TSpaceTrackInfo.GetPeriapsis: Double;
begin
  Result := FPeriapsis;
end;

function TSpaceTrackInfo.GetObjectType: string;
begin
  Result := FObjectType;
end;

function TSpaceTrackInfo.GetRcsSize: string;
begin
  Result := FRcsSize;
end;

function TSpaceTrackInfo.GetCountryCode: string;
begin
  Result := FCountryCode;
end;

function TSpaceTrackInfo.GetLaunchDate: TDateTime;
begin
  Result := FLaunchDate;
end;

function TSpaceTrackInfo.GetSite: string;
begin
  Result := FSite;
end;

function TSpaceTrackInfo.GetDecayDate: TDateTime;
begin
  Result := FDecayDate;
end;

function TSpaceTrackInfo.GetDecayed: LongWord;
begin
  Result := FDecayed;
end;

function TSpaceTrackInfo.GetFileInfo: LongWord;
begin
  Result := FFileInfo;
end;

function TSpaceTrackInfo.GetGpId: LongWord;
begin
  Result := FGpId;
end;

function TSpaceTrackInfo.GetTleLine0: string;
begin
  Result := FTleLine0;
end;

function TSpaceTrackInfo.GetTleLine1: string;
begin
  Result := FTleLine1;
end;

function TSpaceTrackInfo.GetTleLine2: string;
begin
  Result := FTleLine2;
end;

procedure TSpaceTrackInfo.SetCcsdsOmmVers(AValue: string);
begin
  FCcsdsOmmVers := AValue;
end;

procedure TSpaceTrackInfo.SetCcsdsOmmVers(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FCcsdsOmmVers := '';
  end else if VarIsStr(AValue) then
    FCcsdsOmmVers := AValue;
end;

procedure TSpaceTrackInfo.SetComment(AValue: string);
begin
  FComment := AValue;
end;

procedure TSpaceTrackInfo.SetComment(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FComment := '';
  end else if VarIsStr(AValue) then
    FComment := AValue;
end;

procedure TSpaceTrackInfo.SetCreationDate(AValue: TDateTime);
begin
  FCreationDate := AValue;
end;

procedure TSpaceTrackInfo.SetOriginator(AValue: string);
begin
  FOriginator := AValue;
end;

procedure TSpaceTrackInfo.SetOriginator(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FOriginator := '';
  end else if VarIsStr(AValue) then
    FOriginator := AValue;
end;

procedure TSpaceTrackInfo.SetObjectName(AValue: string);
begin
  FObjectName := AValue;
end;

procedure TSpaceTrackInfo.SetObjectName(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FObjectName := '';
  end else if VarIsStr(AValue) then
    FObjectName := AValue;
end;

procedure TSpaceTrackInfo.SetObjectId(AValue: string);
begin
  FObjectId := AValue;
end;

procedure TSpaceTrackInfo.SetObjectId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FObjectId := '';
  end else if VarIsStr(AValue) then
    FObjectId := AValue;
end;

procedure TSpaceTrackInfo.SetCenterName(AValue: string);
begin
  FCenterName := AValue;
end;

procedure TSpaceTrackInfo.SetCenterName(AValue: Variant);
begin
 if VarIsNull(AValue) then begin
   FCenterName := '';
 end else if VarIsStr(AValue) then
  FCenterName := AValue;
end;

procedure TSpaceTrackInfo.SetRefFrame(AValue: string);
begin
  FRefFrame := AValue;
end;

procedure TSpaceTrackInfo.SetRefFrame(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FRefFrame := '';
  end else if VarIsStr(AValue) then
    FRefFrame := AValue;
end;

procedure TSpaceTrackInfo.SetTimeSystem(AValue: string);
begin
  FTimeSystem := AValue;
end;

procedure TSpaceTrackInfo.SetTimeSystem(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FTimeSystem := '';
  end else if VarIsStr(AValue) then
    FTimeSystem := AValue;
end;

procedure TSpaceTrackInfo.SetMeanElementTheory(AValue: string);
begin
  FMeanElementTheory := AValue;
end;

procedure TSpaceTrackInfo.SetMeanElementTheory(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FMeanElementTheory := '';
  end else if VarIsStr(AValue) then
    FMeanElementTheory := AValue;
end;

procedure TSpaceTrackInfo.SetEpoch(AValue: TDateTime);
begin
  FEpoch := AValue;
end;

procedure TSpaceTrackInfo.SetMeanMotion(AValue: Double);
begin
  FMeanMotion := AValue;
end;

procedure TSpaceTrackInfo.SetMeanMotion(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FMeanMotion := -0;
  end else if VarIsNumeric(AValue) then
    FMeanMotion := AValue;
end;

procedure TSpaceTrackInfo.SetEccentricity(AValue: Double);
begin
  FEccentricity := AValue;
end;

procedure TSpaceTrackInfo.SetEccentricity(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FEccentricity := -0;
  end else if VarIsNumeric(AValue) then
    FEccentricity := AValue;
end;

procedure TSpaceTrackInfo.SetInclination(AValue: Double);
begin
  FInclination := AValue;
end;

procedure TSpaceTrackInfo.SetInclination(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FInclination := -0;
  end else if VarIsNumeric(AValue) then
    FInclination := AValue;
end;

procedure TSpaceTrackInfo.SetRaOfAscNode(AValue: Double);
begin
  FRaOfAscNode := AValue;
end;

procedure TSpaceTrackInfo.SetRaOfAscNode(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FRaOfAscNode := -0;
  end else if VarIsNumeric(AValue) then
    FRaOfAscNode := AValue;
end;

procedure TSpaceTrackInfo.SetArgOfPericenter(AValue: Double);
begin
  FArgOfPericenter := AValue;
end;

procedure TSpaceTrackInfo.SetArgOfPericenter(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FArgOfPericenter := -0;
  end else if VarIsNumeric(AValue) then
    FArgOfPericenter := AValue;
end;

procedure TSpaceTrackInfo.SetMeanAnomaly(AValue: Double);
begin
  FMeanAnomaly := AValue;
end;

procedure TSpaceTrackInfo.SetMeanAnomaly(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FMeanAnomaly := -0;
  end else if VarIsNumeric(AValue) then
    FMeanAnomaly := AValue;
end;

procedure TSpaceTrackInfo.SetEphemerisType(AValue: LongWord);
begin
  FEphemerisType := AValue;
end;

procedure TSpaceTrackInfo.SetEphemerisType(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FEphemerisType := -0;
  end else if VarIsNumeric(FEphemerisType) then
    FEphemerisType := AValue;
end;

procedure TSpaceTrackInfo.SetClassificationType(AValue: string);
begin
  FClassificationType := AValue;
end;

procedure TSpaceTrackInfo.SetClassificationType(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FClassificationType := '';
  end else if VarIsStr(AValue) then
    FClassificationType := AValue;
end;

procedure TSpaceTrackInfo.SetNoradCatId(AValue: LongWord);
begin
  FNoradCatId := AValue;
end;

procedure TSpaceTrackInfo.SetNoradCatId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FNoradCatId := -0;
  end else if VarIsNumeric(AValue) then
    FNoradCatId := AValue;
end;

procedure TSpaceTrackInfo.SetNoradSetNo(AValue: LongWord);
begin
  FNoradSetNo := AValue;
end;

procedure TSpaceTrackInfo.SetNoradSetNo(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FNoradSetNo := -0;
  end else if VarIsNumeric(AValue) then
    FNoradSetNo := AValue;
end;

procedure TSpaceTrackInfo.SetRevAtEpoch(AValue: LongWord);
begin
  FRevAtEpoch := AValue;
end;

procedure TSpaceTrackInfo.SetRevAtEpoch(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FRevAtEpoch := -0;
  end else if VarIsNumeric(AValue) then
    FRevAtEpoch := AValue;
end;

procedure TSpaceTrackInfo.SetBstar(AValue: Double);
begin
  FBstar := AValue;
end;

procedure TSpaceTrackInfo.SetBstar(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FBstar := -0;
  end else if VarIsNumeric(AValue) then
    FBstar := AValue;
end;

procedure TSpaceTrackInfo.SetMeanMotionDot(AValue: Double);
begin
  FMeanMotionDot := AValue;
end;

procedure TSpaceTrackInfo.SetMeanMotionDot(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FMeanMotionDot := -0;
  end else if VarIsNumeric(AValue) then
    FMeanMotionDot := AValue;
end;

procedure TSpaceTrackInfo.SetMeanMotionDdot(AValue: Double);
begin
  FMeanMotionDdot := AValue;
end;

procedure TSpaceTrackInfo.SetMeanMotionDdot(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FMeanMotionDdot := -0;
  end else if VarIsNumeric(AValue) then
    FMeanMotionDdot := AValue;
end;

procedure TSpaceTrackInfo.SetSemimajorAxis(AValue: Double);
begin
  FSemimajorAxis := AValue;
end;

procedure TSpaceTrackInfo.SetSemimajorAxis(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FSemimajorAxis := -0;
  end else if VarIsNumeric(AValue) then
    FSemimajorAxis := AValue;
end;

procedure TSpaceTrackInfo.SetPeriod(AValue: Double);
begin
  FPeriod := AValue;
end;

procedure TSpaceTrackInfo.SetPeriod(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FPeriod := -0;
  end else if VarIsNumeric(AValue) then
    FPeriod := AValue;
end;

procedure TSpaceTrackInfo.SetApoapsis(AValue: Double);
begin
  FApoapsis := AValue;
end;

procedure TSpaceTrackInfo.SetApoapsis(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FApoapsis := -0;
  end else if VarIsNumeric(AValue) then
    FApoapsis := AValue;
end;

procedure TSpaceTrackInfo.SetPeriapsis(AValue: Double);
begin
  FPeriapsis := AValue;
end;

procedure TSpaceTrackInfo.SetPeriapsis(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FPeriapsis := -0;
  end else if VarIsNumeric(AValue) then
    FPeriapsis := AValue;
end;

procedure TSpaceTrackInfo.SetObjectType(AValue: string);
begin
  FObjectType := AValue;
end;

procedure TSpaceTrackInfo.SetObjectType(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FObjectType := '';
  end else if VarIsStr(AValue) then
    FObjectType := AValue;
end;

procedure TSpaceTrackInfo.SetRcsSize(AValue: string);
begin
  FRcsSize := AValue;
end;

procedure TSpaceTrackInfo.SetRcsSize(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FRcsSize := '';
  end else if VarIsStr(AValue) then
    FRcsSize := AValue;
end;

procedure TSpaceTrackInfo.SetCountryCode(AValue: string);
begin
  FCountryCode := AValue;
end;

procedure TSpaceTrackInfo.SetCountryCode(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FCountryCode := '';
  end else if VarIsStr(AValue) then
    FCountryCode := AValue;
end;

procedure TSpaceTrackInfo.SetLaunchDate(AValue: TDateTime);
begin
  FLaunchDate := AValue;
end;

procedure TSpaceTrackInfo.SetSite(AValue: string);
begin
  FSite := AValue;
end;

procedure TSpaceTrackInfo.SetSite(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FSite := '';
  end else if VarIsStr(AValue) then
    FSite := AValue;
end;

procedure TSpaceTrackInfo.SetDecayDate(AValue: TDateTime);
begin
  FDecayDate := AValue;
end;

procedure TSpaceTrackInfo.SetDecayDate(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FDecayDate := MinDateTime;
  end else if VarIsStr(AValue) then
    FDecayDate := AValue;
end;

procedure TSpaceTrackInfo.SetDecayed(AValue: LongWord);
begin
  FDecayed := AValue;
end;

procedure TSpaceTrackInfo.SetDecayed(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FDecayed := -0;
  end else if VarIsNumeric(AValue) then
    FDecayed := AValue;
end;

procedure TSpaceTrackInfo.SetFileInfo(AValue: LongWord);
begin
  FFileInfo := AValue;
end;

procedure TSpaceTrackInfo.SetFileInfo(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FFileInfo := -0;
  end else if VarIsNumeric(AValue) then
    FFileInfo := AValue;
end;

procedure TSpaceTrackInfo.SetGpId(AValue: LongWord);
begin
  FGpId := AValue;
end;

procedure TSpaceTrackInfo.SetGpId(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FGpId := -0;
  end else if VarIsNumeric(AValue) then
    FGpId := AValue;
end;

procedure TSpaceTrackInfo.SetTleLine0(AValue: string);
begin
  FTleLine0 := AValue;
end;

procedure TSpaceTrackInfo.SetTleLine0(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FTleLine0 := '';
  end else if VarIsStr(AValue) then
    FTleLine0 := AValue;
end;

procedure TSpaceTrackInfo.SetTleLine1(AValue: string);
begin
  FTleLine1 := AValue;
end;

procedure TSpaceTrackInfo.SetTleLine1(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FTleLine1 := '';
  end else if VarIsStr(AValue) then
    FTleLine1 := AValue;
end;

procedure TSpaceTrackInfo.SetTleLine2(AValue: string);
begin
  FTleLine2 := AValue;
end;

procedure TSpaceTrackInfo.SetTleLine2(AValue: Variant);
begin
  if VarIsNull(AValue) then begin
    FTleLine2 := '';
  end else if VarIsStr(AValue) then
    FTleLine2 := AValue;
end;

end.

