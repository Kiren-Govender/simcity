

unit Orders;


{$IFDEF FPC}
{$mode objfpc}{$H+}
{$ENDIF}


interface


uses
SysUtils
,tiObject
,typinfo
,tiAutoMap
,tiOPFManager
,tiVisitorDB
,tiVisitorCriteria
,tiCriteria
,tiSQLParser
,mapper
;

type


// ---------------------------------------------
// Generated Classes
// ---------------------------------------------


{ Generated Class: TOrder}
TOrder = class(TtiObject)
protected
Ftime_left: TDateTime;
Forder_type_id: String;
Ftime_entered: TDateTime;
Forder_status: String;
Forder_description: String;
procedure Settime_left(const AValue: TDateTime); virtual;
procedure Setorder_type_id(const AValue: String); virtual;
procedure Settime_entered(const AValue: TDateTime); virtual;
procedure Setorder_status(const AValue: String); virtual;
procedure Setorder_description(const AValue: String); virtual;
public
procedure   Read; override;
procedure   Save; override;
published
property    time_left: TDateTime read Ftime_left write Settime_left;
property    order_type_id: String read Forder_type_id write Setorder_type_id;
property    time_entered: TDateTime read Ftime_entered write Settime_entered;
property    order_status: String read Forder_status write Setorder_status;
property    order_description: String read Forder_description write Setorder_description;
end;

{ List of TOrder.  TtiMappedFilteredObjectList descendant. }
TOrderList = class(TtiMappedFilteredObjectList)
protected
procedure   SetItems(i: integer; const AValue: TOrder); reintroduce;
function    GetItems(i: integer): TOrder; reintroduce;
public
property    Items[i:integer] : TOrder read GetItems write SetItems;
procedure   Add(AObject: TOrder); reintroduce;
procedure   Read; override;
procedure   Save; override;
{ Return count (1) if successful. }
function    FindByOID(const AOID: string): integer;
end;

{ Generated Class: TOrderItem}
TOrderItem = class(TtiObject)
protected
Forder_id: String;
Fitem_id: String;
Fquantity: Integer;
procedure Setorder_id(const AValue: String); virtual;
procedure Setitem_id(const AValue: String); virtual;
procedure Setquantity(const AValue: Integer); virtual;
public
procedure   Read; override;
procedure   Save; override;
published
property    order_id: String read Forder_id write Setorder_id;
property    item_id: String read Fitem_id write Setitem_id;
property    quantity: Integer read Fquantity write Setquantity;
end;

{ List of TOrderItem.  TtiMappedFilteredObjectList descendant. }
TOrderItemList = class(TtiMappedFilteredObjectList)
protected
procedure   SetItems(i: integer; const AValue: TOrderItem); reintroduce;
function    GetItems(i: integer): TOrderItem; reintroduce;
public
property    Items[i:integer] : TOrderItem read GetItems write SetItems;
procedure   Add(AObject: TOrderItem); reintroduce;
procedure   Read; override;
procedure   Save; override;
{ Return count (1) if successful. }
function    FindByOID(const AOID: string): integer;
end;

{ Generated Class: TOrderType}
TOrderType = class(TtiObject)
protected
Forder_type_name: String;
procedure Setorder_type_name(const AValue: String); virtual;
public
procedure   Read; override;
procedure   Save; override;
published
property    order_type_name: String read Forder_type_name write Setorder_type_name;
end;

{ List of TOrderType.  TtiMappedFilteredObjectList descendant. }
TOrderTypeList = class(TtiMappedFilteredObjectList)
protected
procedure   SetItems(i: integer; const AValue: TOrderType); reintroduce;
function    GetItems(i: integer): TOrderType; reintroduce;
public
property    Items[i:integer] : TOrderType read GetItems write SetItems;
procedure   Add(AObject: TOrderType); reintroduce;
procedure   Read; override;
procedure   Save; override;
{ Return count (1) if successful. }
function    FindByOID(const AOID: string): integer;
end;

{ Read Visitor for TOrder }
TOrder_Read = class(TtiVisitorSelect)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
procedure   MapRowToObject; override;
end;

