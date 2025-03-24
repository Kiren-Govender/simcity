unit form_manage_item_types;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ActnList;

type

  { Tfrm_manage_item_types }

  Tfrm_manage_item_types = class(TForm)
    acAddItemType: TAction;
    acUpdateItemType: TAction;
    acDeleteItemType: TAction;
    ActionList1: TActionList;
    Edit1: TEdit;
    Label1: TLabel;
    ListBox1: TListBox;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
  private

  public

  end;

var
  frm_manage_item_types: Tfrm_manage_item_types;

implementation

{$R *.lfm}

end.

