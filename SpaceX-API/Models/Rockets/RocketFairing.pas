unit RocketFairing;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SizeInfo;

type
  TRocketFairing = class(TInterfacedObject)
  public
    Height: ISizeInfo;
    Diameter: ISizeInfo;
  end;

implementation

end.

