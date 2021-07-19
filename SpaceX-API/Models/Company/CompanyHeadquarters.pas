unit CompanyHeadquarters;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TCompanyHeadquarters = class(TInterfacedObject)
    Address: string;
    City: string;
    State: string;
  end;

implementation

end.

