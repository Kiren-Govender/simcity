unit mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls, Buttons, DBCtrls, simcity_facade, items;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ListBox1: TListBox;
    pagecontrol1: TPageControl;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    SpeedButton1: TSpeedButton;
    tbEvents: TTabSheet;
    tbBuildings: TTabSheet;
    tbItems: TTabSheet;
    tbStorage: TTabSheet;
    tbOrders: TTabSheet;
    ToolBar1: TToolBar;
    TreeView1: TTreeView;
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
  private
         ui_face : TUI_Facade;
  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.TabControl1Change(Sender: TObject);
begin

end;

procedure TfrmMain.Button3Click(Sender: TObject);
var
  a : TItemList;
  b : integer;
begin
  a:=TItemList.Create;
  a.Read;
  label1.caption:=inttostr(a.Count);
  for b:=0 to a.Count-1 do
  begin
    listbox1.Items.Add(a.Items[b].item_name);
  end;


end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ui_face:=TUI_Facade.create;
end;

procedure TfrmMain.Panel4Click(Sender: TObject);
begin

end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
  ui_face.add_new_item;
end;

end.

