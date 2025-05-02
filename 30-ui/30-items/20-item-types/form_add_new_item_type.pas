unit form_add_new_item_type;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, tiopfmanager,
  dmservice, tiobject, Dialogs, items, abstract_type_maintenance_addtype_form;

type

  { TfrmAddNewItemType }

  TfrmAddNewItemType = class(TfrmAbstractAddNewType)
    procedure edtDescriptionChange(Sender: TObject);
  private
  protected
    procedure SaveType; override;
    function IsValid: boolean; override;
    function CustomCaption: string; override;
  public

  end;

var
  frmAddNewItemType: TfrmAddNewItemType;

implementation

{$R *.lfm}

{ TfrmAddNewItemType }


procedure TfrmAddNewItemType.edtDescriptionChange(Sender: TObject);
begin
  btnSave.Enabled:=true;
end;

procedure TfrmAddNewItemType.SaveType;
var
  itemtype: TItemType;
begin
  itemtype := TItemType.Create;
  try
    itemtype.ObjectState := posCreate;
    gTiopfManager.DefaultOIDGenerator.AssignNextOID(itemtype.OID);
    itemtype.item_type_name := edtDescription.text;
    itemtype.item_type_index := DMS.GetNextOrderTypeIndex;
    itemtype.Save;
  finally
    itemtype.Free;
  end;
end;

function TfrmAddNewItemType.IsValid: boolean;
begin
     result:=true;
end;

function TfrmAddNewItemType.CustomCaption: string;
begin
  result:='Add a new Item Type';
end;

end.

