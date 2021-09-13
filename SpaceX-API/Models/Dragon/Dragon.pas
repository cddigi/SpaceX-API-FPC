unit Dragon;

{$mode objfpc}{$H+}

interface

uses
  Classes, DragonHeatshield, DragonPressurizedCapsule, DragonThrusters,
  DragonTrunk, MassInfo, SizeInfo, SysUtils, VolumeInfo, BaseModel;

type

    { IBaseDragon }

    IBaseDragon = interface(IBaseModel) ['{B25B729F-DAA4-4ECD-8F2F-7297EDA11B28}']
      function GetActive: Boolean;
      function GetCrewCapacity: Byte;
      function GetDescription: string;
      function GetDiameter: ISizeInfo;
      function GetDryMassKilograms: Double;
      function GetDryMassPounds: Double;
      function GetFirstFlight: TDateTime;
      function GetFlickrImages: TStringList;
      function GetHeatShield: IDragonHeatshield;
      function GetHeightWithTrunk: ISizeInfo;
      function GetId: string;
      function GetLaunchPayloadMass: IMassInfo;
      function GetLaunchPayloadVolume: IVolumeInfo;
      function GetName: string;
      function GetOrbitDurationYears: LongWord;
      function GetPressurizedCapsule: IDragonPressurizedCapsule;
      function GetReturnPayloadMass: IMassInfo;
      function GetReturnPayloadVolume: IVolumeInfo;
      function GetSidewallAngleDegress: LongWord;
      function GetThrusters: IDragonThrustersList;
      function GetTrunk: TDragonTrunk;
      function GetTypeInfo: string;
      function GetWikipedia: string;

      procedure SetActive(AValue: Boolean);
      procedure SetCrewCapacity(AValue: Byte);
      procedure SetDescription(AValue: string);
      procedure SetDiameter(AValue: ISizeInfo);
      procedure SetDryMassKilograms(AValue: Double);
      procedure SetDryMassPounds(AValue: Double);
      procedure SetFirstFlight(AValue: TDateTime);
      procedure SetFlickrImages(AValue: TStringList);
      procedure SetHeatShield(AValue: IDragonHeatshield);
      procedure SetHeightWithTrunk(AValue: ISizeInfo);
      procedure SetId(AValue: string);
      procedure SetLaunchPayloadMass(AValue: IMassInfo);
      procedure SetLaunchPayloadVolume(AValue: IVolumeInfo);
      procedure SetName(AValue: string);
      procedure SetOrbitDurationYears(AValue: LongWord);
      procedure SetPressurizedCapsule(AValue: IDragonPressurizedCapsule);
      procedure SetReturnPayloadMass(AValue: IMassInfo);
      procedure SetReturnPayloadVolume(AValue: IVolumeInfo);
      procedure SetSidewallAngleDegress(AValue: LongWord);
      procedure SetThrusters(AValue: IDragonThrustersList);
      procedure SetTrunk(AValue: TDragonTrunk);
      procedure SetTypeInfo(AValue: string);
      procedure SetWikipedia(AValue: string);
    end;

    { IDragon }

    IDragon = interface(IBaseDragon) ['{EEEAFF17-37AF-49EB-A43A-59C92343C4E0}']
      property Active: Boolean read GetActive write SetActive;
      property CrewCapacity: Byte read GetCrewCapacity write SetCrewCapacity;
      property Description: string read GetDescription write SetDescription;
      //property Diameter: ISizeInfo read GetDiameter write SetDiameter; // need to define sizeinfo object
      property DryMassKilograms: Double read GetDryMassKilograms write SetDryMassKilograms;
      property DryMassPounds: Double read GetDryMassPounds write SetDryMassPounds;
      property FirstFlight: TDateTime read GetFirstFlight write SetFirstFlight;
      property FlickrImages: TStringList read GetFlickrImages write SetFlickrImages;
      //property HeatShield: IDragonHeatshield read GetHeatShield write SetHeatShield;
      //property HeightWithTrunk: ISizeInfo read GetHeightWithTrunk write SetHeightWithTrunk;
      property Id: string read GetId write SetId;
      //property LaunchPayloadMass: IMassInfo read GetLaunchPayloadMass write SetLaunchPayloadMass;
      //property LaunchPayloadVolume: IVolumeInfo read GetLaunchPayloadVolume write SetLaunchPayloadVolume;
      property Name: string read GetName write SetName;
      property OrbitDurationYears: LongWord read GetOrbitDurationYears write SetOrbitDurationYears;
      //property PressurizedCapsule: IDragonPressurizedCapsule read GetPressurizedCapsule write SetPressurizedCapsule;
      //property ReturnPayloadMass: IMassInfo read GetReturnPayloadMass write SetReturnPayloadMass;
      //property ReturnPayloadVolume: IVolumeInfo read GetReturnPayloadVolume write SetReturnPayloadVolume;
      property SidewallAngleDegress: LongWord read GetSidewallAngleDegress write SetSidewallAngleDegress;
      //property Thrusters: IDragonThrustersList read GetThrusters write SetThrusters; // need to define dragonthrustersinfolist object
      //property Trunk: TDragonTrunk read GetTrunk write SetTrunk; // need to define dragontrunkinfo object
      property TypeInfo: string read GetTypeInfo write SetTypeInfo;  // Type is a reserved word in pascal
      property Wikipedia: string read GetWikipedia write SetWikipedia;
    end;

    { IDragonList }

    IDragonList = interface(IBaseModelList) ['{D4C2474C-5CCF-4C67-BB86-3F3B3F15A91F}']

    end;

