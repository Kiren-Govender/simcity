unit form_maintain_order_types;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  Menus, ActnList, ComCtrls, DMService, tiObject, tiModelMediator, Orders, TIOPFManager;

type

  { TfrmMaintainOrderTypes }

  TfrmMaintainOrderTypes = class(TForm)
    acAdd: TAction;
    acModify: TAction;
    acDelete: TAction;
    acMoveUp: TAction;
    acMoveDown: TAction;
    ActionList1: TActionList;
    btnSave: TButton;
    btnCancel: TButton;
    edtDescription: TEdit;
    Label1: TLabel;
    lstOrderTypes: TListBox;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    PopupMenu1: TPopupMenu;
    Separator1: TMenuItem;
    Separator2: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure acAddExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acModifyExecute(Sender: TObject);
    procedure acMoveDownExecute(Sender: TObject);
    procedure acMoveUpExecute(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lstOrderTypesClick(Sender: TObject);
  private
    FOrderTypeMediator: TtiModelMediator;
    FOrderTypeNameMEdiator: TtiModelMediator;
    fOrderType: TOrderType;
    procedure refresh;
    procedure SetupMediators;
  public

  end;

var
  frmMaintainOrderTypes: TfrmMaintainOrderTypes;

implementation

{$R *.lfm}

uses
  tiMediators
  , app_service
  , tiListMediators;

  { TfrmMaintainOrderTypes }

procedure TfrmMaintainOrderTypes.btnSaveClick(Sender: TObject);
begin
  fOrderType.objectstate := posUpdate;
  fOrderType.order_type_name := edtDescription.Text;
  fOrderType.save;

  //if fOrderType.order_type_name = edtDescription.Text;
  DMS.RefreshOrderTypeList;
  DMS.OrderTypeList.NotifyObservers;
end;

procedure TfrmMaintainOrderTypes.acAddExecute(Sender: TObject);
begin
  DMAPP.add_new_order_type;
  // There is an error in the logic where the uniqueness of the order_type_name is not checked
  {if assigned(fOrderType) then
    fOrderType.Free;
  fOrderType := TOrderType.Create;
  edtDescription.Clear;
  edtDescription.SetFocus;
  fOrderType.objectstate := posCreate;
  gTiopfManager.DefaultOIDGenerator.AssignNextOID(fOrderType.OID);
  fOrderType.order_type_name := edtDescription.Text;
  fOrderType.save;

  DMS.RefreshOrderTypeList;
  DMS.OrderTypeList.NotifyObservers; }
end;

procedure TfrmMaintainOrderTypes.acDeleteExecute(Sender: TObject);
begin
  DMS.OrderTypeList.Items[lstOrderTypes.ItemIndex].Deleted := True;
  DMS.OrderTypeList.Save;
  DMS.RefreshOrderTypeList;
  DMS.OrderTypeList.NotifyObservers;
end;

procedure TfrmMaintainOrderTypes.acModifyExecute(Sender: TObject);
var
  a : integer;
begin
  {fOrderType.objectstate := posUpdate;
  fOrderType.order_type_name := edtDescription.Text;
  fOrderType.save;
  DMS.RefreshOrderTypeList;
  DMS.OrderTypeList.NotifyObservers;}
  a:= lstOrderTypes.ItemIndex;
  try
    DMAPP.modify_order_type(DMS.OrderTypeList.Items[
      lstOrderTypes.ItemIndex].OID.AsString);
  finally
    DMS.RefreshOrderTypeList;
    lstOrderTypes.ItemIndex:=a;
    self.lstOrderTypesClick(self);
  end;
end;

procedure TfrmMaintainOrderTypes.acMoveDownExecute(Sender: TObject);
var
  a : integer;
begin
  a:=lstOrderTypes.ItemIndex;
  try
    DMS.OrderTypeIndex_down(a);
  finally
    lstOrderTypes.ItemIndex:=a+1;
  end;
end;

procedure TfrmMaintainOrderTypes.acMoveUpExecute(Sender: TObject);
var
  a : integer;
begin
  a:=lstOrderTypes.ItemIndex;
  try
    DMS.OrderTypeIndex_up(a);
  finally
    lstOrderTypes.ItemIndex:=a-1;
  end;
end;

procedure TfrmMaintainOrderTypes.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DMS.RefreshOrderTypeList;
  fOrderType.Free;
  CloseAction := cafree;
end;

procedure TfrmMaintainOrderTypes.FormCreate(Sender: TObject);
begin
  DMS.OrderTypeList.GetAllSortedByIndex;
  fOrderType := TOrderType.Create;
  SetupMediators;
  DMS.RefreshOrderTypeList;
  DMS.OrderTypeList.NotifyObservers;
  lstORderTypes.ItemIndex := 0;
  self.lstOrderTypesClick(self);
end;

procedure TfrmMaintainOrderTypes.FormShow(Sender: TObject);
begin
  edtDescription.SetFocus;
end;

procedure TfrmMaintainOrderTypes.lstOrderTypesClick(Sender: TObject);
begin
  fOrderType.ObjectState := posPK;
  fOrderType.OID.AsString :=
    DMS.OrderTypeList.Items[lstordertypes.ItemIndex].OID.AsString;
  fOrderType.Read;
end;

procedure TfrmMaintainOrderTypes.refresh;
begin
  DMS.RefreshOrderTypeList;
  DMS.OrderTypeList.NotifyObservers;
end;

procedure TfrmMaintainOrderTypes.SetupMediators;
begin
  if not Assigned(FOrderTypeMediator) then
  begin
    FOrderTypeMediator := TtiModelMediator.Create(self);
    FORderTypeMediator.AddProperty('order_type_name', lstOrderTypes);
    //FOrderTypeMediator.AddProperty('order_type_name', edtDescription);
    //FOrderTypeMediator.AddComposite('order_description(600);order_status(150)', sgOrders);
    //FOrderMediator.AddComposite('', sgOrders);
  end;
  FOrderTypeMediator.Subject := DMS.OrderTypeList;
  FOrderTypeMediator.Active := True;

  if not Assigned(FOrderTypeNameMEdiator) then
  begin
    FOrderTypeNameMEdiator := TtiModelMediator.Create(self);
    FOrderTypeNameMEdiator.AddProperty('order_type_name', edtDescription);
    //FOrderTypeMediator.AddComposite('order_description(600);order_status(150)', sgOrders);
    //FOrderMediator.AddComposite('', sgOrders);
  end;
  FOrderTypeNameMEdiator.Subject := fOrderType;
  FOrderTypeNameMEdiator.Active := True;
end;

initialization
  RegisterFallBackMediators;
  RegisterFallBackListmediators;

end.
