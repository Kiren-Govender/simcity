

unit items;


{$IFDEF FPC}
{$mode objfpc}{$H+}
{$ENDIF}


interface


uses
SysUtils
,tiObject
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


{ Generated Class: TItem}
TItem = class(TtiObject)
protected
Fitem_name: String;
Fitem_type_id: String;
Fitem_onhand: Integer;
Fitem_required: Integer;
Fitem_production_time: TDateTime;
procedure Setitem_name(const AValue: String); virtual;
procedure Setitem_type_id(const AValue: String); virtual;
procedure Setitem_onhand(const AValue: Integer); virtual;
procedure Setitem_required(const AValue: Integer); virtual;
procedure Setitem_production_time(const AValue: TDateTime); virtual;
public
procedure   Read; override;
procedure   Save; override;
published
property    item_name: String read Fitem_name write Setitem_name;
property    item_type_id: String read Fitem_type_id write Setitem_type_id;
property    item_onhand: Integer read Fitem_onhand write Setitem_onhand;
property    item_required: Integer read Fitem_required write Setitem_required;
property    item_production_time: TDateTime read Fitem_production_time write Setitem_production_time;
end;

{ List of TItem.  TtiMappedFilteredObjectList descendant. }
TItemList = class(TtiMappedFilteredObjectList)
protected
procedure   SetItems(i: integer; const AValue: TItem); reintroduce;
function    GetItems(i: integer): TItem; reintroduce;
public
property    Items[i:integer] : TItem read GetItems write SetItems;
procedure   Add(AObject: TItem); reintroduce;
procedure   Read; override;
procedure   Save; override;
{ Return count (1) if successful. }
function    FindByOID(const AOID: string): integer;
end;

{ Generated Class: TItemType}
TItemType = class(TtiObject)
protected
Fitem_type_name: String;
procedure Setitem_type_name(const AValue: String); virtual;
public
procedure   Read; override;
procedure   Save; override;
published
property    item_type_name: String read Fitem_type_name write Setitem_type_name;
end;

{ List of TItemType.  TtiMappedFilteredObjectList descendant. }
TItemTypeList = class(TtiMappedFilteredObjectList)
protected
procedure   SetItems(i: integer; const AValue: TItemType); reintroduce;
function    GetItems(i: integer): TItemType; reintroduce;
public
property    Items[i:integer] : TItemType read GetItems write SetItems;
procedure   Add(AObject: TItemType); reintroduce;
procedure   Read; override;
procedure   Save; override;
{ Return count (1) if successful. }
function    FindByOID(const AOID: string): integer;
end;

{ Read Visitor for TItem }
TItem_Read = class(TtiVisitorSelect)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
procedure   MapRowToObject; override;
end;

{ Create Visitor for TItem }
TItem_Create = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ Update Visitor for TItem }
TItem_Save = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ Delete Visitor for TItem }
TItem_Delete = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ List Read Visitor for TItemList }
TItemList_Read = class(TtiVisitorSelect)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   MapRowToObject; override;
end;

{ List Create Visitor for TItemList }
TItemList_Create = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ List Update Visitor for TItemList }
TItemList_Save = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ List Delete Visitor for TItemList }
TItemList_Delete = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ Read Visitor for TItemType }
TItemType_Read = class(TtiVisitorSelect)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
procedure   MapRowToObject; override;
end;

{ Create Visitor for TItemType }
TItemType_Create = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ Update Visitor for TItemType }
TItemType_Save = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ Delete Visitor for TItemType }
TItemType_Delete = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ List Read Visitor for TItemTypeList }
TItemTypeList_Read = class(TtiVisitorSelect)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   MapRowToObject; override;
end;

{ List Create Visitor for TItemTypeList }
TItemTypeList_Create = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ List Update Visitor for TItemTypeList }
TItemTypeList_Save = class(TtiVisitorUpdate)
protected
function    AcceptVisitor: Boolean; override;
procedure   Init; override;
procedure   SetupParams; override;
end;

{ List Delete Visitor for TItemTypeList }
TItemTypeList_Delete = class(TtiVisitorUpdate)
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
{ Automap registrations for TItem }
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TItem, 
'item', 'OID', 'OID', [pktDB]);
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TItem,
'item','item_name', 'item_name');
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TItem,
'item','item_type_id', 'item_type_id');
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TItem,
'item','item_onhand', 'item_onhand');
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TItem,
'item','item_required', 'item_required');
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TItem,
'item','item_production_time', 'item_production_time');
GTIOPFManager.ClassDBMappingMgr.RegisterCollection(TItemList, TItem);