function NewDragon: IDragon;
function NewDragonList: IDragonList;

implementation

type

    { TDragon }

    TDragon = class(TBaseModel, IDragon)
    private
      FActive: Boolean;
      FCrewCapacity: Byte;
      FDescription: string;
      FDiameter: ISizeInfo;
      FDryMassKilograms: Double;
      FDryMassPounds: Double;
      FFirstFlight: TDateTime;
      FFlickrImages: TStringList;
      FHeatShield: IDragonHeatshield;
      FHeightWithTrunk: ISizeInfo;
      FId: string;
      FLaunchPayloadMass: IMassInfo;
      FLaunchPayloadVolume: IVolumeInfo;
      FName: string;
      FOrbitDurationYears: LongWord;
      FPressurizedCapsule: IDragonPressurizedCapsule;
      FReturnPayloadMass: IMassInfo;
      FReturnPayloadVolume: IVolumeInfo;
      FSidewallAngleDegress: LongWord;
      FThrusters: IDragonThrustersList;
      FTrunk: TDragonTrunk;
      FTypeInfo: string;
      FWikipedia: string;
    private
      function GetActive: Boolean;
      function GetCrewCapacity: Byte;
      function GetDescription: string;
      function GetDiameter: ISizeInfo;
      function GetDryMassKilograms: Double;
      function GetDryMassPounds: Double;
      function GetFirstFlight: TDateTime;
      function GetFlickrImages: TStringList;
      function GetHeatShield: IDragonHeatshield;
      function GetHeightWithTrunk: ISizeInfo;
      function GetId: string;
      function GetLaunchPayloadMass: IMassInfo;
      function GetLaunchPayloadVolume: IVolumeInfo;
      function GetName: string;
      function GetOrbitDurationYears: LongWord;
      function GetPressurizedCapsule: IDragonPressurizedCapsule;
      function GetReturnPayloadMass: IMassInfo;
      function GetReturnPayloadVolume: IVolumeInfo;
      function GetSidewallAngleDegress: LongWord;
      function GetThrusters: IDragonThrustersList;
      function GetTrunk: TDragonTrunk;
      function GetTypeInfo: string;
      function GetWikipedia: string;
    private
      procedure SetActive(AValue: Boolean);
      procedure SetCrewCapacity(AValue: Byte);
      procedure SetDescription(AValue: string);
      procedure SetDiameter(AValue: ISizeInfo);
      procedure SetDryMassKilograms(AValue: Double);
      procedure SetDryMassPounds(AValue: Double);
      procedure SetFirstFlight(AValue: TDateTime);
      procedure SetFirstFlight(AValue: string);
      procedure SetFlickrImages(AValue: TStringList);
      procedure SetHeatShield(AValue: IDragonHeatshield);
      procedure SetHeightWithTrunk(AValue: ISizeInfo);
      procedure SetId(AValue: string);
      procedure SetLaunchPayloadMass(AValue: IMassInfo);
      procedure SetLaunchPayloadVolume(AValue: IVolumeInfo);
      procedure SetName(AValue: string);
      procedure SetOrbitDurationYears(AValue: LongWord);
      procedure SetPressurizedCapsule(AValue: IDragonPressurizedCapsule);
      procedure SetReturnPayloadMass(AValue: IMassInfo);
      procedure SetReturnPayloadVolume(AValue: IVolumeInfo);
      procedure SetSidewallAngleDegress(AValue: LongWord);
      procedure SetThrusters(AValue: IDragonThrustersList);
      procedure SetTrunk(AValue: TDragonTrunk);
      procedure SetTypeInfo(AValue: string);
      procedure SetWikipedia(AValue: string);
    public
      destructor Destroy; override;
    published
      property active: Boolean read GetActive write SetActive;
      property crew_capacity: Byte read GetCrewCapacity write SetCrewCapacity;
      property description: string read GetDescription write SetDescription;
      //property diameter: ISizeInfo read GetDiameter write SetDiameter; // need to define sizeinfo object
      property dry_mass_kilograms: Double read GetDryMassKilograms write SetDryMassKilograms;
      property dry_mass_pounds: Double read GetDryMassPounds write SetDryMassPounds;
      property first_flight: string write SetFirstFlight;
      property flickr_images: TStringList read GetFlickrImages write SetFlickrImages;
      //property heat_shield: IDragonHeatshield read GetHeatShield write SetHeatShield;
      //property height_with_trunk: ISizeInfo read GetHeightWithTrunk write SetHeightWithTrunk;
      property id: string read GetId write SetId;
      //property launch_payload_mass: IMassInfo read GetLaunchPayloadMass write SetLaunchPayloadMass;
      //property launch_payload_volume: IVolumeInfo read GetLaunchPayloadVolume write SetLaunchPayloadVolume;
      property name: string read GetName write SetName;
      property orbit_duration_years: LongWord read GetOrbitDurationYears write SetOrbitDurationYears;
      //property pressurized_capsule: IDragonPressurizedCapsule read GetPressurizedCapsule write SetPressurizedCapsule;
      //property return_payload_mass: IMassInfo read GetReturnPayloadMass write SetReturnPayloadMass;
      //property return_payload_volume: IVolumeInfo read GetReturnPayloadVolume write SetReturnPayloadVolume;
      property sidewall_angle_degress: LongWord read GetSidewallAngleDegress write SetSidewallAngleDegress;
      //property thrusters: IDragonThrustersList read GetThrusters write SetThrusters; // need to define dragonthrustersinfolist object
      //property trunk: TDragonTrunk read GetTrunk write SetTrunk; // need to define dragontrunkinfo object
      property type_info: string read GetTypeInfo write SetTypeInfo;  // Type is a reserved word in pascal
      property wikipedia: string read GetWikipedia write SetWikipedia;
    end;

    { TDragonList }

    TDragonList = class(TBaseModelList, IDragonList)
      function NewItem: IBaseModel; override;
    end;

