unit Dragon;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, VolumeInfo, DragonHeatshield, DragonPressurizedCapsule, DragonTrunk, DragonThrusters, SizeInfo,
  MassInfo;

type
    TDragon = class(TInterfacedObject)
    private
      { Implement private fields here. }
      ID: string;
      Name: string;
      TypeInfo: string;  // Type is a reserved word in pascal
      Active: Boolean;
      Wikipedia: string;
      Description: string;
      Diameter: TSizeInfo; // need to define sizeinfo object
      Trunk: TDragonTrunk; // need to define dragontrunkinfo object
      Thrusters: TDragonThrustersList; // need to define dragonthrustersinfolist object
      CrewCapacity: LongWord; // unsigned 32 bit integer (could we consider making this even smaller?)
      SidewallAngleDegress: LongWord;
      OrbitDurationYears: LongWord;
      DryMassKilograms: Double;
      DryMassPounds: Double;
      FirstFlight: TDateTime;
      FlickrImages: TStringList;
      HeightWithTrunk: TSizeInfo;
      HeatShield: TDragonHeatshield;
      LaunchPayloadMass: TMassInfo;
      LaunchPayloadVolume: TVolumeInfo;
      ReturnPayloadMass: TMassInfo;
      ReturnPayloadVolume: TVolumeInfo;
      PressurizedCapsule: TDragonPressurizedCapsule;

    public
      { Implement public firlds here. }

    end;

implementation

end.