{ Automap registrations for TItemType }
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TItemType, 
'item_type', 'OID', 'OID', [pktDB]);
GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TItemType,
'item_type','item_type_name', 'item_type');
GTIOPFManager.ClassDBMappingMgr.RegisterCollection(TItemTypeList, TItemType);

end;

procedure RegisterVisitors;
begin
{ Register Visitors for TItem }
GTIOPFManager.VisitorManager.RegisterVisitor('TItemList_listread', TItemList_Read);
GTIOPFManager.VisitorManager.RegisterVisitor('TItemList_listsave', TItemList_Create);
GTIOPFManager.VisitorManager.RegisterVisitor('TItemList_listsave', TItemList_Save);
GTIOPFManager.VisitorManager.RegisterVisitor('TItemList_listsave', TItemList_Delete);
GTIOPFManager.VisitorManager.RegisterVisitor('TItemread', TItem_Read);
GTIOPFManager.VisitorManager.RegisterVisitor('TItemsave', TItem_Save);
GTIOPFManager.VisitorManager.RegisterVisitor('TItemdelete', TItem_Delete);
GTIOPFManager.VisitorManager.RegisterVisitor('TItemcreate', TItem_Create);

{ Register Visitors for TItemType }
GTIOPFManager.VisitorManager.RegisterVisitor('TItemTypeList_listread', TItemTypeList_Read);
GTIOPFManager.VisitorManager.RegisterVisitor('TItemTypeList_listsave', TItemTypeList_Create);
GTIOPFManager.VisitorManager.RegisterVisitor('TItemTypeList_listsave', TItemTypeList_Save);
GTIOPFManager.VisitorManager.RegisterVisitor('TItemTypeList_listsave', TItemTypeList_Delete);
GTIOPFManager.VisitorManager.RegisterVisitor('TItemTyperead', TItemType_Read);
GTIOPFManager.VisitorManager.RegisterVisitor('TItemTypesave', TItemType_Save);
GTIOPFManager.VisitorManager.RegisterVisitor('TItemTypedelete', TItemType_Delete);
GTIOPFManager.VisitorManager.RegisterVisitor('TItemTypecreate', TItemType_Create);

end;

procedure TItem.Setitem_name(const AValue: String);
begin
if Fitem_name <> AValue then
Fitem_name := AValue;
end;

procedure TItem.Setitem_type_id(const AValue: String);
begin
if Fitem_type_id <> AValue then
Fitem_type_id := AValue;
end;

procedure TItem.Setitem_onhand(const AValue: Integer);
begin
if Fitem_onhand <> AValue then
Fitem_onhand := AValue;
end;

procedure TItem.Setitem_required(const AValue: Integer);
begin
if Fitem_required <> AValue then
Fitem_required := AValue;
end;

procedure TItem.Setitem_production_time(const AValue: TDateTime);
begin
if Fitem_production_time <> AValue then
Fitem_production_time := AValue;
end;

procedure TItem.Read;
begin
GTIOPFManager.VisitorManager.Execute(ClassName + 'read', self);
end;

procedure TItem.Save;
begin
Case ObjectState of
posDelete: GTIOPFManager.VisitorManager.Execute('TItemdelete', self);
posUpdate: GTIOPFManager.VisitorManager.Execute('TItemsave', self);
posCreate: GTIOPFManager.VisitorManager.Execute('TItemcreate', self);
end;
end;

 {TItemList }

procedure TItemList.Add(AObject: TItem);
begin
inherited Add(AObject);
end;

function TItemList.GetItems(i: integer): TItem;
begin
result := inherited GetItems(i) as TItem;
end;

procedure TItemList.Read;
begin
GTIOPFManager.VisitorManager.Execute('TItemList_listread', self);
end;

procedure TItemList.Save;
begin
GTIOPFManager.VisitorManager.Execute('TItemList_listsave', self);
end;

procedure TItemList.SetItems(i: integer; const AValue: TItem);
begin
inherited SetItems(i, AValue);
end;
function TItemList.FindByOID(const AOID: string): integer;
begin
if self.Count > 0 then
self.Clear;

