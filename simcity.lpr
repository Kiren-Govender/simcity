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
  uConnectionUtil, Forms, tachartlazaruspkg, DMService,
  app_service, mainform, simcity_data_facade,
  simcity_facade, items, Orders, form_add_new_item, form_update_item,
  uDarkStyleParams, uDarkStyleSchemes, uMetaDarkStyle, form_maintain_item_types,
  form_add_new_order, form_maintain_order_types, abstract_form ;

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


  Application.Run;
end.

