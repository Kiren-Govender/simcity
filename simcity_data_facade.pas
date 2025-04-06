unit simcity_data_facade;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils
  , items
  ;
type

  TItem_table_map = class(TItem)
  private
  public

  end;

  { TItem_list_map }

  TItem_list_map = class(TItemList)
  private
  public
    procedure findbyname(aname : string);
  end;

implementation

{ TItem_list_map }

procedure TItem_list_map.findbyname(aname: string);
var
  a : integer;
begin
  for a:=0 to self.count-1 do
  begin
    if self.Items[a].item_name=aname then
    begin

    end;
  end;
end;

end.

