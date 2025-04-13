unit abstract_form;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin, Grids,
  EditBtn, Buttons;

type

  { TBaseForm }

  TBaseForm = class(TForm)
  private
    procedure refresh; virtual; abstract;
    procedure refreshdata; virtual, abstract;
  public
  end;

implementation

end.

