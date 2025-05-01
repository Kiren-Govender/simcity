unit abstract_type_maintenance_addtype_form;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmAbstractAddNewType }

  TfrmAbstractAddNewType = class(TForm)
    btnCancel: TButton;
    btnSave: TButton;
    edtDescription: TEdit;
    Label1: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
  protected
    procedure SaveType; virtual; abstract;
    function IsValid: boolean; virtual; abstract;
    function CustomCaption: string; virtual; abstract;

  public
    Constructor Create(TheOwner: TComponent);
    Destructor Destroy;
  end;

var
  frmAbstractAddNewType: TfrmAbstractAddNewType;

implementation

{$R *.lfm}

{ TfrmAbstractAddNewType }

procedure TfrmAbstractAddNewType.btnSaveClick(Sender: TObject);
begin
  if IsValid then
  SaveType else
    showmessage('The type is not valid.');
end;

procedure TfrmAbstractAddNewType.btnCancelClick(Sender: TObject);
begin
  self.close;
end;

constructor TfrmAbstractAddNewType.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  // Allow descendant forms to change the form caption
  if CustomCaption<>'' then
  self.Caption:=CustomCaption;
end;

destructor TfrmAbstractAddNewType.Destroy;
begin
  inherited Destroy;
end;

end.

