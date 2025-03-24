unit form_add_new_item;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, TiopfManager, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, items, tiobject;

type

  { Tfrm_add_new_item }

  Tfrm_add_new_item = class(TForm)
    Button1: TButton;
    Button2: TButton;
    edtItemName: TEdit;
    edtOnHand: TEdit;
    edtRequired: TEdit;
    edtProductionTime: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  frm_add_new_item: Tfrm_add_new_item;

implementation

{$R *.lfm}

{ Tfrm_add_new_item }

procedure Tfrm_add_new_item.Button1Click(Sender: TObject);
var
  a : TItem;
begin
  a:=TItem.Create;
  a.ObjectState:=posCreate;
  gTiopfManager.DefaultOIDGenerator.AssignNextOID(a.OID);
  a.item_name:=edtItemName.text;
  //a.item_onhand:=strtoint(edtOnHand.text);
 // a.item_required:=strtoint(edtRequired.text);
  //a.item_production_time:=strtodatetime(edtProductionTime.text);
  a.save;

end;

procedure Tfrm_add_new_item.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseAction:=cafree;
end;

end.

