unit form_add_new_item;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, TiopfManager, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Spin, EditBtn, Buttons, items, tiObject, tiModelMediator;

type

  { Tfrm_add_new_item }

  Tfrm_add_new_item = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    edtItemName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    seditOnHand: TSpinEdit;
    seRequired: TSpinEdit;
    SpeedButton1: TSpeedButton;
    teProductionTime: TTimeEdit;
    procedure acMaintainItemTypesExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure SaveItem;
    procedure SetupMediators;
  public

  end;

var
  frm_add_new_item: Tfrm_add_new_item;

implementation

{$R *.lfm}

uses
  simcity_facade
  ,tiMediators
  ,tiListMediators
 ;

{ Tfrm_add_new_item }

procedure Tfrm_add_new_item.Button1Click(Sender: TObject);
begin
  SaveItem;
end;

procedure Tfrm_add_new_item.acMaintainItemTypesExecute(Sender: TObject);
begin

end;

procedure Tfrm_add_new_item.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseAction:=cafree;
end;

procedure Tfrm_add_new_item.FormCreate(Sender: TObject);
begin
  SetupMediators;
end;

procedure Tfrm_add_new_item.Label4Click(Sender: TObject);
begin

end;

procedure Tfrm_add_new_item.SpeedButton1Click(Sender: TObject);
//var
//  ui : TUI_Facade;
begin
//  ui := TUI_Facade.create;
//  ui.maintain_item_types;

end;

procedure Tfrm_add_new_item.SaveItem;
var
  item: TItem;
begin
  item:=TItem.Create;
  item.ObjectState:=posCreate;
  gTiopfManager.DefaultOIDGenerator.AssignNextOID(item.OID);
  item.item_name:=edtItemName.text;
  item.item_onhand:=seditOnHand.Value;
  item.item_required:=seRequired.Value;
  item.item_production_time:=teProductionTime.Time;
  item.save;
  self.close;
end;

procedure Tfrm_add_new_item.SetupMediators;
begin

end;

initialization
  RegisterFallBackMediators;
  RegisterFallBackListmediators;

end.

