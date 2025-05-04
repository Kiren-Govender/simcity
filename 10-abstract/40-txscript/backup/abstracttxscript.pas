unit abstracttxscript;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,tiObject;

type

  { TBaseTxScript }

  TBaseTxScript = class(TtiObject)
  private
        procedure InitialiseScript; virtual; abstract;
    procedure FinaliseScript; virtual; abstract;
  published
  public

    constructor Create;
    Destructor Destroy;
  end;

implementation

{ TBaseTxScript }

constructor TBaseTxScript.Create;
begin
  inherited create;
  self.InitialiseScript;
end;

destructor TBaseTxScript.Destroy;
begin
  self.FinaliseScript;
  inherited destroy;
end;

end.

