unit app_service;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, items, ActnList, Controls
  , form_add_new_item
  , form_update_item
  , form_maintain_item_types
  , form_add_new_order
  , form_maintain_order_types
  ;

type

  { TdmApplicationService }

  TdmApplicationService = class(TDataModule)
    acAddNewItem: TAction;
    acAddOrder: TAction;
    acAdd_New_Item: TAction;
    acMaintainItemTypes: TAction;
    acRemoveOrder: TAction;
    acMaintainOrderTypes: TAction;
    ActionList1: TActionList;
    ImageList1: TImageList;
    procedure acAddNewItemExecute(Sender: TObject);
    procedure acAddOrderExecute(Sender: TObject);
    procedure acMaintainItemTypesExecute(Sender: TObject);
    procedure acMaintainOrderTypesExecute(Sender: TObject);
    procedure acRemoveOrderExecute(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private

  public
    procedure add_new_item;
    procedure update_item(aoid : string);
    procedure maintain_item_types;
    procedure add_new_order;
    procedure maintain_order_types;
  end;

var
  dmApplicationService: TdmApplicationService;

  function DMAPP : TdmApplicationService;

implementation
 {$R *.lfm}
function DMAPP: TdmApplicationService;
begin
    if dmApplicationService = nil then
      dmApplicationService := TdmApplicationService.Create(nil);
    Result := dmApplicationService;
  end;

{ TdmApplicationService }

procedure TdmApplicationService.acAddNewItemExecute(Sender: TObject);
var
   a: Tfrm_add_new_item;
begin
   a:=Tfrm_add_new_item.create(nil);
   a.showmodal;
end;

procedure TdmApplicationService.acAddOrderExecute(Sender: TObject);
var
   frm: Tfrm_add_new_order;
begin
   frm:= Tfrm_add_new_order.create(nil);
   frm.showmodal;
end;

procedure TdmApplicationService.acMaintainItemTypesExecute(Sender: TObject);
var
   a: Tfrm_maintain_item_types;
begin
   a:= Tfrm_maintain_item_types.create(nil);
   a.showmodal;

end;

procedure TdmApplicationService.acMaintainOrderTypesExecute(Sender: TObject);
var
   frm: TfrmMaintainOrderTypes;
begin
   frm:= TfrmMaintainOrderTypes.create(nil);
   frm.showmodal;

end;

procedure TdmApplicationService.acRemoveOrderExecute(Sender: TObject);
begin
  // Todo
end;

procedure TdmApplicationService.DataModuleDestroy(Sender: TObject);
begin

end;

procedure TdmApplicationService.add_new_item;
var
   a: Tfrm_add_new_item;
begin
   a:=Tfrm_add_new_item.create(nil);
   a.showmodal;
end;

procedure TdmApplicationService.update_item(aoid: string);
var
   a: Tfrm_update_item;
begin
   a:=Tfrm_update_item.create(aoid);
   a.showmodal;
end;

procedure TdmApplicationService.maintain_item_types;
var
   a: Tfrm_maintain_item_types;
begin
   a:= Tfrm_maintain_item_types.create(nil);
   a.showmodal;
end;

procedure TdmApplicationService.add_new_order;
var
   frm: Tfrm_add_new_order;
begin
   frm:= Tfrm_add_new_order.create(nil);
   frm.showmodal;
end;

procedure TdmApplicationService.maintain_order_types;
var
   frm: TfrmMaintainOrderTypes;
begin
   frm:= TfrmMaintainOrderTypes.create(nil);
   frm.showmodal;
end;

initialization
  dmApplicationService := TdmApplicationService.Create(nil);

finalization
  if dmApplicationService <> nil then dmApplicationService.Free;


end.