{ Create Visitor for TOrder }
TOrder_Create = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ Update Visitor for TOrder }
TOrder_Save = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ Delete Visitor for TOrder }
TOrder_Delete = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ List Read Visitor for TOrderList }
TOrderList_Read = class(TtiVisitorSelect)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   MapRowToObject; override;
end;

{ List Create Visitor for TOrderList }
TOrderList_Create = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ List Update Visitor for TOrderList }
TOrderList_Save = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ List Delete Visitor for TOrderList }
TOrderList_Delete = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ Read Visitor for TOrderItem }
TOrderItem_Read = class(TtiVisitorSelect)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
procedure   MapRowToObject; override;
end;

{ Create Visitor for TOrderItem }
TOrderItem_Create = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ Update Visitor for TOrderItem }
TOrderItem_Save = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ Delete Visitor for TOrderItem }
TOrderItem_Delete = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ List Read Visitor for TOrderItemList }
TOrderItemList_Read = class(TtiVisitorSelect)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   MapRowToObject; override;
end;

{ List Create Visitor for TOrderItemList }
TOrderItemList_Create = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ List Update Visitor for TOrderItemList }
TOrderItemList_Save = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ List Delete Visitor for TOrderItemList }
TOrderItemList_Delete = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ Read Visitor for TOrderType }
TOrderType_Read = class(TtiVisitorSelect)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
procedure   MapRowToObject; override;
end;

{ Create Visitor for TOrderType }
TOrderType_Create = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ Update Visitor for TOrderType }
TOrderType_Save = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ Delete Visitor for TOrderType }
TOrderType_Delete = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ List Read Visitor for TOrderTypeList }
TOrderTypeList_Read = class(TtiVisitorSelect)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   MapRowToObject; override;
end;

{ List Create Visitor for TOrderTypeList }
TOrderTypeList_Create = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ List Update Visitor for TOrderTypeList }
TOrderTypeList_Save = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ List Delete Visitor for TOrderTypeList }
TOrderTypeList_Delete = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;


{ Visitor Manager Registrations }
procedure RegisterVisitors;

{ Register Auto Mappings }
procedure RegisterMappings;


implementation


procedure RegisterMappings;
begin
{ Automap registrations for TOrder }
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TOrder, 
'orders', 'OID', 'OID', [pktDB]);
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TOrder,
'orders','time_left', 'time_left');
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TOrder,
'orders','order_type_id', 'order_type_id');
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TOrder,
'orders','time_entered', 'time_entered');
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TOrder,
'orders','order_status', 'order_status');
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TOrder,
'orders','order_description', 'order_description');
GTIOPFManager.ClassDBMappingMgr.RegisterCollection(TOrderList, TOrder);

{ Automap registrations for TOrderItem }
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TOrderItem, 
'order_item', 'OID', 'OID', [pktDB]);
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TOrderItem,
'order_item','order_id', 'order_id');
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TOrderItem,
'order_item','item_id', 'item_id');
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TOrderItem,
'order_item','quantity', 'quantity');
GTIOPFManager.ClassDBMappingMgr.RegisterCollection(TOrderItemList, TOrderItem);

{ Automap registrations for TOrderType }
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TOrderType, 
'order_type', 'OID', 'OID', [pktDB]);
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TOrderType,
'order_type','order_type_name', 'order_type_name');
GTIOPFManager.ClassDBMappingMgr.RegisterCollection(TOrderTypeList, TOrderType);

end;

procedure RegisterVisitors;
begin
{ Register Visitors for TOrder }
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderList_listread', TOrderList_Read);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderList_listsave', TOrderList_Create);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderList_listsave', TOrderList_Save);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderList_listsave', TOrderList_Delete);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderread', TOrder_Read);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrdersave', TOrder_Save);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderdelete', TOrder_Delete);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrdercreate', TOrder_Create);

{ Register Visitors for TOrderItem }
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderItemList_listread', TOrderItemList_Read);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderItemList_listsave', TOrderItemList_Create);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderItemList_listsave', TOrderItemList_Save);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderItemList_listsave', TOrderItemList_Delete);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderItemread', TOrderItem_Read);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderItemsave', TOrderItem_Save);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderItemdelete', TOrderItem_Delete);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderItemcreate', TOrderItem_Create);

