unit Dragon;

{$mode objfpc}{$H+}

interface

uses
  Classes, DragonHeatshield, DragonPressurizedCapsule, DragonThrusters,
  DragonTrunk, MassInfo, SizeInfo, SysUtils, VolumeInfo;

type

    { IBaseDragon }

    IBaseDragon = interface(IInterface) ['{B25B729F-DAA4-4ECD-8F2F-7297EDA11B28}']
      function GetActive: Boolean;
      function GetCrewCapacity: Byte;
      function GetDescription: string;
      function GetDiameter: TSizeInfo;
      function GetDryMassKilograms: Double;
      function GetDryMassPounds: Double;
      function GetFirstFlight: TDateTime;
      function GetFlickrImages: TStringList;
      function GetHeatShield: TDragonHeatshield;
      function GetHeightWithTrunk: TSizeInfo;
      function GetId: string;
      function GetLaunchPayloadMass: IMassInfo;
      function GetLaunchPayloadVolume: TVolumeInfo;
      function GetName: string;
      function GetOrbitDurationYears: LongWord;
      function GetPressurizedCapsule: TDragonPressurizedCapsule;
      function GetReturnPayloadMass: IMassInfo;
      function GetReturnPayloadVolume: TVolumeInfo;
      function GetSidewallAngleDegress: LongWord;
      function GetThrusters: TDragonThrustersList;
      function GetTrunk: TDragonTrunk;
      function GetTypeInfo: string;
      function GetWikipedia: string;

      procedure SetActive(AValue: Boolean);
      procedure SetCrewCapacity(AValue: Byte);
      procedure SetDescription(AValue: string);
      procedure SetDiameter(AValue: TSizeInfo);
      procedure SetDryMassKilograms(AValue: Double);
      procedure SetDryMassPounds(AValue: Double);
      procedure SetFirstFlight(AValue: TDateTime);
      procedure SetFlickrImages(AValue: TStringList);
      procedure SetHeatShield(AValue: TDragonHeatshield);
      procedure SetHeightWithTrunk(AValue: TSizeInfo);
      procedure SetId(AValue: string);
      procedure SetLaunchPayloadMass(AValue: IMassInfo);
      procedure SetLaunchPayloadVolume(AValue: TVolumeInfo);
      procedure SetName(AValue: string);
      procedure SetOrbitDurationYears(AValue: LongWord);
      procedure SetPressurizedCapsule(AValue: TDragonPressurizedCapsule);
      procedure SetReturnPayloadMass(AValue: IMassInfo);
      procedure SetReturnPayloadVolume(AValue: TVolumeInfo);
      procedure SetSidewallAngleDegress(AValue: LongWord);
      procedure SetThrusters(AValue: TDragonThrustersList);
      procedure SetTrunk(AValue: TDragonTrunk);
      procedure SetTypeInfo(AValue: string);
      procedure SetWikipedia(AValue: string);
    end;

    { IDragon }

    IDragon = interface(IBaseDragon) ['{EEEAFF17-37AF-49EB-A43A-59C92343C4E0}']
      property Active: Boolean read GetActive write SetActive;
      property CrewCapacity: Byte read GetCrewCapacity write SetCrewCapacity;
      property Description: string read GetDescription write SetDescription;
      property Diameter: TSizeInfo read GetDiameter write SetDiameter; // need to define sizeinfo object
      property DryMassKilograms: Double read GetDryMassKilograms write SetDryMassKilograms;
      property DryMassPounds: Double read GetDryMassPounds write SetDryMassPounds;
      property FirstFlight: TDateTime read GetFirstFlight write SetFirstFlight;
      property FlickrImages: TStringList read GetFlickrImages write SetFlickrImages;
      property HeatShield: TDragonHeatshield read GetHeatShield write SetHeatShield;
      property HeightWithTrunk: TSizeInfo read GetHeightWithTrunk write SetHeightWithTrunk;
      property Id: string read GetId write SetId;
      property LaunchPayloadMass: IMassInfo read GetLaunchPayloadMass write SetLaunchPayloadMass;
      property LaunchPayloadVolume: TVolumeInfo read GetLaunchPayloadVolume write SetLaunchPayloadVolume;
      property Name: string read GetName write SetName;
      property OrbitDurationYears: LongWord read GetOrbitDurationYears write SetOrbitDurationYears;
      property PressurizedCapsule: TDragonPressurizedCapsule read GetPressurizedCapsule write SetPressurizedCapsule;
      property ReturnPayloadMass: IMassInfo read GetReturnPayloadMass write SetReturnPayloadMass;
      property ReturnPayloadVolume: TVolumeInfo read GetReturnPayloadVolume write SetReturnPayloadVolume;
      property SidewallAngleDegress: LongWord read GetSidewallAngleDegress write SetSidewallAngleDegress;
      property Thrusters: TDragonThrustersList read GetThrusters write SetThrusters; // need to define dragonthrustersinfolist object
      property Trunk: TDragonTrunk read GetTrunk write SetTrunk; // need to define dragontrunkinfo object
      property TypeInfo: string read GetTypeInfo write SetTypeInfo;  // Type is a reserved word in pascal
      property Wikipedia: string read GetWikipedia write SetWikipedia;
    end;

    { IDragonList }

    IDragonList = interface(IInterfaceList) ['{D4C2474C-5CCF-4C67-BB86-3F3B3F15A91F}']

    end;

function NewDragon: IDragon;
function NewDragonList: IDragonList;

implementation

