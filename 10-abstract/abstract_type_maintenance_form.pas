unit abstract_type_maintenance_form;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ActnList, Menus, Buttons, abstract_form, mapper, tiObject, tiModelMediator, TIOPFManager;

type

  { TfrmAbstractTypeMaintenance }

  TfrmAbstractTypeMaintenance = class(TBaseForm)
    acAdd: TAction;
    acDelete: TAction;
    acModify: TAction;
    acMoveDown: TAction;
    acMoveUp: TAction;
    ActionList1: TActionList;
    lstTypes: TListBox;
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
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    procedure acAddExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acModifyExecute(Sender: TObject);
    procedure acMoveDownExecute(Sender: TObject);
    procedure acMoveUpExecute(Sender: TObject);
    procedure lstTypesClick(Sender: TObject);
  protected
   fMediator: TtiModelMediator;
   fList : TtiMappedFilteredObjectList;
   foid : string;
   procedure ShowAddForm; virtual; abstract;

   procedure ShowModifyForm(aoid: string); virtual; abstract;
   procedure SetTypeIndex(atypeindex : integer; avalue : integer); virtual; abstract;
   function GetTypeIndex(atypeindex : integer): integer; virtual; abstract;
   procedure listsave(aList: TtiMappedFilteredObjectList); virtual; abstract;
  public
    procedure refresh; virtual; abstract;
    procedure CreateList; virtual; abstract;
    procedure SetupMediators;
    procedure ConfigureForm; virtual; abstract;
    procedure AddMediatorProperties; virtual; abstract;
    procedure AddMediatorSubject; virtual; abstract;
    constructor create(TheOwner: TComponent; aoid : string);
  end;

var
  frmAbstractTypeMaintenance: TfrmAbstractTypeMaintenance;

implementation

{$R *.lfm}

uses
  tiMediators
  , tiListMediators;

{ TfrmAbstractTypeMaintenance }

procedure TfrmAbstractTypeMaintenance.acAddExecute(Sender: TObject);
var
  a : integer;
begin
  a:= lstTypes.ItemIndex;
  try
      ShowAddForm;
  finally
    refresh;
    lstTypes.ItemIndex:=a;
    self.lstTypesClick(self);
  end;
end;

procedure TfrmAbstractTypeMaintenance.acDeleteExecute(Sender: TObject);
begin
  fList.Items[lstTypes.ItemIndex].Deleted := True;
  listsave(flist);
  refresh;
end;

procedure TfrmAbstractTypeMaintenance.acModifyExecute(Sender: TObject);
var
  lindex : integer;
begin
  lindex:= lstTypes.ItemIndex;
  try
    ShowModifyForm(fList.Items[
      lstTypes.ItemIndex].OID.AsString);
  finally
    refresh;
    lstTypes.ItemIndex:=lindex;
    self.lstTypesClick(self);
  end;
end;

procedure TfrmAbstractTypeMaintenance.acMoveDownExecute(Sender: TObject);
var
  lstboxIndex,itemindex,nextitemindex : integer;
begin
  lstboxIndex:=lstTypes.ItemIndex;
  try
    begin
      itemindex := GetTypeIndex(lstboxIndex);
      nextitemindex := GetTypeIndex(lstboxIndex + 1);
      //showmessage(inttostr(lstboxIndex)+':'+inttostr(itemindex)+':'+inttostr(nextitemindex));
      flist.Items[lstboxIndex].ObjectState := posUpdate;
      SetTypeIndex(lstboxIndex,nextitemindex);
      //flist.Items[aindex].index := b;
      flist.Items[lstboxIndex + 1].ObjectState := posUpdate;
      SetTypeIndex(lstboxIndex+1,itemindex);
      //flist.Items[aindex - 1].index := a;
      listsave(flist);
      Refresh;
    end;
  finally
    lstTypes.ItemIndex:=lstboxIndex+1;
  end;
end;

procedure TfrmAbstractTypeMaintenance.acMoveUpExecute(Sender: TObject);
var
  lstboxIndex,itemindex,previousitemindex : integer;
begin
  lstboxIndex:=lstTypes.ItemIndex;
  try
    begin
      itemindex := GetTypeIndex(lstboxIndex);
      previousitemindex := GetTypeIndex(lstboxIndex - 1);
      //showmessage(inttostr(a)+':'+inttostr(b));
      flist.Items[lstboxIndex].ObjectState := posUpdate;
      SetTypeIndex(lstboxIndex,previousitemindex);
      //flist.Items[aindex].index := b;
      flist.Items[lstboxIndex - 1].ObjectState := posUpdate;
      SetTypeIndex(lstboxIndex-1,itemindex);
      //flist.Items[aindex - 1].index := a;
      listsave(flist);
      Refresh;
    end;
  finally
    lstTypes.ItemIndex:=lstboxIndex-1;
  end;
end;

procedure TfrmAbstractTypeMaintenance.lstTypesClick(Sender: TObject);
begin

end;

procedure TfrmAbstractTypeMaintenance.SetupMediators;
begin
     if not Assigned(FMediator) then
  begin
    FMediator := TtiModelMediator.Create(self);
    AddMediatorProperties;

    //FOrderTypeMediator.AddProperty('order_type_name', edtDescription);
    //FOrderTypeMediator.AddComposite('order_description(600);order_status(150)', sgOrders);
    //FOrderMediator.AddComposite('', sgOrders);
  end;

  AddMediatorSubject;
  FMediator.Active := True;
end;

constructor TfrmAbstractTypeMaintenance.create(TheOwner: TComponent;
  aoid: string);
begin
  inherited create(TheOwner);
  self.foid :=aoid;
  CreateList;
  ConfigureForm;
  SetupMediators;
end;

initialization
  RegisterFallBackMediators;
  RegisterFallBackListmediators;
end.

