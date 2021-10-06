unit JSON_Helper;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type

  { IJSONData }

  IJSONData = interface(IInterface) ['{E0C90586-5A87-4248-82C1-F371951A603B}']
    function Count: Integer;
    function GetItem(Index: Integer): IJSONData;
    function GetJSONData: string;      
    function GetPath(const Path: string): IJSONData;

    procedure SetJSONData(AValue: string);

    property Items[Index: Integer]: IJSONData read GetItem; default;
    property JSONData: string read GetJSONData write SetJSONData;
  end;

procedure JSONToModel(const JSON: string; const Model: IInterface);
function NewJSONData: IJSONData;

implementation

uses
  fpjsonrtti, fpjson, jsonparser, BaseModel;

type

  { TJSON }

  { TJSONData }

  TJSONData = class(TInterfacedObject, IJSONData)
  private
    FJSONData: fpjson.TJSONData;
  private
    function Count: Integer;
    function GetItem(Index: Integer): IJSONData;
    function GetJSONData: string;       
    function GetPath(const Path: string): IJSONData;
  private
    procedure SetJSONData(AValue: string);
  public
    destructor Destroy; override;
  end;

procedure JSONToModel(const JSON: string; const Model: IInterface);
var
  Count, Idx: Integer;
  DeStreamer: TJSONDeStreamer;
  Item: IBaseModel;
  JSONData, JSONItem: IJSONData;
begin
  if SameStr(JSON, 'null') then
    Exit;

  DeStreamer := TJSONDeStreamer.Create(nil);
  try
    if Model is IBaseModelList then begin
      JSONData := NewJSONData;
      JSONData.SetJSONData(JSON);
      Count := JSONData.Count;

      for Idx := 0 to Count - 1 do begin
        JSONItem := JSONData.Items[Idx];
        Item := (Model as IBaseModelList).NewItem;
        DeStreamer.JSONToObject(JSONItem.GetJSONData, Item as TObject);
        Item.BuildSubObjects(JSONItem);
        (Model as IBaseModelList).Add(Item);
      end;
    end else begin
      JSONData := NewJSONData;
      JSONData.SetJSONData(JSON);
      DeStreamer.JSONToObject(JSON, Model as TObject);
      (Model as IBaseModel).BuildSubObjects(JSONData);
    end;
  finally
    DeStreamer.Free;
  end;
end;

function NewJSONData: IJSONData;
begin
  Result := TJSONData.Create;
end;

{ TJSONData }

function TJSONData.Count: Integer;
begin
  Result := FJSONData.Count;
end;

function TJSONData.GetPath(const Path: string): IJSONData;
var
  JSONData: TJSONData;
begin
  JSONData := TJSONData.Create;
  try
    JSONData.FJSONData := FJSONData.GetPath(Path);
  except
    JSONData.Free;
    raise;
  end;

  Result := JSONData;
end;

function TJSONData.GetItem(Index: Integer): IJSONData;
var
  JSONData: TJSONData;
begin
  JSONData := TJSONData.Create;
  try
    JSONData.FJSONData := FJSONData.Items[Index];
  except
    JSONData.Free;
    raise;
  end;

  Result := JSONData;
end;

function TJSONData.GetJSONData: string;
begin
  Result := FJSONData.FormatJSON();
end;

procedure TJSONData.SetJSONData(AValue: string);
begin
  FJSONData := GetJSON(AValue);
end;

destructor TJSONData.Destroy;
begin
  FreeMemAndNil(FJSONData);
  inherited Destroy;
end;

end.

