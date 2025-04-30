unit test_abstract_type_maintenance_form;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs
  ,abstract_type_maintenance_form, Orders, mapper, DMService;

type

  { TfrmTestAbstractMaintenanceForm }

  TfrmTestAbstractMaintenanceForm = class(TfrmAbstractTypeMaintenance)
  protectec
    procedure ShowAddForm; override;
    procedure ShowModifyForm(aoid: string); override;
    procedure SetTypeIndex(atypeindex : integer; avalue : integer); override;
    function GetTypeIndex(atypeindex : integer): integer; override;
    procedure listsave(aList: TtiMappedFilteredObjectList); override;
   public
     procedure refresh; override;
     procedure AddMediatorProperties; override;
     procedure AddMediatorSubject; override;
         procedure CreateList; override;
  end;

var
  frmTestAbstractMaintenanceForm: TfrmTestAbstractMaintenanceForm;

implementation

uses app_service;

{$R *.lfm}

{ TfrmTestAbstractMaintenanceForm }

procedure TfrmTestAbstractMaintenanceForm.ShowAddForm;
begin
  DMAPP.add_new_order_type;
end;

procedure TfrmTestAbstractMaintenanceForm.ShowModifyForm(aoid: string);
begin
  DMAPP.modify_order_type(aoid);
end;

procedure TfrmTestAbstractMaintenanceForm.SetTypeIndex(atypeindex: integer; avalue: integer);
begin
  TOrderTypeList(fList).Items[atypeindex].order_type_index:=avalue;
end;

function TfrmTestAbstractMaintenanceForm.GetTypeIndex(atypeindex: integer): integer;
begin
  result:=TOrderTypeList(FList).Items[atypeindex].order_type_index;
end;

procedure TfrmTestAbstractMaintenanceForm.listsave(aList: TtiMappedFilteredObjectList);
begin
  TOrderTypeList(FList).Save;
end;

procedure TfrmTestAbstractMaintenanceForm.refresh;
begin
  TOrderTypeList(FList).GetAllSortedByIndex;
  TOrderTypeList(FList).NotifyObservers;
end;

procedure TfrmTestAbstractMaintenanceForm.AddMediatorProperties;
begin
  FMediator.AddProperty('order_type_name', lstTypes);
end;

procedure TfrmTestAbstractMaintenanceForm.AddMediatorSubject;
begin
  FMediator.Subject := TOrderTypeList(flist);
end;

procedure TfrmTestAbstractMaintenanceForm.CreateList;
begin
  TOrderTypeList(flist):=TOrderTypeList.Create;
  TOrderTypeList(flist).GetAllSortedByIndex;
end;

end.