{ Register Visitors for TOrderType }
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderTypeList_listread', TOrderTypeList_Read);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderTypeList_listsave', TOrderTypeList_Create);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderTypeList_listsave', TOrderTypeList_Save);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderTypeList_listsave', TOrderTypeList_Delete);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderTyperead', TOrderType_Read);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderTypesave', TOrderType_Save);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderTypedelete', TOrderType_Delete);
GTIOPFManager.VisitorManager.RegisterVisitor('TOrderTypecreate', TOrderType_Create);

end;

procedure TOrder.Settime_left(const AValue: TDateTime);
begin
if Ftime_left <> AValue then
Ftime_left := AValue;
end;

procedure TOrder.Setorder_type_id(const AValue: String);
begin
if Forder_type_id <> AValue then
Forder_type_id := AValue;
end;

procedure TOrder.Settime_entered(const AValue: TDateTime);
begin
if Ftime_entered <> AValue then
Ftime_entered := AValue;
end;

procedure TOrder.Setorder_status(const AValue: String);
begin
if Forder_status <> AValue then
Forder_status := AValue;
end;

procedure TOrder.Setorder_description(const AValue: String);
begin
if Forder_description <> AValue then
Forder_description := AValue;
end;

procedure TOrder.Read;
begin
GTIOPFManager.VisitorManager.Execute(ClassName + 'read', self);
end;

procedure TOrder.Save;
begin
Case ObjectState of
posDelete: GTIOPFManager.VisitorManager.Execute('TOrderdelete', self);
posUpdate: GTIOPFManager.VisitorManager.Execute('TOrdersave', self);
posCreate: GTIOPFManager.VisitorManager.Execute('TOrdercreate', self);
end;
end;

 {TOrderList }

procedure TOrderList.Add(AObject: TOrder);
begin
inherited Add(AObject);
end;

function TOrderList.GetItems(i: integer): TOrder;
begin
result := inherited GetItems(i) as TOrder;
end;

procedure TOrderList.Read;
begin
GTIOPFManager.VisitorManager.Execute('TOrderList_listread', self);
end;

procedure TOrderList.Save;
begin
GTIOPFManager.VisitorManager.Execute('TOrderList_listsave', self);
end;

procedure TOrderList.SetItems(i: integer; const AValue: TOrder);
begin
inherited SetItems(i, AValue);
end;
function TOrderList.FindByOID(const AOID: string): integer;
begin
if self.Count > 0 then
self.Clear;

Criteria.ClearAll;
Criteria.AddEqualTo('OID', AOID);
Read;
result := Count;
end;

procedure TOrderItem.Setorder_id(const AValue: String);
begin
if Forder_id <> AValue then
Forder_id := AValue;
end;

procedure TOrderItem.Setitem_id(const AValue: String);
begin
if Fitem_id <> AValue then
Fitem_id := AValue;
end;

procedure TOrderItem.Setquantity(const AValue: Integer);
begin
if Fquantity <> AValue then
Fquantity := AValue;
end;

procedure TOrderItem.Read;
begin
GTIOPFManager.VisitorManager.Execute(ClassName + 'read', self);
end;

procedure TOrderItem.Save;
begin
Case ObjectState of
posDelete: GTIOPFManager.VisitorManager.Execute('TOrderItemdelete', self);
posUpdate: GTIOPFManager.VisitorManager.Execute('TOrderItemsave', self);
posCreate: GTIOPFManager.VisitorManager.Execute('TOrderItemcreate', self);
end;
end;

 {TOrderItemList }

procedure TOrderItemList.Add(AObject: TOrderItem);
begin
inherited Add(AObject);
end;

function TOrderItemList.GetItems(i: integer): TOrderItem;
begin
result := inherited GetItems(i) as TOrderItem;
end;

procedure TOrderItemList.Read;
begin
GTIOPFManager.VisitorManager.Execute('TOrderItemList_listread', self);
end;

