unit DMService;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, StdCtrls, ActnList, Controls, Orders, Items, tiobject,
  TiopfManager, SQLite3Conn, SQLDB, Dialogs;

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
    fItemTypeList: TItemTypeList;
    fOrderTypeList: TOrderTypeList;
    // Increments the last order_type_index

  published
    property OrderTypeList: TOrderTypeList read fOrderTypeList;
    property ItemTypeList: TItemTypeList read fItemTypeList;
    procedure RefreshOrderTypeList;
    function GetNextOrderTypeIndex: integer;
    function GetNextItemTypeIndex : integer;
    function IsOrderTypeNameUnique(aname: string): boolean;
  public
    // Order Types
    procedure SaveOrderType(type_name: string);
    procedure ModifyOrderType(aoid: string; type_name: string);
    procedure DeleteOrderType(aoid: string);
    procedure ChangeOrderIndex(aoid: string; index_change: integer);
    procedure OrderTypeIndex_up(aindex: integer);
    procedure OrderTypeIndex_down(aindex: integer);
    procedure OrderTypesToListBox(listbox: TListBox);
    // Order
    procedure SaveOrder(order_type, description: string);
  end;

  { TOrderManager }

  TOrderManager = class(TTiObject)
  private
    FItemBOMs: TItemBOMList;
    FItems: TItemList;
    FItemTypes: TItemTypeList;
    FOrderItems: TOrderItemList;
    FOrders: TOrderList;
    FOrderTypes: TOrderTypeList;
  published
    property OrderTypes: TOrderTypeList read FOrderTypes;
    property ItemTypes: TItemTypeList read FItemTypes;
    property Orders: TOrderList read FOrders;
    property OrderItems: TOrderItemList read FOrderItems;
    property Items: TItemList read FItems;
    property ItemBOMs: TItemBOMList read FItemBOMs;
  public
    constructor Create;
    destructor Destroy;
    procedure SelectOrdersByOrderType(aorder_type_name : string);
    procedure SelectItemsByItemType(aitem_type_name : string);
    procedure SelectItemBOMsByItem(aitem_name : string);

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
  fItemTypeList := TItemTypeList.Create;
  //fORderTypeList.Read;
end;

procedure TdmServiceModule.DataModuleDestroy(Sender: TObject);
begin
  fOrderTypeList.Free;
  fItemTypeList.Free;
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

function TdmServiceModule.GetNextItemTypeIndex: integer;
var
  lItemTypeList: TItemTypeList;
begin
  lItemTypeList := TItemTypeList.Create;
  try
    lItemTypeList.GetLastItemTypeIndex;
    Result := lItemTypeList.Items[0].order_type_index + 1;
  finally
    lItemTypeList.Free;
  end;
end;

function TdmServiceModule.IsOrderTypeNameUnique(aname: string): boolean;
var
  fOrder_type_list: TOrderTypeList;
begin
  try
    fOrder_type_list := TOrderTypeList.Create;
    fOrder_type_list.FindUniqueItemName(aname);
  finally
    Result := fOrder_type_list.Count = 0;
    fOrder_type_list.Free;
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
  try
    ordertype.ObjectState := posPK;
    ordertype.OID.AsString := aoid;
    ordertype.Read;
    ordertype.ObjectState := posUpdate;
    ordertype.order_type_name := type_name;
    ordertype.Save;
  finally
    ordertype.Free;
  end;
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

procedure TdmServiceModule.OrderTypeIndex_up(aindex: integer);
var
  a, b: integer;
begin
  a := OrderTypeList.Items[aindex].order_type_index;
  b := OrderTypeList.Items[aindex - 1].order_type_index;
  //showmessage(inttostr(a)+':'+inttostr(b));
  OrderTypeList.Items[aindex].ObjectState := posUpdate;
  ORderTypeList.Items[aindex].order_type_index := b;
  OrderTypeList.Items[aindex - 1].ObjectState := posUpdate;
  OrderTypeList.Items[aindex - 1].order_type_index := a;
  OrderTypeList.Save;
  RefreshOrderTypeList;
  OrderTypeList.NotifyObservers;
end;

procedure TdmServiceModule.OrderTypeIndex_down(aindex: integer);
var
  a, b: integer;
begin
  a := OrderTypeList.Items[aindex].order_type_index;
  b := OrderTypeList.Items[aindex + 1].order_type_index;
  //showmessage(inttostr(a)+':'+inttostr(b));
  OrderTypeList.Items[aindex].ObjectState := posUpdate;
  ORderTypeList.Items[aindex].order_type_index := b;
  OrderTypeList.Items[aindex + 1].ObjectState := posUpdate;
  OrderTypeList.Items[aindex + 1].order_type_index := a;
  OrderTypeList.Save;
  RefreshOrderTypeList;
  OrderTypeList.NotifyObservers;
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

{ TOrderManager }


constructor TOrderManager.Create;
begin
  inherited Create;
end;

destructor TOrderManager.Destroy;
begin
  inherited Destroy;
end;

procedure TOrderManager.SelectOrdersByOrderType(aorder_type_name: string);
begin

end;

procedure TOrderManager.SelectItemsByItemType(aitem_type_name: string);
begin

end;

procedure TOrderManager.SelectItemBOMsByItem(aitem_name: string);
begin

end;

initialization
  dmServiceModule := TdmServiceModule.Create(nil);

finalization
  dmServiceModule.Free;
end.
