unit Company;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, CompanyHeadquarters, CompanyLinks;

type

  { TCompany }

  TCompany = class(TInterfacedObject)
    Id: string;
    Name: string;
    Founder: string;
    Employees: LongWord;
    Vehicles: LongWord;
    CEO: string;
    CTO: string;
    COO: string;
    Valuation: UInt64; // unsigned 64bit integer, clearer than QWord
    Summary: string;
    Headquarters: TCompanyHeadquarters;
    Links: TCompanyLinks;
    FoundedYear: LongWord;
    LaunchSites: LongWord;
    TestSites: LongWord;
    CtoPropulsion: string;
    function ToString(): string; override;
  end;

implementation

{ TCompany }

function TCompany.ToString(): string;
begin
  Result := Name;
end;

end.

