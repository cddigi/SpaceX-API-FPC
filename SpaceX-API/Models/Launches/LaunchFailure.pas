unit LaunchFailure;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Generics.Collections;

type
  TLaunchFailure = class(TInterfacedObject)
    Time: Integer;
    Altitude: LongWord;
    Reason: string;
  end;

  TLaunchFailureList = specialize TObjectList<TLaunchFailure>;

implementation

end.

