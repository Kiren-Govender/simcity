unit abstracttxscript;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, tiObject;

type

  { TBaseTxScript }

  TBaseTxScript = class(TtiObject)
  private
    procedure InitialiseScript; virtual; abstract;
    procedure FinaliseScript; virtual; abstract;
  published
  public
    constructor Create;
    destructor Destroy;
  end;

implementation

{ TBaseTxScript }

constructor TBaseTxScript.Create;
begin
  inherited Create;
  self.InitialiseScript;
end;

destructor TBaseTxScript.Destroy;
begin
  self.FinaliseScript;
  inherited Destroy;
end;

end.
