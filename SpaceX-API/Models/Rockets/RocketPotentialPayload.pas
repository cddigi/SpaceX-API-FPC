unit RocketPotentialPayload;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, RocketFairing;

type
  TRocketPotentialPayload = class(TInterfacedObject)
  public
    Fairing: IRocketFairing;
    Option: string;
  end;

implementation

end.

