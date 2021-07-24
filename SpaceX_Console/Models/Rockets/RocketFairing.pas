unit RocketFairing;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SizeInfo;

type
  TRocketFairing = class(TInterfacedObject)
  public
    Height: TSizeInfo;
    Diameter: TSizeInfo;
  end;

implementation

end.

