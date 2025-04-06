unit form_add_new_order;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin, Grids,
  EditBtn;

type

  { Tfrm_add_new_order }

  Tfrm_add_new_order = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpinEdit1: TSpinEdit;
    StringGrid1: TStringGrid;
    TimeEdit1: TTimeEdit;
  private

  public

  end;

var
  frm_add_new_order: Tfrm_add_new_order;

implementation

{$R *.lfm}

end.

