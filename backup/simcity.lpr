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
  uConnectionUtil, Forms, mainform, simcity_data_facade, simcity_facade, items,
  form_add_new_item, form_update_item,
  uDarkStyleParams,
  uDarkStyleSchemes,
  uMetaDarkStyle,
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;

  { - DARK MODE START - }
  // By default this is set to pamForceLight
  PreferredAppMode := pamForceDark;
  // This doesn't work if the above is set to pamForceLight
  uMetaDarkStyle.ApplyMetaDarkStyle(DefaultDark);
  { -  DARK MODE END  - }


  Application.{%H-}MainFormOnTaskbar:=True;
  ConnectToDatabase('simcity.db','','','');
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tfrm_add_new_item, frm_add_new_item);
  Application.CreateForm(Tfrm_update_item, frm_update_item);
  Application.Run;
end.

