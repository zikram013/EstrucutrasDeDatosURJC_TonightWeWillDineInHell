unit uelemento;

interface

TYPE
  TElemento = integer;

  PROCEDURE Asignar(valueIn: TElemento; VAR valueOut: TElemento);
  FUNCTION EsIgual(v1,v2: TElemento):boolean;

implementation

  PROCEDURE Asignar(valueIn: TElemento; VAR valueOut: TElemento);
  begin
    valueOut := valueIn;
  end;

  FUNCTION EsIgual(v1,v2: TElemento):boolean;
  BEGIN
    EsIgual := v1 = v2;
  end;

end.
