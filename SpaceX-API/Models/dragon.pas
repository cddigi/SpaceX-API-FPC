unit Dragon;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
    TDragon = class
    private
      { Implement private fields here. }
      ID: string;
      Name: string;
      TypeInfo: string;  // Type is a reserved word in pascal
      Active: Boolean;
      Wikipedia: string;
      Description: string;
      //Diameter: TSizeInfo; // need to define sizeinfo object
      //Trunk: TDragonTrunkInfo; // need to define dragontrunkinfo object
      //Thrusters: TDragonThrustersInfoList; // need to define dragonthrustersinfolist object
      CrewCapacity: LongWord; // unsigned 32 bit integer (could we consider making this even smaller?)
      SidewallAngleDegress: LongWord;
      OrbitDurationYears: LongWord;
      DryMassKilograms: Double;
      DryMassPounds: Double;
      FirstFlight: TDateTime;
      FlickrImages: TStringList;
      //HeightWithTrunk: TSizeInfo;
      //HeatShield: TDragonHeatshieldInfo;
      //LaunchPayloadMass: TMassInfo;
      //LaunchPayloadVolume: TVolumeInfo
      //ReturnPayloadMass: TMassInfo
      //ReturnPayloadVolume: TVolumeInfo;
      //PressurizedCapsule: TDragonPressurizedCapsuleInfo;

    public
      { Implement public firlds here. }

    end;

implementation

end.