function NewDragon: IDragon;
begin
  Result := TDragon.Create;
  Result.FlickrImages := TStringList.Create;
end;

function NewDragonList: IDragonList;
begin
  Result := TDragonList.Create;
end;

function TDragonList.NewItem: IBaseModel;
begin
  Result := NewDragon;
end;

{ TDragon }

function TDragon.GetActive: Boolean;
begin
  Result := FActive;
end;

function TDragon.GetCrewCapacity: Byte;
begin
  Result := FCrewCapacity;
end;

function TDragon.GetDescription: string;
begin
  Result := FDescription;
end;

function TDragon.GetDiameter: ISizeInfo;
begin
  Result := FDiameter;
end;

function TDragon.GetDryMassKilograms: Double;
begin
  Result := FDryMassKilograms;
end;

function TDragon.GetDryMassPounds: Double;
begin
  Result := FDryMassPounds;
end;

function TDragon.GetFirstFlight: TDateTime;
begin
  Result := FFirstFlight;
end;

function TDragon.GetFlickrImages: TStringList;
begin
  Result := FFlickrImages;
end;

function TDragon.GetHeatShield: IDragonHeatshield;
begin
  Result := FHeatShield;
end;

function TDragon.GetHeightWithTrunk: ISizeInfo;
begin
  Result := FHeightWithTrunk;
end;

function TDragon.GetId: string;
begin
  Result := FId;
end;

function TDragon.GetLaunchPayloadMass: IMassInfo;
begin
  Result := FLaunchPayloadMass;
