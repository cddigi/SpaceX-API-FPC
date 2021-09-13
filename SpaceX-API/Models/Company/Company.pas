unit Company;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseModel, CompanyHeadquarters, CompanyLinks;

type

  IBaseCompany = interface(IBaseModel) ['{AB9CEA45-E3B6-4C08-A2BB-15F5C7CA232E}']
    function GetId: string;
    function GetName: string;
    function GetFounder: string;
    function GetEmployees: LongWord;
    function GetVehicles: LongWord;
    function GetCEO: string;
    function GetCTO: string;
    function GetCOO: string;
    function GetValuation: UInt64;
    function GetSummary: string;
    function GetHeadquarters: ICompanyHeadquarters;
    function GetLinks: ICompanyLinks;
    function GetFoundedYear: LongWord;
    function GetLaunchSites: LongWord;
    function GetTestSites: LongWord;
    function GetCtoPropulsion: string;

    procedure SetId(AValue: string);
    procedure SetName(AValue: string);
    procedure SetFounder(AValue: string);
    procedure SetEmployees(AValue: LongWord);
    procedure SetVehicles(AValue: LongWord);
    procedure SetCEO(AValue: string);
    procedure SetCTO(AValue: string);
    procedure SetCOO(AValue: string);
    procedure SetValuation(AValue: UInt64);
    procedure SetSummary(AValue: string);
    procedure SetHeadquarters(AValue: ICompanyHeadquarters);
    procedure SetLinks(AValue: ICompanyLinks);
    procedure SetFoundedYear(AValue: LongWord);
    procedure SetLaunchSites(AValue: LongWord);
    procedure SetTestSites(AValue: LongWord);
    procedure SetCtoPropulsion(AValue: string);
  end;

  ICompany = interface(IBaseCompany) ['{81A8951C-05DE-4FC7-8277-5D8B38549FA2}']
    function ToString: string;

    property CEO: string read GetCEO write SetCEO;
    property COO: string read GetCOO write SetCOO;
    property CTO: string read GetCTO write SetCTO;
    property CtoPropulsion: string read GetCtoPropulsion write SetCtoPropulsion;
    property Employees: LongWord read GetEmployees write SetEmployees;
    property FoundedYear: LongWord read GetFoundedYear write SetFoundedYear;
    property Founder: string read GetFounder write SetFounder;
    property Headquarters: ICompanyHeadquarters read GetHeadquarters write SetHeadquarters;
    property Id: string read GetId write SetId;
    property LaunchSites: LongWord read GetLaunchSites write SetLaunchSites;
    property Links: ICompanyLinks read GetLinks write SetLinks;
    property Name: string read GetName write SetName;
    property Summary: string read GetSummary write SetSummary;
    property TestSites: LongWord read GetTestSites write SetTestSites;
    property Valuation: UInt64 read GetValuation write SetValuation;
    property Vehicles: LongWord read GetVehicles write SetVehicles;
  end;

function NewCompany: ICompany;

implementation

uses
  JSON_Helper;

type

  { TCompany }

  TCompany = class(TBaseModel, ICompany)
  private
    FId: string;
    FName: string;
    FFounder: string;
    FEmployees: LongWord;
    FVehicles: LongWord;
    FCEO: string;
    FCTO: string;
    FCOO: string;
    FValuation: UInt64; // unsigned 64bit integer, clearer than QWord
    FSummary: string;
    FHeadquarters: ICompanyHeadquarters;
    FLinks: ICompanyLinks;
    FFoundedYear: LongWord;
    FLaunchSites: LongWord;
    FTestSites: LongWord;
    FCtoPropulsion: string;
  private
    function GetId: string;
    function GetName: string;
    function GetFounder: string;
    function GetEmployees: LongWord;
    function GetVehicles: LongWord;
    function GetCEO: string;
    function GetCTO: string;
    function GetCOO: string;
    function GetValuation: UInt64;
    function GetSummary: string;
    function GetHeadquarters: ICompanyHeadquarters;
    function GetLinks: ICompanyLinks;
    function GetFoundedYear: LongWord;
    function GetLaunchSites: LongWord;
    function GetTestSites: LongWord;
    function GetCtoPropulsion: string;
  private
    procedure SetId(AValue: string);
    procedure SetName(AValue: string);
    procedure SetFounder(AValue: string);
    procedure SetEmployees(AValue: LongWord);
    procedure SetVehicles(AValue: LongWord);
    procedure SetCEO(AValue: string);
    procedure SetCTO(AValue: string);
    procedure SetCOO(AValue: string);
    procedure SetValuation(AValue: UInt64);
    procedure SetSummary(AValue: string);
    procedure SetHeadquarters(AValue: ICompanyHeadquarters);
    procedure SetLinks(AValue: ICompanyLinks);
    procedure SetFoundedYear(AValue: LongWord);
    procedure SetLaunchSites(AValue: LongWord);
    procedure SetTestSites(AValue: LongWord);
    procedure SetCtoPropulsion(AValue: string);
  public
    function ToString: string; override;
  public
    procedure BuildSubObjects(const JSONData: IJSONData); override;
  published
    property ceo: string read GetCEO write SetCEO;
    property coo: string read GetCOO write SetCOO;
    property cto: string read GetCTO write SetCTO;
    property cto_propulsion: string read GetCtoPropulsion write SetCtoPropulsion;
    property employees: LongWord read GetEmployees write SetEmployees;
    property founded: LongWord read GetFoundedYear write SetFoundedYear;
    property founder: string read GetFounder write SetFounder;
    property id: string read GetId write SetId;
    property launch_sites: LongWord read GetLaunchSites write SetLaunchSites;
    property name: string read GetName write SetName;
    property summary: string read GetSummary write SetSummary;
    property test_sites: LongWord read GetTestSites write SetTestSites;
    property valuation: UInt64 read GetValuation write SetValuation;
    property vehicles: LongWord read GetVehicles write SetVehicles;
  end;

