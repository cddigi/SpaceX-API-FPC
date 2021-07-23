unit RocketPotentialPayload;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, RocketFairing;

type
  TRocketPotentialPayload = class(TInterfacedObject)
  public
    Fairing: TRocketFairing;
    Option: string;
  end;

implementation

end.

