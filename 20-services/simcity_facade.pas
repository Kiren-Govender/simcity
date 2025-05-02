unit simcity_facade;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, items
  , form_add_new_item
  , form_update_item
  , form_maintain_item_types
  , form_add_new_order
  , form_maintain_order_types
  ;

type

  { TUI_Facade }

  TUI_Facade = class(TObject)
    private
    public
          procedure add_new_item;
          procedure update_item(aoid : string);
          procedure maintain_item_types(aoid : string);
          procedure add_new_order;
          procedure maintain_order_types;
  end;

implementation

{ TUI_Facade }

procedure TUI_Facade.add_new_item;
var
   a: Tfrm_add_new_item;
begin
   a:=Tfrm_add_new_item.create(nil);
   a.showmodal;
end;

procedure TUI_Facade.update_item(aoid: string);
var
   a: Tfrm_update_item;
begin
   a:=Tfrm_update_item.create(aoid);
   a.showmodal;
end;

procedure TUI_Facade.maintain_item_types(aoid: string);
var
   a: Tfrm_maintain_item_types;
begin
   a:= Tfrm_maintain_item_types.create(nil, aoid);
   a.showmodal;
end;

procedure TUI_Facade.add_new_order;
var
   frm: Tfrm_add_new_order;
begin
   frm:= Tfrm_add_new_order.create(nil);
   frm.showmodal;
end;

procedure TUI_Facade.maintain_order_types;
var
   frm: TfrmMaintainOrderTypes;
begin
   frm:= TfrmMaintainOrderTypes.create(nil);
   frm.showmodal;
end;

end.

