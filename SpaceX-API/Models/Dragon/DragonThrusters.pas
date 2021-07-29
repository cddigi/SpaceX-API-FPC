unit DragonThrusters;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ThrustInfo, Generics.Collections;

type
  TDragonThrusters = class(TInterfacedObject)
    TypeInfo: string;
    Amount: LongWord;
    Pods: LongWord;
    Isp: LongWord;
    Thrust: IThrustInfo;
    FirstFuel: string;
    SecondFuel: string;
  end;

  TDragonThrustersList = specialize TObjectList<TDragonThrusters>;

implementation

end.

