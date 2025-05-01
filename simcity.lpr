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
  form_add_new_order, form_maintain_order_types, abstract_form, 
form_add_new_order_type, form_modify_order_type, 
abstract_type_maintenance_form, test_abstract_type_maintenance_form, 
abstract_type_maintenance_addtype_form, form_add_new_item_type, 
abstract_type_maintenance_modifytype_form, form_modify_item_type ;

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
  Application.CreateForm(TfrmAddNewOrderType, frmAddNewOrderType);
  Application.CreateForm(TfrmModifyOrderType, frmModifyOrderType);
  Application.CreateForm(TfrmAbstractTypeMaintenance, frmAbstractTypeMaintenance
    );
  Application.CreateForm(TfrmTestAbstractMaintenanceForm, 
    frmTestAbstractMaintenanceForm);
  Application.CreateForm(TfrmAbstractAddNewType, frmAbstractAddNewType);
  Application.CreateForm(TfrmAddNewItemType, frmAddNewItemType);
  Application.CreateForm(TfrmAbstractModifyType, frmAbstractModifyType);
  Application.CreateForm(TfrmModifyItemType, frmModifyItemType);
  Application.Run;
end.

