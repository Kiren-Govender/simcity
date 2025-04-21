unit form_update_item;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin,
  EditBtn, ExtCtrls, items, tiObject, tiModelMediator;

type

  { Tfrm_update_item }

  Tfrm_update_item = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    edtItemName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    seditOnHand: TSpinEdit;
    seRequired: TSpinEdit;
    teProductionTime: TTimeEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    loid : string;
    procedure UpdateItem;
    procedure SetupMediators;
  public
        constructor create(aoid : string);
  end;

var
  frm_update_item: Tfrm_update_item;

implementation

{$R *.lfm}

uses
  tiMediators
  ,tiListMediators
 ;
{ Tfrm_update_item }

procedure Tfrm_update_item.Button1Click(Sender: TObject);
begin
  UpdateItem;
  showmessage('Item Saved');
  self.close;
end;

procedure Tfrm_update_item.Button2Click(Sender: TObject);
begin
  self.close;
end;

procedure Tfrm_update_item.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
    CloseAction:=cafree;
end;

procedure Tfrm_update_item.FormCreate(Sender: TObject);
begin
  SetupMediators;
end;

procedure Tfrm_update_item.UpdateItem;
var
  item: TItem;
begin
  item:=TITem.create;
    item.ObjectState:=posPK;
    item.OID.asstring:=loid;
    item.read;
    item.ObjectState:=posUpdate;
    item.item_name:=edtItemName.Text;
    item.item_onhand:=seditOnHand.Value;
    item.item_required:=seRequired.Value;
    item.item_production_time:=teProductionTime.Time;
    item.save;
end;

procedure Tfrm_update_item.SetupMediators;
begin

end;

constructor Tfrm_update_item.create(aoid: string);
var
  items : TItemList;
begin
  inherited create(nil);
  self.loid:=aoid;
  items:=TItemList.create;
  items.FindByOID(aoid);
  edtItemName.Text:=items.Items[0].item_name;
  seditOnHand.Value:=items.Items[0].item_onhand;
  seRequired.Value:=items.Items[0].item_required;
  teProductionTime.Time:=items.Items[0].item_production_time;
end;

initialization
  RegisterFallBackMediators;
  RegisterFallBackListmediators;

end.

