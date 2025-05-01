unit form_modify_item_type;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs
  , abstract_type_maintenance_modifytype_form
  , items
  , tiObject
  ;

type

  { TfrmModifyItemType }

  TfrmModifyItemType = class(TfrmAbstractModifyType)
  private
  protected
    public
    procedure LoadType; override;
        procedure SaveItemType; override;

  end;

var
  frmModifyItemType: TfrmModifyItemType;

implementation

{$R *.lfm}

{ TfrmModifyItemType }



procedure TfrmModifyItemType.LoadType;
begin
  ftype := TItemType.create;
  ftype.OID.AsString:=foid;
  ftype.ObjectState:=posPK;
  TItemType(ftype).Read;
  self.typename:=TItemType(ftype).item_type_name;
end;

procedure TfrmModifyItemType.SaveItemType;
begin

end;

end.