Criteria.ClearAll;
Criteria.AddEqualTo('OID', AOID);
Read;
result := Count;
end;

procedure TItemType.Setitem_type_name(const AValue: String);
begin
if Fitem_type_name <> AValue then
Fitem_type_name := AValue;
end;

procedure TItemType.Read;
begin
GTIOPFManager.VisitorManager.Execute(ClassName + 'read', self);
end;

procedure TItemType.Save;
begin
Case ObjectState of
posDelete: GTIOPFManager.VisitorManager.Execute('TItemTypedelete', self);
posUpdate: GTIOPFManager.VisitorManager.Execute('TItemTypesave', self);
posCreate: GTIOPFManager.VisitorManager.Execute('TItemTypecreate', self);
end;
end;

 {TItemTypeList }

procedure TItemTypeList.Add(AObject: TItemType);
begin
inherited Add(AObject);
end;

function TItemTypeList.GetItems(i: integer): TItemType;
begin
result := inherited GetItems(i) as TItemType;
end;

procedure TItemTypeList.Read;
begin
GTIOPFManager.VisitorManager.Execute('TItemTypeList_listread', self);
end;

procedure TItemTypeList.Save;
begin
GTIOPFManager.VisitorManager.Execute('TItemTypeList_listsave', self);
end;

procedure TItemTypeList.SetItems(i: integer; const AValue: TItemType);
begin
inherited SetItems(i, AValue);
end;
function TItemTypeList.FindByOID(const AOID: string): integer;
begin
if self.Count > 0 then
self.Clear;

Criteria.ClearAll;
Criteria.AddEqualTo('OID', AOID);
Read;
result := Count;
end;

{ TItem_Create }
function TItem_Create.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posCreate;
end;

procedure TItem_Create.Init;
begin
Query.SQLText := 
'INSERT INTO item(' + 
' OID, ' + 
' item_name, ' + 
' item_type_id, ' + 
' item_onhand, ' + 
' item_required, ' + 
' item_production_time' + 
') VALUES (' +
' :OID, ' +
' :item_name, ' + 
' :item_type_id, ' + 
' :item_onhand, ' + 
' :item_required, ' + 
' :item_production_time' + 
') ';
end;

