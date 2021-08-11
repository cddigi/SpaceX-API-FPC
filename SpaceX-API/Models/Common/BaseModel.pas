unit BaseModel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type

  { IBaseModel }

  IBaseModel = interface ['{C20679C1-201D-4930-BF24-021F211FC3F8}']

  end;

  { IBaseModelList }

  IBaseModelList = interface(IInterfaceList) ['{A88A3F2B-21CB-4DE3-95D6-557FC4168032}']
    function NewItem: IBaseModel;
  end;

  { TBaseModel }

  TBaseModel = class(TInterfacedObject, IBaseModel)

  end;

  { TBaseModelList }

  TBaseModelList = class(TInterfaceList, IBaseModelList)
    function NewItem: IBaseModel; virtual; abstract;
  end;

implementation

end.

