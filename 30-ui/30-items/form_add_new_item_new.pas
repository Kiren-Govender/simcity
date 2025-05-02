unit form_add_new_item_new;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin,
  EditBtn, Buttons, items, tiObject, tiopfmanager;

type

  { TfrmAddNewItemNew }

  TfrmAddNewItemNew = class(TForm)
    btnSave: TButton;
    Button2: TButton;
    cmbItemTypes: TComboBox;
    edtItemName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    seditOnHand: TSpinEdit;
    seRequired: TSpinEdit;
    SpeedButton1: TSpeedButton;
    teProductionTime: TTimeEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure SaveItem;
    procedure populateItemTypes;
    function GetItemTypeIDFromName(aname: string):string;
  public

  end;

var
  frmAddNewItemNew: TfrmAddNewItemNew;

implementation

{$R *.lfm}

{ TfrmAddNewItemNew }

procedure TfrmAddNewItemNew.btnSaveClick(Sender: TObject);
begin
      SaveItem;
end;

procedure TfrmAddNewItemNew.Button2Click(Sender: TObject);
begin
  self.close;
end;

procedure TfrmAddNewItemNew.FormCreate(Sender: TObject);
begin
    showmessage('Populating Item Types');
  populateItemTypes;
end;

procedure TfrmAddNewItemNew.SaveItem;
var
  item: TItem;
begin
  item:=TItem.Create;
  item.ObjectState:=posCreate;
  gTiopfManager.DefaultOIDGenerator.AssignNextOID(item.OID);
  item.item_name:=edtItemName.text;
  item.item_onhand:=seditOnHand.Value;
  item.item_required:=seRequired.Value;
  item.item_production_time:=teProductionTime.Time;
  item.item_type_id:=GetItemTypeIDFromName(cmbItemTypes.text);
  item.save;
  self.close;
end;

procedure TfrmAddNewItemNew.populateItemTypes;
var
  aItemTypes : TItemTypeList;
  count : integer;
begin
  aItemTypes := TItemTypeList.Create;
  try
  aItemTypes.read;
  for count:=0 to aItemTypes.Count-1 do
  begin
    self.cmbItemTypes.Items.Add(aItemTypes.Items[count].item_type_name);
  end;
  finally
    aItemTypes.free;
  end;
end;

function TfrmAddNewItemNew.GetItemTypeIDFromName(aname: string): string;
var
  aItemTypes : TItemTypeList;
begin
  aItemTypes := TItemTypeList.Create;
  try
  aItemTypes.GetItemTypeIDFromName(aname);
  result:=aItemTypes.Items[0].OID.AsString;
  finally
    aItemTypes.free;
  end;
end;

end.

