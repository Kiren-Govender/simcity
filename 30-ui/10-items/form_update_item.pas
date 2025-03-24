unit form_update_item;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin,
  EditBtn, items, tiobject;

type

  { Tfrm_update_item }

  Tfrm_update_item = class(TForm)
    Button1: TButton;
    Button2: TButton;
    edtItemName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    seditOnHand: TSpinEdit;
    seRequired: TSpinEdit;
    teProductionTime: TTimeEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    loid : string;
  public
        constructor create(aoid : string);
  end;

var
  frm_update_item: Tfrm_update_item;

implementation

{$R *.lfm}

{ Tfrm_update_item }

procedure Tfrm_update_item.Button1Click(Sender: TObject);
var
  a : TItem;
begin
  a:=TITem.create;
  a.ObjectState:=posPK;
  a.OID.asstring:=loid;
  a.read;
  a.ObjectState:=posUpdate;
  a.item_name:=edtItemName.Text;
  a.item_onhand:=seditOnHand.Value;
  a.item_required:=seRequired.Value;
  a.item_production_time:=teProductionTime.Time;
  a.save;
  showmessage('Item Saved');
  self.close;
end;

procedure Tfrm_update_item.Button2Click(Sender: TObject);
begin
  self.close;
end;

constructor Tfrm_update_item.create(aoid: string);
var
  a : TItemList;
begin
  inherited create(nil);
  self.loid:=aoid;
  a:=TItemList.create;
  a.FindByOID(aoid);
  edtItemName.Text:=a.Items[0].item_name;
  seditOnHand.Value:=a.Items[0].item_onhand;
  seRequired.Value:=a.Items[0].item_required;
  teProductionTime.Time:=a.Items[0].item_production_time;
end;

end.

