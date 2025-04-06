unit form_maintain_item_types;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ComCtrls, items, tiObject, tiopfmanager;

type

  { Tfrm_maintain_item_types }

  Tfrm_maintain_item_types = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    ListBox1: TListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
  private
         procedure refresh;
         procedure AddNewItemType(aitemtypedescription : string);
  public

  end;

var
  frm_maintain_item_types: Tfrm_maintain_item_types;

implementation

{$R *.lfm}

{ Tfrm_maintain_item_types }

procedure Tfrm_maintain_item_types.refresh;
var
  ItemTypeList : TItemTypeList;
  a : integer;
begin
  ItemTypeList := TItemTypeList.create;
  ItemTypeList.read;
  for a := 0 to itemTypelist.count-1 do
  begin
    listbox1.Items.Add(itemTypelist.Items[a].item_type_name);
  end;
end;

procedure Tfrm_maintain_item_types.AddNewItemType(aitemtypedescription: string);
var
  ItemType : TItemType;
begin
  ItemType := TItemType.create;
  itemtype.ObjectState:=posCreate;
  gTiopfManager.DefaultOIDGenerator.AssignNextOID(itemtype.OID);
  itemtype.item_type_name:=edit1.text;
  itemtype.save;
end;

end.

