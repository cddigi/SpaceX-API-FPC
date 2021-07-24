unit RocketPotentialPayloadWeight;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TRocketPotentialPayloadWeight = class(TInterfacedObject)
  public
    Id: string;
    Name: string;
    Kilograms: Double;
    Pounds: Double;
  end;


implementation

end.

