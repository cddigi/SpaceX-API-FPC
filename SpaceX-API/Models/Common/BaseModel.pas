unit BaseModel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, JSON_Helper;

type

  { IBaseModel }

  IBaseModel = interface ['{C20679C1-201D-4930-BF24-021F211FC3F8}']
    procedure BuildSubObjects(const JSONData: IJSONData);
  end;

  { IBaseModelList }

  IBaseModelList = interface(IInterfaceList) ['{A88A3F2B-21CB-4DE3-95D6-557FC4168032}']
    function NewItem: IBaseModel;
    function GetItem(Idx: Integer): IBaseModel;
    property Items[Idx: Integer]: IBaseModel read GetItem; default;
  end;

  { TBaseModel }

  TBaseModel = class(TInterfacedObject, IBaseModel)
    procedure BuildSubObjects(const JSONData: IJSONData); virtual;
  end;

  { TBaseModelList }

  TBaseModelList = class(TInterfaceList, IBaseModelList)
    function NewItem: IBaseModel; virtual; abstract;
    function GetItem(Idx: Integer): IBaseModel;
  end;

  { TBaseModelEnumerator }

  TBaseModelEnumerator = class
    FCurrent : IBaseModel;
    FList: IBaseModelList;
    FIdx : Integer;
    function MoveNext : Boolean;
    property Current : IBaseModel read FCurrent;
  end;

operator enumerator(AList: IBaseModelList): TBaseModelEnumerator;

implementation

{ TBaseModelEnumerator }

function TBaseModelEnumerator.MoveNext: Boolean;
begin
  Result := FIdx < FList.Count;

  if not Result then
    FCurrent := nil
  else begin
    FCurrent := FList[FIdx];
    Inc(FIdx);
  end;
end;

operator enumerator(AList: IBaseModelList) : TBaseModelEnumerator;
begin
  Result := TBaseModelEnumerator.Create;
  Result.FList := AList;
end;

{ TBaseModel }

procedure TBaseModel.BuildSubObjects(const JSONData: IJSONData);
begin

end;

{ TBaseModelList }

function TBaseModelList.GetItem(Idx: Integer): IBaseModel;
begin
  Result := Self.Get(Idx) as IBaseModel;
end;

end.

