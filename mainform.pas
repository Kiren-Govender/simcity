unit mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls, Buttons, DBCtrls, ActnList, Grids, Spin, Menus, TAGraph,
  simcity_facade, uConnectionUtil, DMService, app_service,
  //app_service,
  items, TIOPFManager;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    lblItemName: TLabel;
    lblOnHand: TLabel;
    lblProductionTime: TLabel;
    lblRequired: TLabel;
    ListBox1: TListBox;
    ListView1: TListView;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    pagecontrol1: TPageControl;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    SpeedButton1: TSpeedButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    tbDashboard: TTabSheet;
    tbBuildings: TTabSheet;
    tbEvents: TTabSheet;
    tbItems: TTabSheet;
    tbOrders: TTabSheet;
    tbStorage: TTabSheet;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure acAddNewItemExecute(Sender: TObject);
    procedure acAddOrderExecute(Sender: TObject);
    procedure acMaintainItemTypesExecute(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure ScrollBox1Click(Sender: TObject);
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
  try
    a := TItemList.Create;
    a.Read;
    lblItemName.Caption := IntToStr(a.Count);
    for b := 0 to a.Count - 1 do
    begin
      listbox1.Items.Add(a.Items[b].item_name);
    end;
  finally
    a.Free;
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
var
  a: TItemList;
  b: string;
begin
  //listbox1.Clear;
  a := TItemList.Create;
  //a.Read;

  b := listbox1.GetSelectedText;
  a.FindByName(b);
  label1.Caption := a.Items[0].item_name;
  label2.Caption := a.Items[0].OID.AsString;
  a.free;
  self.refresh;
end;

procedure TfrmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  ui_face.Free;
  if IsConnected then disconnect;
  //dmServiceModule.free;
  CloseAction := cafree;
end;

procedure TfrmMain.acAddNewItemExecute(Sender: TObject);
begin
  ui_face.add_new_item;
  self.refresh;
end;

procedure TfrmMain.acAddOrderExecute(Sender: TObject);
begin
  ui_face.add_new_order;
  self.refresh;
end;

procedure TfrmMain.acMaintainItemTypesExecute(Sender: TObject);
begin
  ui_face.maintain_item_types;
  //Sender.refresh;
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
  a.free;
  self.refresh;
end;

procedure TfrmMain.Panel4Click(Sender: TObject);
begin

end;

procedure TfrmMain.ScrollBox1Click(Sender: TObject);
begin

end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
  ui_face.add_new_item;
end;

end.