type

    { TDragon }

    TDragon = class(TInterfacedObject, IDragon)
    private
      FActive: Boolean;
      FCrewCapacity: Byte;
      FDescription: string;
      FDiameter: TSizeInfo; // need to define sizeinfo object
      FDryMassKilograms: Double;
      FDryMassPounds: Double;
      FFirstFlight: TDateTime;
      FFlickrImages: TStringList;
      FHeatShield: TDragonHeatshield;
      FHeightWithTrunk: TSizeInfo;
      FId: string;
      FLaunchPayloadMass: IMassInfo;
      FLaunchPayloadVolume: TVolumeInfo;
      FName: string;
      FOrbitDurationYears: LongWord;
      FPressurizedCapsule: TDragonPressurizedCapsule;
      FReturnPayloadMass: IMassInfo;
      FReturnPayloadVolume: TVolumeInfo;
      FSidewallAngleDegress: LongWord;
      FThrusters: TDragonThrustersList; // need to define dragonthrustersinfolist object
      FTrunk: TDragonTrunk; // need to define dragontrunkinfo object
      FTypeInfo: string;  // Type is a reserved word in pascal
      FWikipedia: string;
    private
      function GetActive: Boolean;
      function GetCrewCapacity: Byte;
      function GetDescription: string;
      function GetDiameter: TSizeInfo;
      function GetDryMassKilograms: Double;
      function GetDryMassPounds: Double;
      function GetFirstFlight: TDateTime;
      function GetFlickrImages: TStringList;
      function GetHeatShield: TDragonHeatshield;
      function GetHeightWithTrunk: TSizeInfo;
      function GetId: string;
      function GetLaunchPayloadMass: IMassInfo;
      function GetLaunchPayloadVolume: TVolumeInfo;
      function GetName: string;
      function GetOrbitDurationYears: LongWord;
      function GetPressurizedCapsule: TDragonPressurizedCapsule;
      function GetReturnPayloadMass: IMassInfo;
      function GetReturnPayloadVolume: TVolumeInfo;
      function GetSidewallAngleDegress: LongWord;
      function GetThrusters: TDragonThrustersList;
      function GetTrunk: TDragonTrunk;
      function GetTypeInfo: string;
      function GetWikipedia: string;
    private
      procedure SetActive(AValue: Boolean);
      procedure SetCrewCapacity(AValue: Byte);
      procedure SetDescription(AValue: string);
      procedure SetDiameter(AValue: TSizeInfo);
      procedure SetDryMassKilograms(AValue: Double);
      procedure SetDryMassPounds(AValue: Double);
      procedure SetFirstFlight(AValue: TDateTime);
      procedure SetFlickrImages(AValue: TStringList);
      procedure SetHeatShield(AValue: TDragonHeatshield);
      procedure SetHeightWithTrunk(AValue: TSizeInfo);
      procedure SetId(AValue: string);
      procedure SetLaunchPayloadMass(AValue: IMassInfo);
      procedure SetLaunchPayloadVolume(AValue: TVolumeInfo);
      procedure SetName(AValue: string);
      procedure SetOrbitDurationYears(AValue: LongWord);
      procedure SetPressurizedCapsule(AValue: TDragonPressurizedCapsule);
      procedure SetReturnPayloadMass(AValue: IMassInfo);
      procedure SetReturnPayloadVolume(AValue: TVolumeInfo);
      procedure SetSidewallAngleDegress(AValue: LongWord);
      procedure SetThrusters(AValue: TDragonThrustersList);
      procedure SetTrunk(AValue: TDragonTrunk);
      procedure SetTypeInfo(AValue: string);
      procedure SetWikipedia(AValue: string);
    public
      { Implement public fields here. }

    end;

    { TDragonList }

    TDragonList = class(TInterfaceList, IDragonList)

    end;

function NewDragon: IDragon;
begin
  Result := TDragon.Create;
end;

function NewDragonList: IDragonList;
begin
  Result := TDragonList.Create;
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

function TDragon.GetDiameter: TSizeInfo;
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

function TDragon.GetHeatShield: TDragonHeatshield;
begin
  Result := FHeatShield;
end;

function TDragon.GetHeightWithTrunk: TSizeInfo;
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

function TDragon.GetLaunchPayloadVolume: TVolumeInfo;
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

function TDragon.GetPressurizedCapsule: TDragonPressurizedCapsule;
begin
  Result := FPressurizedCapsule;
end;

function TDragon.GetReturnPayloadMass: IMassInfo;
begin
  Result := FReturnPayloadMass;
end;

function TDragon.GetReturnPayloadVolume: TVolumeInfo;
begin
  Result := FReturnPayloadVolume;
end;

function TDragon.GetSidewallAngleDegress: LongWord;
begin
  Result := FSidewallAngleDegress;
end;

function TDragon.GetThrusters: TDragonThrustersList;
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

procedure TDragon.SetDiameter(AValue: TSizeInfo);
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

procedure TDragon.SetFlickrImages(AValue: TStringList);
begin
  FFlickrImages := AValue;
end;

procedure TDragon.SetHeatShield(AValue: TDragonHeatshield);
begin
  FHeatShield := AValue;
end;

procedure TDragon.SetHeightWithTrunk(AValue: TSizeInfo);
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

procedure TDragon.SetLaunchPayloadVolume(AValue: TVolumeInfo);
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

procedure TDragon.SetPressurizedCapsule(AValue: TDragonPressurizedCapsule);
begin
  FPressurizedCapsule := AValue;
end;

procedure TDragon.SetReturnPayloadMass(AValue: IMassInfo);
begin
  FReturnPayloadMass := AValue;
end;

procedure TDragon.SetReturnPayloadVolume(AValue: TVolumeInfo);
begin
  FReturnPayloadVolume := AValue;
end;

procedure TDragon.SetSidewallAngleDegress(AValue: LongWord);
begin
  FSidewallAngleDegress := AValue;
end;

procedure TDragon.SetThrusters(AValue: TDragonThrustersList);
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

end.

