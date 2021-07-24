unit SizeInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TSizeInfo }

  TSizeInfo = class(TInterfacedObject)
    Meters: Double;
    Feet: Double;
    function ToString(): string; override;
  end;

implementation

{ TSizeInfo }

function TSizeInfo.ToString(): string;
begin
  Result := Meters.ToString() + ' m (' + Feet.ToString() + ' ft)';
end;

end.

