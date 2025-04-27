unit form_maintain_order_types;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  Menus, ActnList, DMService, tiObject, tiModelMediator;

type

  { TfrmMaintainOrderTypes }

  TfrmMaintainOrderTypes = class(TForm)
    acAdd: TAction;
    acModify: TAction;
    acDelete: TAction;
    acMoveUp: TAction;
    acMoveDown: TAction;
    ActionList1: TActionList;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    ListBox1: TListBox;
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
    procedure acAddExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acModifyExecute(Sender: TObject);
    procedure acMoveDownExecute(Sender: TObject);
    procedure acMoveUpExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
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
  ,tiListMediators
 ;

{ TfrmMaintainOrderTypes }

procedure TfrmMaintainOrderTypes.Button1Click(Sender: TObject);
begin
  //showmessage('Saving Order Type');
  DMS.SaveOrderType(edit1.text);
  refresh;
end;

procedure TfrmMaintainOrderTypes.acAddExecute(Sender: TObject);
begin

end;

procedure TfrmMaintainOrderTypes.acDeleteExecute(Sender: TObject);
begin

end;

procedure TfrmMaintainOrderTypes.acModifyExecute(Sender: TObject);
begin

end;

procedure TfrmMaintainOrderTypes.acMoveDownExecute(Sender: TObject);
begin

end;

procedure TfrmMaintainOrderTypes.acMoveUpExecute(Sender: TObject);
begin

end;

procedure TfrmMaintainOrderTypes.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
    CloseAction:=cafree;
end;

procedure TfrmMaintainOrderTypes.FormCreate(Sender: TObject);
begin
     refresh;
     SetupMediators;
end;

procedure TfrmMaintainOrderTypes.refresh;
begin
  DMS.OrderTypesToListBox(ListBox1);
end;

procedure TfrmMaintainOrderTypes.SetupMediators;
begin

end;

initialization
  RegisterFallBackMediators;
  RegisterFallBackListmediators;

end.

