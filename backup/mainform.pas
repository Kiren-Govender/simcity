unit mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls, Buttons, DBCtrls, ActnList, simcity_facade, items, TIOPFManager;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    acAddNewItem: TAction;
    ActionList1: TActionList;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    ImageList1: TImageList;
    lblItemName: TLabel;
    lblOnHand: TLabel;
    lblRequired: TLabel;
    lblProductionTime: TLabel;
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
    ToolButton1: TToolButton;
    TreeView1: TTreeView;
    procedure acAddNewItemExecute(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
  private
    ui_face: TUI_Facade;
    procedure refresh;
    procedure findoidbyname(aname: string);
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

procedure TfrmMain.refresh;
var
  a: TItemList;
  b: integer;
begin
  listbox1.Clear;
  a := TItemList.Create;
  a.Read;
  lblItemName.Caption := IntToStr(a.Count);
  for b := 0 to a.Count - 1 do
  begin
    listbox1.Items.Add(a.Items[b].item_name);
  end;
end;

procedure TfrmMain.findoidbyname(aname: string);
var
  sSQL: string;
begin
  sSQL := 'SELECT * from item WHERE oid = ''' + aname + '''';
  GTIOPFManager.ExecSQL(sSQL);
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin

end;

procedure TfrmMain.acAddNewItemExecute(Sender: TObject);
begin
  ui_face.add_new_item;
  self.refresh;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ui_face := TUI_Facade.Create;
  self.refresh;
end;

procedure TfrmMain.ListBox1Click(Sender: TObject);
var
  a: TItemList;
  b: integer;
  c: string;
  S: string;
begin
  a := TItemList.Create;
  a.Read;
  c := listbox1.GetSelectedText;

  for b := 0 to a.Count - 1 do
  begin
    if a.Items[b].item_name = c then
    begin
      lblItemName.Caption := a.Items[b].item_name;
      lblOnHand.Caption := IntToStr(a.Items[b].item_onhand);
      lblRequired.Caption := IntToStr(a.Items[b].item_required);
      S := FormatDateTime('hh:mm:ss', a.Items[b].item_production_time);
      lblProductionTime.Caption := S;
    end;
  end;
  //a.FindbyName(c);
  //self.refresh;

  a.Free;
end;

procedure TfrmMain.ListBox1DblClick(Sender: TObject);
var
  a: TItemList;
  b: integer;
  c: string;
begin
  a := TItemList.Create;
  a.Read;
  c := listbox1.GetSelectedText;

  for b := 0 to a.Count - 1 do
  begin
    if a.Items[b].item_name = c then
      ui_face.update_item(a.Items[b].OID.AsString);
  end;
  //a.FindbyName(c);
  self.refresh;
end;

procedure TfrmMain.Panel4Click(Sender: TObject);
begin

end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
  ui_face.add_new_item;
end;

end.
