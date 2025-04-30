unit form_add_new_order_type;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Orders, tiObject, TIOPFManager, dmservice;

type

  { TfrmAddNewOrderType }

  TfrmAddNewOrderType = class(TForm)
    btnSave: TButton;
    btnCancel: TButton;
    edtDescription: TEdit;
    Label1: TLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
  private

  public
    constructor Create(TheOwner: TComponent);
    function IsNameUnique: boolean;

  end;

var
  frmAddNewOrderType: TfrmAddNewOrderType;

implementation

{$R *.lfm}

{ TfrmAddNewOrderType }

procedure TfrmAddNewOrderType.edtDescriptionChange(Sender: TObject);
begin
  // Check if similar exists. If unique, then enable save.
  if DMS.IsOrderTypeNameUnique(edtDescription.text) then btnSave.Enabled := True;
end;

procedure TfrmAddNewOrderType.btnSaveClick(Sender: TObject);
var
  ordertype: TOrderType;
begin
  ordertype := TOrderType.Create;
  try
    ordertype.ObjectState := posCreate;
    gTiopfManager.DefaultOIDGenerator.AssignNextOID(ordertype.OID);
    ordertype.order_type_name := edtDescription.text;
    ordertype.order_type_index := DMS.GetNextOrderTypeIndex;
    ordertype.Save;
  finally
    ordertype.Free;
  end;
end;

procedure TfrmAddNewOrderType.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);

end;

function TfrmAddNewOrderType.IsNameUnique: boolean;
var
  fOrder_type_list: TOrderTypeList;
begin
  try
    fOrder_type_list := TOrderTypeList.Create;
    fOrder_type_list.FindUniqueItemName(edtDescription.Text);
  finally
    Result := fOrder_type_list.Count = 0;
    fOrder_type_list.Free;
  end;
end;

end.
