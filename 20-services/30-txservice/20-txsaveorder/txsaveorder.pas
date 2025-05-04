unit txSaveOrder;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, abstracttxscript;

type

  { TTxSaveOrder }

  TTxSaveOrder = class(TBaseTxScript)
  private
    procedure InitialiseScript; override;
    procedure FinaliseScript; override;
  public

  end;

implementation

{ TTxSaveOrder }

procedure TTxSaveOrder.InitialiseScript;
begin

end;

procedure TTxSaveOrder.FinaliseScript;
begin

end;

end.
