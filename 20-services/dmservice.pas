unit DMService;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, StdCtrls, ActnList, Controls, Orders, tiobject,
  TiopfManager, SQLite3Conn, SQLDB;

type

  { TdmServiceModule }

  TdmServiceModule = class(TDataModule)
    acAddNewItem: TAction;
    acAddOrder: TAction;
    acMaintainItemTypes: TAction;
    acRemoveOrder: TAction;
    ActionList1: TActionList;
    ImageList1: TImageList;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
  private

  public
    procedure SaveOrderType(type_name: string);
    procedure OrderTypesToListBox(listbox : TListBox);
    procedure SaveOrder(order_type, description : string);
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

procedure TdmServiceModule.SaveOrder(order_type, description: string);
var
  order : TOrder;
begin

  order:= TOrder.create;
  order.ObjectState:=poscreate;
  gTiopfManager.DefaultOIDGenerator.AssignNextOID(order.OID);
  order.order_type_id:=order_type;
  order.order_status:='New';
  order.order_description:=description;
  order.time_entered:=now();
  order.time_left:=now();
  order.save;
  order.Free;
end;

initialization
  dmServiceModule := TdmServiceModule.Create(nil);

finalization
  dmServiceModule.Free;
end.