procedure TOrderItemList.Save;
begin
GTIOPFManager.VisitorManager.Execute('TOrderItemList_listsave', self);
end;

procedure TOrderItemList.SetItems(i: integer; const AValue: TOrderItem);
begin
inherited SetItems(i, AValue);
end;
function TOrderItemList.FindByOID(const AOID: string): integer;
begin
if self.Count > 0 then
self.Clear;

Criteria.ClearAll;
Criteria.AddEqualTo('OID', AOID);
Read;
result := Count;
end;

procedure TOrderType.Setorder_type_name(const AValue: String);
begin
if Forder_type_name <> AValue then
Forder_type_name := AValue;
end;

procedure TOrderType.Read;
begin
GTIOPFManager.VisitorManager.Execute(ClassName + 'read', self);
end;

procedure TOrderType.Save;
begin
Case ObjectState of
posDelete: GTIOPFManager.VisitorManager.Execute('TOrderTypedelete', self);
posUpdate: GTIOPFManager.VisitorManager.Execute('TOrderTypesave', self);
posCreate: GTIOPFManager.VisitorManager.Execute('TOrderTypecreate', self);
end;
end;

 {TOrderTypeList }

procedure TOrderTypeList.Add(AObject: TOrderType);
begin
inherited Add(AObject);
end;

function TOrderTypeList.GetItems(i: integer): TOrderType;
begin
result := inherited GetItems(i) as TOrderType;
end;

procedure TOrderTypeList.Read;
begin
GTIOPFManager.VisitorManager.Execute('TOrderTypeList_listread', self);
end;

procedure TOrderTypeList.Save;
begin
GTIOPFManager.VisitorManager.Execute('TOrderTypeList_listsave', self);
end;

procedure TOrderTypeList.SetItems(i: integer; const AValue: TOrderType);
begin
inherited SetItems(i, AValue);
end;
function TOrderTypeList.FindByOID(const AOID: string): integer;
begin
if self.Count > 0 then
self.Clear;

Criteria.ClearAll;
Criteria.AddEqualTo('OID', AOID);
Read;
result := Count;
end;

{ TOrder_Create }
function TOrder_Create.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posCreate;
end;

procedure TOrder_Create.Init;
begin
Query.SQLText := 
'INSERT INTO orders(' + 
' OID, ' + 
' time_left, ' + 
' order_type_id, ' + 
' time_entered, ' + 
' order_status, ' + 
' order_description' + 
') VALUES (' +
' :OID, ' +
' :time_left, ' + 
' :order_type_id, ' + 
' :time_entered, ' + 
' :order_status, ' + 
' :order_description' + 
') ';
end;

