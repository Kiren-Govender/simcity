unit simcity_facade;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, items, form_add_new_item;

type

  { TUI_Facade }

  TUI_Facade = class(TObject)
    private
    public
          procedure add_new_item;
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

end.