procedure TItem_Create.SetupParams;
var
lObj: TItem;
begin
lObj := TItem(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsString['item_name'] := lObj.item_name;
Query.ParamAsString['item_type_id'] := lObj.item_type_id;
Query.ParamAsInteger['item_onhand'] := lObj.item_onhand;
Query.ParamAsInteger['item_required'] := lObj.item_required;
Query.ParamAsDateTime['item_production_time'] := lObj.item_production_time;
end;

{ TItem_Save }
function TItem_Save.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posUpdate;
end;

procedure TItem_Save.Init;
begin
Query.SQLText := 
'UPDATE item SET ' +
' item_name = :item_name, ' + 
' item_type_id = :item_type_id, ' + 
' item_onhand = :item_onhand, ' + 
' item_required = :item_required, ' + 
' item_production_time = :item_production_time ' + 
'WHERE OID = :OID' ;
end;

procedure TItem_Save.SetupParams;
var
lObj: TItem;
begin
lObj := TItem(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsString['item_name'] := lObj.item_name;
Query.ParamAsString['item_type_id'] := lObj.item_type_id;
Query.ParamAsInteger['item_onhand'] := lObj.item_onhand;
Query.ParamAsInteger['item_required'] := lObj.item_required;
Query.ParamAsDateTime['item_production_time'] := lObj.item_production_time;
end;

{ TItem_Read }
function TItem_Read.AcceptVisitor: Boolean;
begin
result := (Visited.ObjectState = posPK) OR (Visited.ObjectState = posClean);
end;

procedure TItem_Read.Init;
begin
Query.SQLText := 
'SELECT ' + 
' OID, ' +
' item_name, ' + 
' item_type_id, ' + 
' item_onhand, ' + 
' item_required, ' + 
' item_production_time ' + 
'FROM  item WHERE OID = :OID' ;
end;

procedure TItem_Read.SetupParams;
var
lObj: TItem;
begin
lObj := TItem(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
end;

procedure TItem_Read.MapRowToObject;
var
lObj: TItem;
begin
lObj := TItem(Visited);
lObj.OID.AssignFromTIQuery('OID',Query);
lObj.item_name := Query.FieldAsString['item_name'];
lObj.item_type_id := Query.FieldAsString['item_type_id'];
lObj.item_onhand := Query.FieldAsInteger['item_onhand'];
lObj.item_required := Query.FieldAsInteger['item_required'];
lObj.item_production_time := Query.FieldAsDatetime['item_production_time'];
end;

{ TItem_Delete }
function TItem_Delete.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posDelete;
end;

procedure TItem_Delete.Init;
begin
Query.SQLText := 
'DELETE FROM item ' +
'WHERE OID = :OID';
end;

procedure TItem_Delete.SetupParams;
var
lObj: TItem;
begin
lObj := TItem(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
end;

{ TItemList_Read }
function TItemList_Read.AcceptVisitor: Boolean;
begin
result := (Visited.ObjectState = posEmpty);
end;

procedure TItemList_Read.Init;
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
' item_name, ' + 
' item_type_id, ' + 
' item_onhand, ' + 
' item_required, ' + 
' item_production_time ' + 
'FROM  item %s %s ;';

Query.SQLText := gFormatSQL(Format(lSQL, [lWhere, lOrder]), TItem);

end;

procedure TItemList_Read.MapRowToObject;
var
lObj: TItem;
begin
lObj := TItem.Create;
lObj.OID.AssignFromTIQuery('OID',Query);
lObj.item_name := Query.FieldAsString['item_name'];
lObj.item_type_id := Query.FieldAsString['item_type_id'];
lObj.item_onhand := Query.FieldAsInteger['item_onhand'];
lObj.item_required := Query.FieldAsInteger['item_required'];
lObj.item_production_time := Query.FieldAsDatetime['item_production_time'];
lObj.ObjectState := posClean;
TtiObjectList(Visited).Add(lObj);
end;

{ TItemList_Create }
function TItemList_Create.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posCreate;
end;

procedure TItemList_Create.Init;
begin
Query.SQLText := 
'INSERT INTO item(' + 
' OID, ' + 
' item_name, ' + 
' item_type_id, ' + 
' item_onhand, ' + 
' item_required, ' + 
' item_production_time' + 
') VALUES (' +
' :OID, ' +
' :item_name, ' + 
' :item_type_id, ' + 
' :item_onhand, ' + 
' :item_required, ' + 
' :item_production_time' + 
') ';
end;

procedure TItemList_Create.SetupParams;
var
lObj: TItem;
begin
lObj := TItem(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsString['item_name'] := lObj.item_name;
Query.ParamAsString['item_type_id'] := lObj.item_type_id;
Query.ParamAsInteger['item_onhand'] := lObj.item_onhand;
Query.ParamAsInteger['item_required'] := lObj.item_required;
Query.ParamAsDateTime['item_production_time'] := lObj.item_production_time;
end;

{ TItemList_Delete }
function TItemList_Delete.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posDelete;
end;

procedure TItemList_Delete.Init;
begin
Query.SQLText := 
'DELETE FROM item ' +
'WHERE OID = :OID';
end;

procedure TItemList_Delete.SetupParams;
var
lObj: TItem;
begin
lObj := TItem(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
end;
{ TItemList_Save }
function TItemList_Save.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posUpdate;
end;

procedure TItemList_Save.Init;
begin
Query.SQLText := 
'UPDATE item SET ' +
' item_name = :item_name, ' + 
' item_type_id = :item_type_id, ' + 
' item_onhand = :item_onhand, ' + 
' item_required = :item_required, ' + 
' item_production_time = :item_production_time ' + 
'WHERE OID = :OID' ;
end;

procedure TItemList_Save.SetupParams;
var
lObj: TItem;
begin
lObj := TItem(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsString['item_name'] := lObj.item_name;
Query.ParamAsString['item_type_id'] := lObj.item_type_id;
Query.ParamAsInteger['item_onhand'] := lObj.item_onhand;
Query.ParamAsInteger['item_required'] := lObj.item_required;
Query.ParamAsDateTime['item_production_time'] := lObj.item_production_time;
end;

{ TItemType_Create }
function TItemType_Create.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posCreate;
end;

procedure TItemType_Create.Init;
begin
Query.SQLText := 
'INSERT INTO item_type(' + 
' OID, ' + 
' item_type' + 
') VALUES (' +
' :OID, ' +
' :item_type' + 
') ';
end;

procedure TItemType_Create.SetupParams;
var
lObj: TItemType;
begin
lObj := TItemType(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsString['item_type'] := lObj.item_type_name;
end;

{ TItemType_Save }
function TItemType_Save.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posUpdate;
end;

procedure TItemType_Save.Init;
begin
Query.SQLText := 
'UPDATE item_type SET ' +
' item_type = :item_type ' + 
'WHERE OID = :OID' ;
end;

procedure TItemType_Save.SetupParams;
var
lObj: TItemType;
begin
lObj := TItemType(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsString['item_type'] := lObj.item_type_name;
end;

{ TItemType_Read }
function TItemType_Read.AcceptVisitor: Boolean;
begin
result := (Visited.ObjectState = posPK) OR (Visited.ObjectState = posClean);
end;

procedure TItemType_Read.Init;
begin
Query.SQLText := 
'SELECT ' + 
' OID, ' +
' item_type ' + 
'FROM  item_type WHERE OID = :OID' ;
end;

procedure TItemType_Read.SetupParams;
var
lObj: TItemType;
begin
lObj := TItemType(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
end;

procedure TItemType_Read.MapRowToObject;
var
lObj: TItemType;
begin
lObj := TItemType(Visited);
lObj.OID.AssignFromTIQuery('OID',Query);
lObj.item_type_name := Query.FieldAsString['item_type'];
end;

{ TItemType_Delete }
function TItemType_Delete.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posDelete;
end;

procedure TItemType_Delete.Init;
begin
Query.SQLText := 
'DELETE FROM item_type ' +
'WHERE OID = :OID';
end;

procedure TItemType_Delete.SetupParams;
var
lObj: TItemType;
begin
lObj := TItemType(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
end;

{ TItemTypeList_Read }
function TItemTypeList_Read.AcceptVisitor: Boolean;
begin
result := (Visited.ObjectState = posEmpty);
end;

procedure TItemTypeList_Read.Init;
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
' item_type ' + 
'FROM  item_type %s %s ;';

Query.SQLText := gFormatSQL(Format(lSQL, [lWhere, lOrder]), TItemType);

end;

procedure TItemTypeList_Read.MapRowToObject;
var
lObj: TItemType;
begin
lObj := TItemType.Create;
lObj.OID.AssignFromTIQuery('OID',Query);
lObj.item_type_name := Query.FieldAsString['item_type'];
lObj.ObjectState := posClean;
TtiObjectList(Visited).Add(lObj);
end;

{ TItemTypeList_Create }
function TItemTypeList_Create.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posCreate;
end;

procedure TItemTypeList_Create.Init;
begin
Query.SQLText := 
'INSERT INTO item_type(' + 
' OID, ' + 
' item_type' + 
') VALUES (' +
' :OID, ' +
' :item_type' + 
') ';
end;

procedure TItemTypeList_Create.SetupParams;
var
lObj: TItemType;
begin
lObj := TItemType(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsString['item_type'] := lObj.item_type_name;
end;

{ TItemTypeList_Delete }
function TItemTypeList_Delete.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posDelete;
end;

procedure TItemTypeList_Delete.Init;
begin
Query.SQLText := 
'DELETE FROM item_type ' +
'WHERE OID = :OID';
end;

procedure TItemTypeList_Delete.SetupParams;
var
lObj: TItemType;
begin
lObj := TItemType(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
end;
{ TItemTypeList_Save }
function TItemTypeList_Save.AcceptVisitor: Boolean;
begin
result := Visited.ObjectState = posUpdate;
end;

procedure TItemTypeList_Save.Init;
begin
Query.SQLText := 
'UPDATE item_type SET ' +
' item_type = :item_type ' + 
'WHERE OID = :OID' ;
end;

procedure TItemTypeList_Save.SetupParams;
var
lObj: TItemType;
begin
lObj := TItemType(Visited);
lObj.OID.AssignToTIQuery('OID',Query);
Query.ParamAsString['item_type'] := lObj.item_type_name;
end;

initialization
RegisterVisitors;
RegisterMappings;


end.