procedure TOrder_Create.SetupParams;
var
lObj: TOrder;
begin
lObj := TOrder(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsDateTime['time_left'] := lObj.time_left;
Query.ParamAsString['order_type_id'] := lObj.order_type_id;
Query.ParamAsDateTime['time_entered'] := lObj.time_entered;
Query.ParamAsString['order_status'] := lObj.order_status;
Query.ParamAsString['order_description'] := lObj.order_description;
end;

{ TOrder_Save }
function TOrder_Save.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posUpdate;
end;

procedure TOrder_Save.Init;
begin
Query.SQLText := 
'UPDATE orders SET ' +
' time_left = :time_left, ' + 
' order_type_id = :order_type_id, ' + 
' time_entered = :time_entered, ' + 
' order_status = :order_status, ' + 
' order_description = :order_description ' + 
'WHERE OID = :OID' ;
end;

procedure TOrder_Save.SetupParams;
var
lObj: TOrder;
begin
lObj := TOrder(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsDateTime['time_left'] := lObj.time_left;
Query.ParamAsString['order_type_id'] := lObj.order_type_id;
Query.ParamAsDateTime['time_entered'] := lObj.time_entered;
Query.ParamAsString['order_status'] := lObj.order_status;
Query.ParamAsString['order_description'] := lObj.order_description;
end;

{ TOrder_Read }
function TOrder_Read.AcceptVisitor: Boolean;
begin
result := (Visited.ObjectState = posPK) OR (Visited.ObjectState = posClean);
end;

procedure TOrder_Read.Init;
begin
Query.SQLText := 
'SELECT ' + 
' OID, ' +
' time_left, ' + 
' order_type_id, ' + 
' time_entered, ' + 
' order_status, ' + 
' order_description ' + 
'FROM  orders WHERE OID = :OID' ;
end;

procedure TOrder_Read.SetupParams;
var
lObj: TOrder;
begin
lObj := TOrder(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
end;

procedure TOrder_Read.MapRowToObject;
var
lObj: TOrder;
begin
lObj := TOrder(Visited);
lObj.OID.AssignFromTIQuery('OID',Query);
lObj.time_left := Query.FieldAsDatetime['time_left'];
lObj.order_type_id := Query.FieldAsString['order_type_id'];
lObj.time_entered := Query.FieldAsDatetime['time_entered'];
lObj.order_status := Query.FieldAsString['order_status'];
lObj.order_description := Query.FieldAsString['order_description'];
end;

{ TOrder_Delete }
function TOrder_Delete.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posDelete;
end;

procedure TOrder_Delete.Init;
begin
Query.SQLText := 
'DELETE FROM orders ' +
'WHERE OID = :OID';
end;

procedure TOrder_Delete.SetupParams;
var
lObj: TOrder;
begin
lObj := TOrder(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
end;

{ TOrderList_Read }
function TOrderList_Read.AcceptVisitor: Boolean;
begin
result := (Visited.ObjectState = posEmpty);
end;

procedure TOrderList_Read.Init;
var
lFiltered: ItiFiltered;
lWhere: string;
lOrder: string;
lSQL: string;
begin
if Supports(Visited, ItiFiltered, lFiltered) then
begin
if lFiltered.GetCriteria.HasCriteria then
lWhere := ' WHERE ' + tiCriteriaAsSQL(lFiltered.GetCriteria)
else
lWhere := '';
if lFiltered.GetCriteria.hasOrderBy then
lOrder := tiCriteriaOrderByAsSQL(lFiltered.GetCriteria)
else
lOrder := '';
end;

lSQL := 
'SELECT ' + 
' OID, ' +
' time_left, ' + 
' order_type_id, ' + 
' time_entered, ' + 
' order_status, ' + 
' order_description ' + 
'FROM  orders %s %s ;';

Query.SQLText := gFormatSQL(Format(lSQL, [lWhere, lOrder]), TOrder);

end;

procedure TOrderList_Read.MapRowToObject;
var
lObj: TOrder;
begin
lObj := TOrder.Create;
lObj.OID.AssignFromTIQuery('OID',Query);
lObj.time_left := Query.FieldAsDatetime['time_left'];
lObj.order_type_id := Query.FieldAsString['order_type_id'];
lObj.time_entered := Query.FieldAsDatetime['time_entered'];
lObj.order_status := Query.FieldAsString['order_status'];
lObj.order_description := Query.FieldAsString['order_description'];
lObj.ObjectState := posClean;
TtiObjectList(Visited).Add(lObj);
end;

{ TOrderList_Create }
function TOrderList_Create.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posCreate;
end;

procedure TOrderList_Create.Init;
begin
Query.SQLText := 
'INSERT INTO orders(' + 
' OID, ' + 
' time_left, ' + 
' order_type_id, ' + 
' time_entered, ' + 
' order_status, ' + 
' order_description' + 
') VALUES (' +
' :OID, ' +
' :time_left, ' + 
' :order_type_id, ' + 
' :time_entered, ' + 
' :order_status, ' + 
' :order_description' + 
') ';
end;

procedure TOrderList_Create.SetupParams;
var
lObj: TOrder;
begin
lObj := TOrder(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsDateTime['time_left'] := lObj.time_left;
Query.ParamAsString['order_type_id'] := lObj.order_type_id;
Query.ParamAsDateTime['time_entered'] := lObj.time_entered;
Query.ParamAsString['order_status'] := lObj.order_status;
Query.ParamAsString['order_description'] := lObj.order_description;
end;

{ TOrderList_Delete }
function TOrderList_Delete.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posDelete;
end;

procedure TOrderList_Delete.Init;
begin
Query.SQLText := 
'DELETE FROM orders ' +
'WHERE OID = :OID';
end;

procedure TOrderList_Delete.SetupParams;
var
lObj: TOrder;
begin
lObj := TOrder(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
end;
{ TOrderList_Save }
function TOrderList_Save.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posUpdate;
end;

procedure TOrderList_Save.Init;
begin
Query.SQLText := 
'UPDATE orders SET ' +
' time_left = :time_left, ' + 
' order_type_id = :order_type_id, ' + 
' time_entered = :time_entered, ' + 
' order_status = :order_status, ' + 
' order_description = :order_description ' + 
'WHERE OID = :OID' ;
end;

procedure TOrderList_Save.SetupParams;
var
lObj: TOrder;
begin
lObj := TOrder(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsDateTime['time_left'] := lObj.time_left;
Query.ParamAsString['order_type_id'] := lObj.order_type_id;
Query.ParamAsDateTime['time_entered'] := lObj.time_entered;
Query.ParamAsString['order_status'] := lObj.order_status;
Query.ParamAsString['order_description'] := lObj.order_description;
end;

{ TOrderItem_Create }
function TOrderItem_Create.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posCreate;
end;

procedure TOrderItem_Create.Init;
begin
Query.SQLText := 
'INSERT INTO order_item(' + 
' OID, ' + 
' order_id, ' + 
' item_id, ' + 
' quantity' + 
') VALUES (' +
' :OID, ' +
' :order_id, ' + 
' :item_id, ' + 
' :quantity' + 
') ';
end;

procedure TOrderItem_Create.SetupParams;
var
lObj: TOrderItem;
begin
lObj := TOrderItem(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsString['order_id'] := lObj.order_id;
Query.ParamAsString['item_id'] := lObj.item_id;
Query.ParamAsInteger['quantity'] := lObj.quantity;
end;

{ TOrderItem_Save }
function TOrderItem_Save.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posUpdate;
end;

procedure TOrderItem_Save.Init;
begin
Query.SQLText := 
'UPDATE order_item SET ' +
' order_id = :order_id, ' + 
' item_id = :item_id, ' + 
' quantity = :quantity ' + 
'WHERE OID = :OID' ;
end;

procedure TOrderItem_Save.SetupParams;
var
lObj: TOrderItem;
begin
lObj := TOrderItem(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsString['order_id'] := lObj.order_id;
Query.ParamAsString['item_id'] := lObj.item_id;
Query.ParamAsInteger['quantity'] := lObj.quantity;
end;

{ TOrderItem_Read }
function TOrderItem_Read.AcceptVisitor: Boolean;
begin
result := (Visited.ObjectState = posPK) OR (Visited.ObjectState = posClean);
end;

procedure TOrderItem_Read.Init;
begin
Query.SQLText := 
'SELECT ' + 
' OID, ' +
' order_id, ' + 
' item_id, ' + 
' quantity ' + 
'FROM  order_item WHERE OID = :OID' ;
end;

procedure TOrderItem_Read.SetupParams;
var
lObj: TOrderItem;
begin
lObj := TOrderItem(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
end;

procedure TOrderItem_Read.MapRowToObject;
var
lObj: TOrderItem;
begin
lObj := TOrderItem(Visited);
lObj.OID.AssignFromTIQuery('OID',Query);
lObj.order_id := Query.FieldAsString['order_id'];
lObj.item_id := Query.FieldAsString['item_id'];
lObj.quantity := Query.FieldAsInteger['quantity'];
end;

{ TOrderItem_Delete }
function TOrderItem_Delete.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posDelete;
end;

procedure TOrderItem_Delete.Init;
begin
Query.SQLText := 
'DELETE FROM order_item ' +
'WHERE OID = :OID';
end;

procedure TOrderItem_Delete.SetupParams;
var
lObj: TOrderItem;
begin
lObj := TOrderItem(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
end;

{ TOrderItemList_Read }
function TOrderItemList_Read.AcceptVisitor: Boolean;
begin
result := (Visited.ObjectState = posEmpty);
end;

procedure TOrderItemList_Read.Init;
var
lFiltered: ItiFiltered;
lWhere: string;
lOrder: string;
lSQL: string;
begin
if Supports(Visited, ItiFiltered, lFiltered) then
begin
if lFiltered.GetCriteria.HasCriteria then
lWhere := ' WHERE ' + tiCriteriaAsSQL(lFiltered.GetCriteria)
else
lWhere := '';
if lFiltered.GetCriteria.hasOrderBy then
lOrder := tiCriteriaOrderByAsSQL(lFiltered.GetCriteria)
else
lOrder := '';
end;

lSQL := 
'SELECT ' + 
' OID, ' +
' order_id, ' + 
' item_id, ' + 
' quantity ' + 
'FROM  order_item %s %s ;';

Query.SQLText := gFormatSQL(Format(lSQL, [lWhere, lOrder]), TOrderItem);

end;

procedure TOrderItemList_Read.MapRowToObject;
var
lObj: TOrderItem;
begin
lObj := TOrderItem.Create;
lObj.OID.AssignFromTIQuery('OID',Query);
lObj.order_id := Query.FieldAsString['order_id'];
lObj.item_id := Query.FieldAsString['item_id'];
lObj.quantity := Query.FieldAsInteger['quantity'];
lObj.ObjectState := posClean;
TtiObjectList(Visited).Add(lObj);
end;

{ TOrderItemList_Create }
function TOrderItemList_Create.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posCreate;
end;

procedure TOrderItemList_Create.Init;
begin
Query.SQLText := 
'INSERT INTO order_item(' + 
' OID, ' + 
' order_id, ' + 
' item_id, ' + 
' quantity' + 
') VALUES (' +
' :OID, ' +
' :order_id, ' + 
' :item_id, ' + 
' :quantity' + 
') ';
end;

procedure TOrderItemList_Create.SetupParams;
var
lObj: TOrderItem;
begin
lObj := TOrderItem(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsString['order_id'] := lObj.order_id;
Query.ParamAsString['item_id'] := lObj.item_id;
Query.ParamAsInteger['quantity'] := lObj.quantity;
end;

{ TOrderItemList_Delete }
function TOrderItemList_Delete.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posDelete;
end;

procedure TOrderItemList_Delete.Init;
begin
Query.SQLText := 
'DELETE FROM order_item ' +
'WHERE OID = :OID';
end;

procedure TOrderItemList_Delete.SetupParams;
var
lObj: TOrderItem;
begin
lObj := TOrderItem(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
end;
{ TOrderItemList_Save }
function TOrderItemList_Save.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posUpdate;
end;

procedure TOrderItemList_Save.Init;
begin
Query.SQLText := 
'UPDATE order_item SET ' +
' order_id = :order_id, ' + 
' item_id = :item_id, ' + 
' quantity = :quantity ' + 
'WHERE OID = :OID' ;
end;

procedure TOrderItemList_Save.SetupParams;
var
lObj: TOrderItem;
begin
lObj := TOrderItem(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsString['order_id'] := lObj.order_id;
Query.ParamAsString['item_id'] := lObj.item_id;
Query.ParamAsInteger['quantity'] := lObj.quantity;
end;

{ TOrderType_Create }
function TOrderType_Create.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posCreate;
end;

procedure TOrderType_Create.Init;
begin
Query.SQLText := 
'INSERT INTO order_type(' + 
' OID, ' + 
' order_type_name' + 
') VALUES (' +
' :OID, ' +
' :order_type_name' + 
') ';
end;

procedure TOrderType_Create.SetupParams;
var
lObj: TOrderType;
begin
lObj := TOrderType(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsString['order_type_name'] := lObj.order_type_name;
end;

{ TOrderType_Save }
function TOrderType_Save.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posUpdate;
end;

procedure TOrderType_Save.Init;
begin
Query.SQLText := 
'UPDATE order_type SET ' +
' order_type_name = :order_type_name ' + 
'WHERE OID = :OID' ;
end;

procedure TOrderType_Save.SetupParams;
var
lObj: TOrderType;
begin
lObj := TOrderType(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsString['order_type_name'] := lObj.order_type_name;
end;

{ TOrderType_Read }
function TOrderType_Read.AcceptVisitor: Boolean;
begin
result := (Visited.ObjectState = posPK) OR (Visited.ObjectState = posClean);
end;

procedure TOrderType_Read.Init;
begin
Query.SQLText := 
'SELECT ' + 
' OID, ' +
' order_type_name ' + 
'FROM  order_type WHERE OID = :OID' ;
end;

procedure TOrderType_Read.SetupParams;
var
lObj: TOrderType;
begin
lObj := TOrderType(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
end;

procedure TOrderType_Read.MapRowToObject;
var
lObj: TOrderType;
begin
lObj := TOrderType(Visited);
lObj.OID.AssignFromTIQuery('OID',Query);
lObj.order_type_name := Query.FieldAsString['order_type_name'];
end;

{ TOrderType_Delete }
function TOrderType_Delete.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posDelete;
end;

procedure TOrderType_Delete.Init;
begin
Query.SQLText := 
'DELETE FROM order_type ' +
'WHERE OID = :OID';
end;

procedure TOrderType_Delete.SetupParams;
var
lObj: TOrderType;
begin
lObj := TOrderType(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
end;

{ TOrderTypeList_Read }
function TOrderTypeList_Read.AcceptVisitor: Boolean;
begin
result := (Visited.ObjectState = posEmpty);
end;

procedure TOrderTypeList_Read.Init;
var
lFiltered: ItiFiltered;
lWhere: string;
lOrder: string;
lSQL: string;
begin
if Supports(Visited, ItiFiltered, lFiltered) then
begin
if lFiltered.GetCriteria.HasCriteria then
lWhere := ' WHERE ' + tiCriteriaAsSQL(lFiltered.GetCriteria)
else
lWhere := '';
if lFiltered.GetCriteria.hasOrderBy then
lOrder := tiCriteriaOrderByAsSQL(lFiltered.GetCriteria)
else
lOrder := '';
end;

lSQL := 
'SELECT ' + 
' OID, ' +
' order_type_name ' + 
'FROM  order_type %s %s ;';

Query.SQLText := gFormatSQL(Format(lSQL, [lWhere, lOrder]), TOrderType);

end;

procedure TOrderTypeList_Read.MapRowToObject;
var
lObj: TOrderType;
begin
lObj := TOrderType.Create;
lObj.OID.AssignFromTIQuery('OID',Query);
lObj.order_type_name := Query.FieldAsString['order_type_name'];
lObj.ObjectState := posClean;
TtiObjectList(Visited).Add(lObj);
end;

{ TOrderTypeList_Create }
function TOrderTypeList_Create.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posCreate;
end;

procedure TOrderTypeList_Create.Init;
begin
Query.SQLText := 
'INSERT INTO order_type(' + 
' OID, ' + 
' order_type_name' + 
') VALUES (' +
' :OID, ' +
' :order_type_name' + 
') ';
end;

procedure TOrderTypeList_Create.SetupParams;
var
lObj: TOrderType;
begin
lObj := TOrderType(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsString['order_type_name'] := lObj.order_type_name;
end;

{ TOrderTypeList_Delete }
function TOrderTypeList_Delete.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posDelete;
end;

procedure TOrderTypeList_Delete.Init;
begin
Query.SQLText := 
'DELETE FROM order_type ' +
'WHERE OID = :OID';
end;

procedure TOrderTypeList_Delete.SetupParams;
var
lObj: TOrderType;
begin
lObj := TOrderType(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
end;
{ TOrderTypeList_Save }
function TOrderTypeList_Save.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posUpdate;
end;

procedure TOrderTypeList_Save.Init;
begin
Query.SQLText := 
'UPDATE order_type SET ' +
' order_type_name = :order_type_name ' + 
'WHERE OID = :OID' ;
end;

procedure TOrderTypeList_Save.SetupParams;
var
lObj: TOrderType;
begin
lObj := TOrderType(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsString['order_type_name'] := lObj.order_type_name;
end;

initialization
RegisterVisitors;
RegisterMappings;


end.
