unit ThrustInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TThrustInfo }

  TThrustInfo = class(TInterfacedObject)
    Kilonewtons: Double;
    PoundForce: Double;
    function ToString(): string; override;
  end;

implementation

{ TThrustInfo }

function TThrustInfo.ToString(): string;
begin
  Result := Kilonewtons.ToString() + ' kn (' + PoundForce.ToString() + ' lbf)';
end;

end.