function NewCompany: ICompany;
begin
  Result := TCompany.Create;
end;

{ TCompany }

function TCompany.GetId: string;
begin
  Result := FId;
end;

function TCompany.GetName: string;
begin
  Result := FName;
end;

function TCompany.GetFounder: string;
begin
  Result := FFounder;
end;

function TCompany.GetEmployees: LongWord;
begin
  Result := FEmployees;
end;

function TCompany.GetVehicles: LongWord;
begin
  Result := FVehicles;
end;

function TCompany.GetCEO: string;
begin
  Result := FCEO;
end;

function TCompany.GetCTO: string;
begin
  Result := FCTO;
end;

function TCompany.GetCOO: string;
begin
  Result := FCOO;
end;

function TCompany.GetValuation: UInt64;
begin
  Result := FValuation;
end;

function TCompany.GetSummary: string;
begin
  Result := FSummary;
end;

function TCompany.GetHeadquarters: ICompanyHeadquarters;
begin
  Result := FHeadquarters;
end;

function TCompany.GetLinks: ICompanyLinks;
begin
  Result := FLinks;
end;

function TCompany.GetFoundedYear: LongWord;
begin
  Result := FFoundedYear;
end;

function TCompany.GetLaunchSites: LongWord;
begin
  Result := FLaunchSites;
end;

function TCompany.GetTestSites: LongWord;
begin
  Result := FTestSites;
end;

function TCompany.GetCtoPropulsion: string;
begin
  Result := FCtoPropulsion;
end;

procedure TCompany.SetId(AValue: string);
begin
  FId := AValue;
end;

procedure TCompany.SetName(AValue: string);
begin
  FName := AValue;
end;

procedure TCompany.SetFounder(AValue: string);
begin
  FFounder := AValue;
end;

procedure TCompany.SetEmployees(AValue: LongWord);
begin
  FEmployees := AValue;
end;

procedure TCompany.SetVehicles(AValue: LongWord);
begin
  FVehicles := AValue;
end;

procedure TCompany.SetCEO(AValue: string);
begin
  FCEO := AValue;
end;

procedure TCompany.SetCTO(AValue: string);
begin
  FCTO := AValue;
end;

procedure TCompany.SetCOO(AValue: string);
begin
  FCOO := AValue;
end;

procedure TCompany.SetValuation(AValue: UInt64);
begin
  FValuation := AValue;
end;

procedure TCompany.SetSummary(AValue: string);
begin
  FSummary := AValue;
end;

procedure TCompany.SetHeadquarters(AValue: ICompanyHeadquarters);
begin
  FHeadquarters := AValue;
end;

procedure TCompany.SetLinks(AValue: ICompanyLinks);
begin
  FLinks := AValue;
end;

procedure TCompany.SetFoundedYear(AValue: LongWord);
begin
  FFoundedYear := AValue;
end;

procedure TCompany.SetLaunchSites(AValue: LongWord);
begin
  FLaunchSites := AValue;
end;

procedure TCompany.SetTestSites(AValue: LongWord);
begin
  FTestSites := AValue;
end;

procedure TCompany.SetCtoPropulsion(AValue: string);
begin
  FCtoPropulsion := AValue;
end;

function TCompany.ToString: string;
begin
  Result := '';
  Result := Result + 'CEO: ' + ceo + LineEnding;
  Result := Result + 'CTO Propulsion: ' + cto_propulsion + LineEnding;
  Result := Result + 'Founder: ' + founder + LineEnding;
  Result := Result + 'Name: ' + name + LineEnding;
  Result := Result + 'Headquarters: ' + Format('%s, %s, %s', [
    GetHeadquarters.Address,
    GetHeadquarters.City,
    GetHeadquarters.State
    ])+ LineEnding;
  Result := Result + 'Link: ' + GetLinks.Website;
end;

procedure TCompany.BuildSubObjects(const JSONData: IJSONData);
var                    
  Headquarters: ICompanyHeadquarters;
  Links: ICompanyLinks;
  SubJSONData: IJSONData;
begin
  inherited BuildSubObjects(JSONData);

  SubJSONData := JSONData.GetPath('headquarters');
  Headquarters := NewCompanyHeadquarters;
  JSONToModel(SubJSONData.GetJSONData, Headquarters);
  Self.FHeadquarters := Headquarters;

  SubJSONData := JSONData.GetPath('links');
  Links := NewCompanyLinks;
  JSONToModel(SubJSONData.GetJSONData, Links);
  Self.FLinks := Links;
end;

end.

