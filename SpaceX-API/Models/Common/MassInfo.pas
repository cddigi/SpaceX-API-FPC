unit MassInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TMassInfo }

  TMassInfo = class(TInterfacedObject)
    Kilograms: Double;
    Pounds: Double;
    function ToString(): string; override;
  end;

implementation

{ TMassInfo }

function TMassInfo.ToString(): string;
begin
  Result := Kilograms.ToString() + ' kg (' + Pounds.ToString() + ' lb)';       // consider replacing with Format()
end;

end.

