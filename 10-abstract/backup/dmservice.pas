unit DMService;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, StdCtrls, orders, tiobject,
  TiopfManager;

type

  { TdmServiceModule }

  TdmServiceModule = class(TDataModule)
  private

  public
    procedure SaveOrderType(type_name: string);
    procedure OrderTypesToListBox(listbox : TListBox);
  end;

var
  dmServiceModule: TdmServiceModule;

function DMS: TdmServiceModule;

implementation


function DMS: TdmServiceModule;
begin
  if dmServiceModule = nil then
    dmServiceModule := TdmServiceModule.Create(nil);
  Result := dmServiceModule;
end;

{$R *.lfm}

{ TdmServiceModule }

procedure TdmServiceModule.SaveOrderType(type_name: string);
var
  ordertype : TOrderType;
begin
  ordertype := TOrderType.create;
  ordertype.ObjectState:=posCreate;
  gTiopfManager.DefaultOIDGenerator.AssignNextOID(ordertype.OID);
  ordertype.order_type_name:=type_name;
  ordertype.Save;
  ordertype.free;
end;

procedure TdmServiceModule.OrderTypesToListBox(listbox: TListBox);
var
  ordertypelist : TOrderTypeList;
  a : integer;
begin
  listbox.clear;
  ordertypelist := TOrderTypeList.Create;
  ordertypelist.Read;
  for a:= 0 to ordertypelist.Count-1 do
  begin
    listbox.Items.Add(ordertypelist.Items[a].order_type_name);
  end;
end;

end.
