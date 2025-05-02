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
  uConnectionUtil, Forms, tachartlazaruspkg, DMService, app_service,
  simcity_data_facade, simcity_facade, items, form_update_item,
  uDarkStyleParams, uDarkStyleSchemes, uMetaDarkStyle,
  form_add_new_order, form_maintain_order_types, mainform,
  form_maintain_item_types, abstract_form, abstract_type_maintenance_form,
  form_add_new_order_type, form_modify_order_type,
  test_abstract_type_maintenance_form, abstract_type_maintenance_addtype_form,
  form_add_new_item_type, abstract_type_maintenance_modifytype_form,
  form_modify_item_type, Orders, form_add_new_item_new ;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  ConnectToDatabase('simcity.db','','','');
  { - DARK MODE START - }
  // By default this is set to pamForceLight
  PreferredAppMode := pamForceDark;
  // This doesn't work if the above is set to pamForceLight
  uMetaDarkStyle.ApplyMetaDarkStyle(DefaultDark);
  { -  DARK MODE END  - }


  Application.{%H-}MainFormOnTaskbar:=True;

  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

