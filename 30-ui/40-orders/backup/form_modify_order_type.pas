unit form_modify_order_type;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Orders, tiObject;

type

  { TfrmModifyOrderType }

  TfrmModifyOrderType = class(TForm)
    btnCancel: TButton;
    btnSave: TButton;
    edtDescription: TEdit;
    Label1: TLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
  private
    foid: string;
    forder_type : TOrderType;
  public
    constructor Create(TheOwner: TComponent; aoid: string);
    destructor Destroy;
    property loid: string read foid;
    procedure LoadOrderType;
  end;

var
  frmModifyOrderType: TfrmModifyOrderType;

implementation

{$R *.lfm}

{ TfrmModifyOrderType }

procedure TfrmModifyOrderType.edtDescriptionChange(Sender: TObject);
begin
  if edtDescription.text<>forder_type.order_type_name then
  begin
    btnSave.enabled:=true;
  end;
end;

procedure TfrmModifyOrderType.btnSaveClick(Sender: TObject);
begin
  forder_type.ObjectState:=posUpdate;
  forder_type.order_type_name:=edtDescription.text;
  forder_type.save;
end;

constructor TfrmModifyOrderType.Create(TheOwner: TComponent; aoid: string);
begin
  inherited Create(TheOwner);
  foid:=aoid;
  LoadOrderType;
end;

destructor TfrmModifyOrderType.Destroy;
begin
  forder_type.free;
  inherited Destroy;
end;

procedure TfrmModifyOrderType.LoadOrderType;
begin
  forder_type := TOrderType.create;
  forder_type.OID.AsString:=foid;
  forder_type.ObjectState:=posPK;
  forder_type.read;
  edtDescription.Text:=forder_type.order_type_name;
end;

end.
