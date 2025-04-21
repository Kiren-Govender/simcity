unit form_add_new_order;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin, Grids,
  EditBtn, Buttons, abstract_form, orders, items, DMService, tiObject, tiModelMediator, tiopfmanager;

type

  { Tfrm_add_new_order }
  TOrderEntry = class;
  TOrderEntryItem = class;

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
    procedure Button2Click(Sender: TObject);
    procedure cmbOrderTypesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    fOrderEntry : TOrderEntry;
    procedure PopulateItemsComboBox;
    procedure populateOrderTypesCombo;
    procedure SetupMediators;
    function GenerateOrderDescription: string;
  public
    property OrderEntry : TOrderEntry read fOrderEntry write fOrderEntry;
  end;


  { TOrderEntry }

  TOrderEntry = class(TObject)
  private
    Fdeadline: TDatetime;
    Forderdescription: string;
    Forderid: string;
    FOrderEntryItems : array of TOrderEntryItem;
    Forderstatus: string;
    Fordertype: string;
    Ftimeentered: TDatetime;
    function Getorderitems(s : integer): TOrderEntryItem;
    procedure Setdeadline(AValue: TDatetime);
    procedure Setorderdescription(AValue: string);
    procedure Setorderid(AValue: string);
    procedure Setorderitems(s : integer; AValue: TOrderEntryItem);
    procedure Setorderstatus(AValue: string);
    procedure Setordertype(AValue: string);
    procedure Settimeentered(AValue: TDatetime);
  public
    property orderid : string read Forderid write Setorderid;
    property ordertype : string read Fordertype write Setordertype;
    property orderdescription : string read Forderdescription write Setorderdescription;
    property deadline : TDatetime read Fdeadline write Setdeadline;
    property orderitems [s : integer] : TOrderEntryItem read Getorderitems write Setorderitems;
    property orderstatus : string read Forderstatus write Setorderstatus;
    property timeentered : TDatetime read Ftimeentered write Settimeentered;
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


{$R *.lfm}

uses
  simcity_facade
  ,tiMediators
  ,tiListMediators
 ;

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
  self.OrderEntry:=TOrderEntry.Create;
  SetupMediators;
end;

procedure Tfrm_add_new_order.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
var
  i: integer;
begin
  // Free all TOrderEntryItem objects
  for i := 0 to High(fOrderEntry.FOrderEntryItems) do
    fOrderEntry.FOrderEntryItems[i].Free;
  SetLength(fOrderEntry.FOrderEntryItems, 0); // Clear the array
  CloseAction := caFree;
end;

procedure Tfrm_add_new_order.Button2Click(Sender: TObject);
var
aorder : TOrder;
begin
  // DMS.SaveOrder('5F480043-C7D9-4F0E-8BBB-83C3F4CE51C0', 'Testing Order Types');
  //DMS.SQLQuery1.Refresh;


  aorder:= TOrder.create;
  aorder.ObjectState:=poscreate;
  gTiopfManager.DefaultOIDGenerator.AssignNextOID(aorder.OID);
  aorder.order_type_id:=self.OrderEntry.ordertype;
  aorder.order_status:='New';
  aorder.order_description:='epic-challenge-3-wood-4-metal-2-paris-jersey-1-kitchen-utensil';
  aorder.time_entered:=now();
  aorder.time_left:=now();
  aorder.save;
  aorder.Free;
  self.close;
end;

procedure Tfrm_add_new_order.Button1Click(Sender: TObject);
var
  a : integer;
begin
  a := Length(fOrderEntry.FOrderEntryItems);
  // Resize the array to accommodate the new item
  SetLength(fOrderEntry.FOrderEntryItems, a + 1);

  // Create and assign the new item
  fOrderEntry.FOrderEntryItems[a] := TOrderEntryItem.Create;
  fOrderEntry.FOrderEntryItems[a].itemid := cmbItems.Text;
  fOrderEntry.FOrderEntryItems[a].quantity := SpinEdit1.Value;

    // Update the StringGrid
  StringGrid1.RowCount := a + 2; // Adjust row count (if FixedRows=0)
  StringGrid1.Cells[0, a+1] := fOrderEntry.FOrderEntryItems[a].itemid;
  StringGrid1.Cells[1, a+1] := IntToStr(fOrderEntry.FOrderEntryItems[a].quantity);
end;

procedure Tfrm_add_new_order.cmbOrderTypesChange(Sender: TObject);
begin
  self.OrderEntry.ordertype:=cmbOrderTypes.text;
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

procedure Tfrm_add_new_order.SetupMediators;
begin

end;

function Tfrm_add_new_order.GenerateOrderDescription: string;
var
  OrderTypePart: string;
  i: Integer;
  DescParts: TStringList;
  ItemName: string;
begin
  // Process order type (replace spaces with hyphens and lowercase)
  OrderTypePart := LowerCase(
    StringReplace(Trim(cmbOrderTypes.Text), ' ', '-', [rfReplaceAll])
  );

  DescParts := TStringList.Create;
  try
    DescParts.Delimiter := '-';
    DescParts.StrictDelimiter := True;
    DescParts.Add(OrderTypePart);

    // Process each item in entry order
    for i := 0 to High(fOrderEntry.FOrderEntryItems) do
    begin
      // Sanitize item name (spaces → hyphens, lowercase)
      ItemName := LowerCase(
        StringReplace(Trim(fOrderEntry.FOrderEntryItems[i].itemid), ' ', '-', [rfReplaceAll])
      );

      DescParts.Add(IntToStr(fOrderEntry.FOrderEntryItems[i].quantity));
      DescParts.Add(ItemName);
    end;

    Result := DescParts.DelimitedText;
  finally
    DescParts.Free;
  end;
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

procedure TOrderEntry.Setorderdescription(AValue: string);
begin
  if Forderdescription=AValue then Exit;
  Forderdescription:=AValue;
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

procedure TOrderEntry.Setorderstatus(AValue: string);
begin
  if Forderstatus=AValue then Exit;
  Forderstatus:=AValue;
end;

procedure TOrderEntry.Setordertype(AValue: string);
begin
  if Fordertype=AValue then Exit;
  Fordertype:=AValue;
end;

procedure TOrderEntry.Settimeentered(AValue: TDatetime);
begin
  if Ftimeentered=AValue then Exit;
  Ftimeentered:=AValue;
end;

initialization
  RegisterFallBackMediators;
  RegisterFallBackListmediators;

end.

