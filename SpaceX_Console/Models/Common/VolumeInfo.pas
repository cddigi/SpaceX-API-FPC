unit VolumeInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TVolumeInfo = class(TInterfacedObject)
    CubicMeters: Double;
    CubicFeet: Double;
    function ToString(): string; override;
  end;

implementation

function TVolumeInfo.ToString(): string;
begin
  Result := CubicFeet.ToString() + ' m^3 ' + CubicFeet.ToString() + ' ft^3';
end;

end.

