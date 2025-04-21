unit form_maintain_order_types;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  DMService, tiObject, tiModelMediator;

type

  { TfrmMaintainOrderTypes }

  TfrmMaintainOrderTypes = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    ListBox1: TListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
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

