unit uElementoChar;

interface

TYPE
  TElemento = char;

  PROCEDURE Asignar(valueIn: TElemento; VAR valueOut: TElemento);
  FUNCTION EsIgual(v1,v2: TElemento):boolean;
  function esMayor(v1,v2:TElemento):boolean;
  PROCEDURE CopiarElemento(VAR destino: TElemento; origen: TElemento);
  procedure MostrarElemento(elemento:TElemento);

implementation

  PROCEDURE Asignar(valueIn: TElemento; VAR valueOut: TElemento);
  begin
    valueOut := valueIn;
  end;

  FUNCTION EsIgual(v1,v2: TElemento):boolean;
  BEGIN
    EsIgual := v1 = v2;
  end;


	function esMayor(v1,v2:TElemento):boolean;
	begin
		esMayor:=v1>v2;
	end;

	PROCEDURE CopiarElemento(VAR destino: TElemento; origen: TElemento);
	BEGIN
		destino := origen;
	END;

procedure MostrarElemento(elemento:TElemento);
begin
	write(elemento);
end;
end.
