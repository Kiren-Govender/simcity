unit txSaveOrder;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, abstracttxscript;

type

  TTxSaveOrder = class(TBaseTxScript)
  private
    procedure InitialiseScript; override;
    procedure FinaliseScript; override;
  public

  end;

implementation

end.
