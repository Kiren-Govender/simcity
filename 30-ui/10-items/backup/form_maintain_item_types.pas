unit form_maintain_item_types;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ComCtrls, items, tiObject, tiModelMediator, tiopfmanager;

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
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
         procedure refresh;
         procedure AddNewItemType(aitemtypedescription : string);
         procedure SetupMediators;
  public

  end;

var
  frm_maintain_item_types: Tfrm_maintain_item_types;

implementation

{$R *.lfm}

uses
  ,tiMediators
  ,tiListMediators
 ;

{ Tfrm_maintain_item_types }

procedure Tfrm_maintain_item_types.FormCreate(Sender: TObject);
begin
  refresh;
  SetupMediators;
end;

procedure Tfrm_maintain_item_types.Button1Click(Sender: TObject);
var
  ItemType : TItemType;
begin
  ItemType := TItemType.create;
  ItemType.ObjectState:=posCreate;
  gTiopfManager.DefaultOIDGenerator.AssignNextOID(ItemType.OID);
  ItemType.item_type_name:=edit1.text;
  ItemType.save;
  refresh;
end;

procedure Tfrm_maintain_item_types.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
    CloseAction:=cafree;
end;

procedure Tfrm_maintain_item_types.refresh;
var
  ItemTypeList : TItemTypeList;
  a : integer;
begin
  listbox1.clear;
  ItemTypeList := TItemTypeList.create;
  ItemTypeList.read;
  for a := 0 to itemTypelist.count-1 do
  begin
    listbox1.Items.Add(itemTypelist.Items[a].item_type_name);
  end;
end;

procedure Tfrm_maintain_item_types.AddNewItemType(aitemtypedescription: string);
begin
end;

procedure Tfrm_maintain_item_types.SetupMediators;
begin

end;

initialization
  RegisterFallBackMediators;
  RegisterFallBackListmediators;

end.