end;

function TDragon.GetLaunchPayloadVolume: IVolumeInfo;
begin
  Result := FLaunchPayloadVolume;
end;

function TDragon.GetName: string;
begin
  Result := FName;
end;

function TDragon.GetOrbitDurationYears: LongWord;
begin
  Result := FOrbitDurationYears;
end;

function TDragon.GetPressurizedCapsule: IDragonPressurizedCapsule;
begin
  Result := FPressurizedCapsule;
end;

function TDragon.GetReturnPayloadMass: IMassInfo;
begin
  Result := FReturnPayloadMass;
end;

function TDragon.GetReturnPayloadVolume: IVolumeInfo;
begin
  Result := FReturnPayloadVolume;
end;

function TDragon.GetSidewallAngleDegress: LongWord;
begin
  Result := FSidewallAngleDegress;
end;

function TDragon.GetThrusters: IDragonThrustersList;
begin
  Result := FThrusters;
end;

function TDragon.GetTrunk: TDragonTrunk;
begin
  Result := FTrunk;
end;

function TDragon.GetTypeInfo: string;
begin
  Result := FTypeInfo;
end;

function TDragon.GetWikipedia: string;
begin
  Result := FWikipedia;
end;

procedure TDragon.SetActive(AValue: Boolean);
begin
  FActive := AValue;
end;

procedure TDragon.SetCrewCapacity(AValue: Byte);
begin
  FCrewCapacity := AValue;
end;

procedure TDragon.SetDescription(AValue: string);
begin
  FDescription := AValue;
end;

procedure TDragon.SetDiameter(AValue: ISizeInfo);
begin
  FDiameter := AValue;
end;

procedure TDragon.SetDryMassKilograms(AValue: Double);
begin
  FDryMassKilograms := AValue;
end;

procedure TDragon.SetDryMassPounds(AValue: Double);
begin
  FDryMassPounds := AValue;
end;

procedure TDragon.SetFirstFlight(AValue: TDateTime);
begin
  FFirstFlight := AValue;
end;

procedure TDragon.SetFirstFlight(AValue: string);
begin
  try
    FormatSettings.DateSeparator := '-';
    FormatSettings.ShortDateFormat := 'y/m/d';
    FFirstFlight := StrToDate(AValue);
  finally
    FormatSettings := DefaultFormatSettings;
  end;
end;

procedure TDragon.SetFlickrImages(AValue: TStringList);
begin
  FFlickrImages := AValue;
end;

procedure TDragon.SetHeatShield(AValue: IDragonHeatshield);
begin
  FHeatShield := AValue;
end;

procedure TDragon.SetHeightWithTrunk(AValue: ISizeInfo);
begin
  FHeightWithTrunk := AValue;
end;

procedure TDragon.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TDragon.SetLaunchPayloadMass(AValue: IMassInfo);
begin
  FLaunchPayloadMass := AValue;
end;

procedure TDragon.SetLaunchPayloadVolume(AValue: IVolumeInfo);
begin
  FLaunchPayloadVolume := AValue;
end;

procedure TDragon.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TDragon.SetOrbitDurationYears(AValue: LongWord);
begin
  FOrbitDurationYears := AValue;
end;

procedure TDragon.SetPressurizedCapsule(AValue: IDragonPressurizedCapsule);
begin
  FPressurizedCapsule := AValue;
end;

procedure TDragon.SetReturnPayloadMass(AValue: IMassInfo);
begin
  FReturnPayloadMass := AValue;
end;

procedure TDragon.SetReturnPayloadVolume(AValue: IVolumeInfo);
begin
  FReturnPayloadVolume := AValue;
end;

procedure TDragon.SetSidewallAngleDegress(AValue: LongWord);
begin
  FSidewallAngleDegress := AValue;
end;

procedure TDragon.SetThrusters(AValue: IDragonThrustersList);
begin
  FThrusters := AValue;
end;

procedure TDragon.SetTrunk(AValue: TDragonTrunk);
begin
  FTrunk := AValue;
end;

procedure TDragon.SetTypeInfo(AValue: string);
begin
  FTypeInfo := AValue;
end;

procedure TDragon.SetWikipedia(AValue: string);
begin
  FWikipedia := AValue;
end;

destructor TDragon.Destroy;
begin
  FFlickrImages.Free;
  inherited Destroy;
end;

end.

