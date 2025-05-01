unit abstract_type_maintenance_modifytype_form;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, tiObject;

type

  { TfrmAbstractModifyType }

  TfrmAbstractModifyType = class(TForm)
    btnCancel: TButton;
    btnSave: TButton;
    edtDescription: TEdit;
    Label1: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
  private

  protected
    foid: string;
    ftypename: string;
    ftype : TtiObject;
    procedure settypename(AValue: string);
  public
    constructor Create(TheOwner: TComponent; aoid: string);
    destructor Destroy;
    property loid: string read foid;
    property typename : string read ftypename write settypename;
    procedure LoadType; virtual; abstract;
    procedure SaveItemType; virtual; abstract;
  end;

var
  frmAbstractModifyType: TfrmAbstractModifyType;

implementation

{$R *.lfm}

{ TfrmAbstractModifyType }

procedure TfrmAbstractModifyType.edtDescriptionChange(Sender: TObject);
begin
    if edtDescription.text<>typename then
  begin
    btnSave.enabled:=true;
  end;
end;

procedure TfrmAbstractModifyType.btnSaveClick(Sender: TObject);
begin
  SaveItemType;
end;

procedure TfrmAbstractModifyType.btnCancelClick(Sender: TObject);
begin
  self.close;
end;

procedure TfrmAbstractModifyType.settypename(AValue: string);
begin
  self.ftypename:=AValue;
end;

constructor TfrmAbstractModifyType.Create(TheOwner: TComponent; aoid: string);
begin
    inherited Create(TheOwner);
    foid:=aoid;
    LoadType;
end;

destructor TfrmAbstractModifyType.Destroy;
begin
    ftype.free;
    inherited Destroy;
end;

end.

