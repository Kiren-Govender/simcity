unit form_add_new_item;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, TiopfManager, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Spin, EditBtn, Buttons, items, tiObject, tiModelMediator;

type

  { Tfrm_add_new_item }

  Tfrm_add_new_item = class(TForm)
    Button1: TButton;
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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    procedure SaveItem;
    procedure populateItemTypes;
  public

  end;
  { #todo : Add a routine to populate the item types }

var
  frm_add_new_item: Tfrm_add_new_item;

implementation

{$R *.lfm}

uses
  {simcity_facade
  ,}tiMediators
  ,tiListMediators
 ;

{ Tfrm_add_new_item }



procedure Tfrm_add_new_item.Button1Click(Sender: TObject);
begin
    SaveItem;
end;

procedure Tfrm_add_new_item.Button2Click(Sender: TObject);
begin
    self.close;
end;


procedure Tfrm_add_new_item.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseAction:=cafree;
end;

procedure Tfrm_add_new_item.FormCreate(Sender: TObject);
begin
  // SetupMediators;
  inherited create(nil);
  showmessage('Populating Item Types');
  //populateItemTypes;
end;

procedure Tfrm_add_new_item.SaveItem;
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
  item.save;
  self.close;
end;

procedure Tfrm_add_new_item.populateItemTypes;
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

initialization
  RegisterFallBackMediators;
  RegisterFallBackListmediators;

end.

