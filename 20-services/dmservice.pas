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
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    fOrderTypeList: TOrderTypeList;
    // Increments the last order_type_index
    function GetNextOrderTypeIndex: integer;
  published
    property OrderTypeList: TOrderTypeList read fOrderTypeList;
    procedure RefreshOrderTypeList;
  public
    // Order Types
    procedure SaveOrderType(type_name: string);
    procedure ModifyOrderType(aoid: string; type_name: string);
    procedure DeleteOrderType(aoid: string);
    procedure ChangeOrderIndex(aoid: string; index_change: integer);
    procedure OrderTypesToListBox(listbox: TListBox);
    // Order
    procedure SaveOrder(order_type, description: string);
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

procedure TdmServiceModule.DataModuleCreate(Sender: TObject);
begin
  fOrderTypeList := TOrderTypeList.Create;
  //fORderTypeList.Read;
end;

procedure TdmServiceModule.DataModuleDestroy(Sender: TObject);
begin
  fOrderTypeList.Free;
end;

function TdmServiceModule.GetNextOrderTypeIndex: integer;
var
  lOrderTypeList: TOrderTypeList;
begin
  lOrderTypeList := TOrderTypeList.Create;
  try
    lOrderTypeList.GetLastOrderNumber;
    Result := lOrderTypeList.Items[0].order_type_index + 1;
  finally
    lORderTypeList.Free;
  end;
end;

procedure TdmServiceModule.RefreshOrderTypeList;
begin
  self.OrderTypeList.GetAllSortedByIndex;
  self.OrderTypeList.NotifyObservers;
end;

procedure TdmServiceModule.SaveOrderType(type_name: string);
var
  ordertype: TOrderType;
begin
  ordertype := TOrderType.Create;
  try
    ordertype.ObjectState := posCreate;
    gTiopfManager.DefaultOIDGenerator.AssignNextOID(ordertype.OID);
    ordertype.order_type_name := type_name;
    ordertype.order_type_index := GetNextOrderTypeIndex;
    ordertype.Save;
  finally
    ordertype.Free;
  end;
  RefreshOrderTypeList;
end;

procedure TdmServiceModule.ModifyOrderType(aoid: string; type_name: string);
var
  ordertype: TOrderType;
begin
  ordertype := TOrderType.Create;
  ordertype.OID.AsString := aoid;
  ordertype.ObjectState := posUpdate;
  ordertype.order_type_name := type_name;
  ordertype.Save;
  ordertype.Free;
  RefreshOrderTypeList;
end;

procedure TdmServiceModule.DeleteOrderType(aoid: string);
var
  ordertype: TOrderType;
begin
  ordertype := TOrderType.Create;
  ordertype.OID.AsString := aoid;
  ordertype.ObjectState := posDelete;
  ordertype.Save;
  ordertype.Free;
  RefreshOrderTypeList;
end;

procedure TdmServiceModule.ChangeOrderIndex(aoid: string; index_change: integer);
begin

end;



procedure TdmServiceModule.OrderTypesToListBox(listbox: TListBox);
var
  a: integer;
begin
  listbox.Clear;
  if fOrderTypeList <> nil then
    fOrderTypeList := TOrderTypeList.Create;
    RefreshOrderTypeList;
  for a := 0 to fOrderTypeList.Count - 1 do
  begin
    listbox.Items.Add(fOrderTypeList.Items[a].order_type_name);
  end;
end;

procedure TdmServiceModule.SaveOrder(order_type, description: string);
var
  order: TOrder;
begin

  order := TOrder.Create;
  order.ObjectState := poscreate;
  gTiopfManager.DefaultOIDGenerator.AssignNextOID(order.OID);
  order.order_type_id := order_type;
  order.order_status := 'New';
  order.order_description := description;
  order.time_entered := now();
  order.time_left := now();
  order.save;
  order.Free;
end;

initialization
  dmServiceModule := TdmServiceModule.Create(nil);

finalization
  dmServiceModule.Free;
end.
