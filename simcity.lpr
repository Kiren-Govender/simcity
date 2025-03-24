program simcity;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  uConnectionUtil,
  Forms, mainform, items, simcity_facade, form_add_new_item
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.{%H-}MainFormOnTaskbar:=True;
  Application.Initialize;
  ConnecttoDatabase('simcity.db','','','');
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tfrm_add_new_item, frm_add_new_item);
  Application.Run;
end.

