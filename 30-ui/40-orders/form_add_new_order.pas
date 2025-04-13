unit form_add_new_order;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin, Grids,
  EditBtn, Buttons, abstract_form, orders, items;

type

  { Tfrm_add_new_order }

  Tfrm_add_new_order = class(TBaseForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    cmbOrderTypes: TComboBox;
    cmbItems: TComboBox;
    cmbItemTypes: TComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpinEdit1: TSpinEdit;
    StringGrid1: TStringGrid;
    TimeEdit1: TTimeEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure PopulateItemsComboBox;
    procedure populateOrderTypesCombo;
    procedure refresh;
    procedure SaveOrder;
    //procedure refresh; abstract;
    procedure refreshdata; virtual;
  public

  end;

  TOrderEntryItem = class;

  { TOrderEntry }

  TOrderEntry = class(TObject)
  private
    Fdeadline: TDatetime;
    Forderid: string;
    FOrderEntryItems : array of TOrderEntryItem;
    function Getorderitems(s : integer): TOrderEntryItem;
    procedure Setdeadline(AValue: TDatetime);
    procedure Setorderid(AValue: string);
    procedure Setorderitems(s : integer; AValue: TOrderEntryItem);
  public
    property orderid : string read Forderid write Setorderid;
    property deadline : TDatetime read Fdeadline write Setdeadline;
    property orderitems [s : integer] : TOrderEntryItem read Getorderitems write Setorderitems;
  end;

  { TOrderEntryItem }

  TOrderEntryItem = class(TObject)
  private
    Fitemid: string;
    Fquantity: integer;
    procedure Setitemid(AValue: string);
    procedure Setquantity(AValue: integer);
  public
    property itemid : string read Fitemid write Setitemid;
    property quantity : integer read Fquantity write Setquantity;
  end;

var
  frm_add_new_order: Tfrm_add_new_order;

implementation

uses simcity_facade;

{$R *.lfm}

{ Tfrm_add_new_order }

procedure Tfrm_add_new_order.SpeedButton1Click(Sender: TObject);
var
  ui : TUI_Facade;
begin
  ui:=TUI_Facade.create;
  ui.maintain_order_types;
  populateOrderTypesCombo;
end;

procedure Tfrm_add_new_order.PopulateItemsComboBox;
var
  a: integer;
  ItemList: TItemList;
begin
  cmbItems.Clear;
  ItemList:=TItemList.create;
   ItemList.read;
   for a:=0 to ItemList.count - 1 do
   begin
        cmbItems.Items.Add(ItemList.Items[a].item_name);
   end;
end;

procedure Tfrm_add_new_order.FormCreate(Sender: TObject);
begin
  PopulateItemsComboBox;
  populateOrderTypesCombo;
end;

procedure Tfrm_add_new_order.Button1Click(Sender: TObject);
begin

end;

procedure Tfrm_add_new_order.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
    CloseAction:=cafree;
end;

procedure Tfrm_add_new_order.populateOrderTypesCombo;
var
  OrderTypeList : TOrderTypeList;
  a : integer;
begin
  cmbOrderTypes.clear;
  OrderTypeList := TOrderTypeList.create;
  OrderTypeList.Read;
  for a:= 0 to OrderTypeList.Count- 1 do
  begin
       cmbOrderTypes.Items.Add(OrderTypeList.Items[a].order_type_name);
  end;
end;


procedure Tfrm_add_new_order.refresh;
begin

end;

procedure Tfrm_add_new_order.SaveOrder;
begin

end;

procedure Tfrm_add_new_order.refreshdata;
begin

end;

{ TOrderEntryItem }

procedure TOrderEntryItem.Setitemid(AValue: string);
begin
  if Fitemid=AValue then Exit;
  Fitemid:=AValue;
end;

procedure TOrderEntryItem.Setquantity(AValue: integer);
begin
  if Fquantity=AValue then Exit;
  Fquantity:=AValue;
end;

function TOrderEntry.Getorderitems(s: integer): TOrderEntryItem;
begin
     result:=FOrderEntryItems[s];
end;

procedure TOrderEntry.Setdeadline(AValue: TDatetime);
begin
  if Fdeadline=AValue then Exit;
  Fdeadline:=AValue;
end;

procedure TOrderEntry.Setorderid(AValue: string);
begin
  if Forderid=AValue then Exit;
  Forderid:=AValue;
end;

procedure TOrderEntry.Setorderitems(s: integer; AValue: TOrderEntryItem);
begin
     FOrderEntryItems[s]:=AValue;
end;

end.

