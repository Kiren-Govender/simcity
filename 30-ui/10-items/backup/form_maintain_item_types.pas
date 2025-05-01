unit form_maintain_item_types;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ComCtrls, ActnList,abstract_type_maintenance_form, Items, mapper, DMService;

type

  { Tfrm_maintain_item_types }

  Tfrm_maintain_item_types = class(TfrmAbstractTypeMaintenance)
  protected
    procedure ShowAddForm; override;
    procedure ShowModifyForm(aoid: string); override;
    procedure SetTypeIndex(atypeindex : integer; avalue : integer); override;
    function GetTypeIndex(atypeindex : integer): integer; override;
    procedure listsave(aList: TtiMappedFilteredObjectList); override;
   public
     procedure refresh; override;
     procedure AddMediatorProperties; override;
     procedure AddMediatorSubject; override;
         procedure ConfigureForm;override;
         procedure CreateList; override;
  end;

var
  frm_maintain_item_types: Tfrm_maintain_item_types;

implementation

{$R *.lfm}

uses app_service;

{ Tfrm_maintain_item_types }

procedure Tfrm_maintain_item_types.ShowAddForm;
begin
  // Create the form

    { #todo : Create Add form for "form_maintain_item_types" }
  Showmessage('Still to create the form');
end;

procedure Tfrm_maintain_item_types.ShowModifyForm(aoid: string);
begin
  // Create the form
  { #todo : Create Modify form for "form_maintain_item_types" }
    Showmessage('Still to create the form');
end;

procedure Tfrm_maintain_item_types.SetTypeIndex(atypeindex: integer;
  avalue: integer);
begin
  TItemTypeList(fList).Items[atypeindex].item_type_index:=avalue;
  showmessage(inttostr(atypeindex)+':'+inttostr(avalue));
  //showmessage(inttostr(TItemTypeList(fList).Items[atypeindex].item_type_index));
end;

function Tfrm_maintain_item_types.GetTypeIndex(atypeindex: integer): integer;
begin
  result:=TItemTypeList(FList).Items[atypeindex].item_type_index;
end;

procedure Tfrm_maintain_item_types.listsave(aList: TtiMappedFilteredObjectList);
begin
  TItemTypeList(aList).Save;
end;

procedure Tfrm_maintain_item_types.refresh;
begin
  TItemTypeList(FList).GetAllSortedByIndex;
  TItemTypeList(FList).NotifyObservers;
end;

procedure Tfrm_maintain_item_types.AddMediatorProperties;
begin
  FMediator.AddProperty('item_type_name', lstTypes);
end;

procedure Tfrm_maintain_item_types.AddMediatorSubject;
begin
  FMediator.Subject := TItemTypeList(flist);
end;

procedure Tfrm_maintain_item_types.ConfigureForm;
begin
  self.Caption:='Maintain Item Types';
end;

procedure Tfrm_maintain_item_types.CreateList;
begin
  TItemTypeList(flist):=TItemTypeList.Create;
  TItemTypeList(flist).GetAllSortedByIndex;
end;

end.

