unit form_add_item_bom;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin, Grids,
  items, tiobject, tiopfmanager;

type
  TBOM = class;
  TBOMItem = class;
  { TfrmAddItemBom }

  TfrmAddItemBom = class(TForm)
    btnAddItemtoBOM: TButton;
    btnSaveBOM: TButton;
    btnCancel: TButton;
    cmbItems: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    lstItemTypes: TListBox;
    seQuantity: TSpinEdit;
    sgBOM: TStringGrid;
    procedure btnAddItemtoBOMClick(Sender: TObject);
    procedure btnSaveBOMClick(Sender: TObject);
    procedure lstItemTypesClick(Sender: TObject);
  private
    Fitemid: string;
    fBOM : TBOM;
    procedure Setitemid(AValue: string);
    procedure PopulateItemTypes;
    procedure PopulateItemCombo;
    procedure LoadBOMforItem(aitemid : string);
  public
    property itemid: string read Fitemid write Setitemid;

    constructor Create(TheOwner: TComponent; itemoid: string);
  end;


  { TBOM }

  TBOM = class(TtiObject)
  private
    Fitemid: string;
    FBOMitems : array of TBOMItem;
    function GetBOMitems(s : integer): TBOMItem;
    procedure Setitemid(AValue: string);
    procedure SetBOMitems(s : integer; AValue: TBOMItem);
  public
    property itemid : string read Fitemid write Setitemid;
    property BOMitems [s : integer] : TBOMItem read GetBOMitems write SetBOMitems;
  end;


  { TBOMItem }

  TBOMItem = class(TtiObject)
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
  frmAddItemBom: TfrmAddItemBom;

implementation

{$R *.lfm}

{ TfrmAddItemBom }

procedure TfrmAddItemBom.lstItemTypesClick(Sender: TObject);
begin
  cmbItems.Clear;
  PopulateItemCombo;
end;

procedure TfrmAddItemBom.btnAddItemtoBOMClick(Sender: TObject);
var
  a : integer;
begin
  a := Length(fBOM.FBOMitems);
  // Resize the array to accommodate the new item
  SetLength(fBOM.FBOMitems, a + 1);

  // Create and assign the new item
  fBOM.FBOMitems[a] := TBOMItem.Create;
  fBOM.FBOMitems[a].itemid := cmbItems.Text;
  fBOM.FBOMitems[a].quantity := seQuantity.Value;

    // Update the StringGrid
  sgBOM.RowCount := a + 2; // Adjust row count (if FixedRows=0)
  sgBOM.Cells[0, a+1] := fBOM.FBOMitems[a].itemid;
  sgBOM.Cells[1, a+1] := IntToStr(fBOM.FBOMitems[a].quantity);
end;

procedure TfrmAddItemBom.btnSaveBOMClick(Sender: TObject);
var
abom : TItemBOM;
a : integer;
begin
  // DMS.SaveOrder('5F480043-C7D9-4F0E-8BBB-83C3F4CE51C0', 'Testing Order Types');
  //DMS.SQLQuery1.Refresh;


  for a:=0 to Length(fBOM.FBOMitems)-1 do
  begin
  //  showmessage(inttostr(Length(fBOM.FBOMitems)));
  abom:= TItemBOM.create;
  abom.ObjectState:=poscreate;
  gTiopfManager.DefaultOIDGenerator.AssignNextOID(abom.OID);
  abom.item_id:=self.itemid;
  abom.bom_item_id:=self.fBOM.BOMitems[a].itemid;
  abom.bom_item_quantity:=self.fBOM.BOMitems[a].quantity;
  abom.save;
  abom.Free;

  end;
  self.close;
end;

procedure TfrmAddItemBom.Setitemid(AValue: string);
begin
  if Fitemid = AValue then Exit;
  Fitemid := AValue;
end;

procedure TfrmAddItemBom.PopulateItemTypes;
var
  itemtypes: TItemTypeList;
  a: integer;
begin
  itemtypes := TItemTypeList.Create;
  try
    itemtypes.Read;
    for a := 0 to itemtypes.Count - 1 do
    begin
      lstItemTypes.items.Add(itemtypes.items[a].item_type_name);
    end;
  finally
    itemtypes.Free;
  end;
  lstItemTypes.ItemIndex := 0;
end;

procedure TfrmAddItemBom.PopulateItemCombo;
var
  simitems: TItemList;
  itemtypes: TItemTypeList;
  a: integer;
begin
  itemtypes := TItemTypeList.Create;
  simitems := TItemList.Create;
  try
    itemtypes.GetItemTypeIDFromName(lstITemtypes.GetSelectedText);
    simitems.FindByTypeID(itemtypes.Items[0].OID.AsString);
    for a := 0 to simitems.Count - 1 do
    begin
      cmbItems.items.Add(simitems.items[a].item_name);
    end;
  finally
    simitems.Free;
    itemtypes.Free;
  end;
  //lstItemTypes.ItemIndex := 0;
end;

procedure TfrmAddItemBom.LoadBOMforItem(aitemid: string);
var
  itembom : TItemBOMList;
  a : integer;
begin
  itembom := TItemBOMList.create;
  itembom.FindbyItemOID(aitemid);
  sgBOM.clear;
  for a:=0 to itembom.Count-1 do
  begin
    sgBOM.RowCount := a + 2; // Adjust row count (if FixedRows=0)
    sgBOM.Cells[0, a+1] := itembom.items[a].bom_item_id;
    sgBOM.Cells[1, a+1] := IntToStr(itembom.items[a].bom_item_quantity);
  end;
  {a := Length(fBOM.FBOMitems);
  // Resize the array to accommodate the new item
  SetLength(fBOM.FBOMitems, a + 1);

  // Create and assign the new item
  fBOM.FBOMitems[a] := TBOMItem.Create;
  fBOM.FBOMitems[a].itemid := cmbItems.Text;
  fBOM.FBOMitems[a].quantity := seQuantity.Value;

    // Update the StringGrid
  sgBOM.RowCount := a + 2; // Adjust row count (if FixedRows=0)
  sgBOM.Cells[0, a+1] := fBOM.FBOMitems[a].itemid;
  sgBOM.Cells[1, a+1] := IntToStr(fBOM.FBOMitems[a].quantity); }
end;

constructor TfrmAddItemBom.Create(TheOwner: TComponent; itemoid: string);
begin
  inherited Create(TheOwner);
 { item:=TItem.create;
  item.OID.AsString:=itemoid;
  item.ObjectState:=posPK;
  item.read; }
  self.itemid := itemoid;
  self.fBOM:=TBOM.create;
  self.fBOM.itemid:=itemoid;
  PopulateItemTypes;
  LoadBOMforItem(self.itemid);
end;

{ TBOM }

function TBOM.GetBOMitems(s: integer): TBOMItem;
begin
       result:=FBOMitems[s];
end;

procedure TBOM.Setitemid(AValue: string);
begin
  if Fitemid=AValue then Exit;
  Fitemid:=AValue;
end;

procedure TBOM.SetBOMitems(s: integer; AValue: TBOMItem);
begin
  FBOMitems[s]:=AValue;
end;

{ TBOMItem }

procedure TBOMItem.Setitemid(AValue: string);
begin
  if Fitemid=AValue then Exit;
  Fitemid:=AValue;
end;

procedure TBOMItem.Setquantity(AValue: integer);
begin
  if Fquantity=AValue then Exit;
  Fquantity:=AValue;
end;

end.
