UNIT uElemento;

INTERFACE
	CONST
		MIN = 1;
		MAX = 20;

	TYPE
		TElemento = MIN..MAX;

	PROCEDURE CopiarElemento(VAR destino: TElemento; origen: TElemento);
	FUNCTION EsMenorElemento(elemento1: TElemento; elemento2: TElemento): boolean;
	FUNCTION EsMenorOIgualElemento(elemento1: TElemento; elemento2: TElemento): boolean;
	FUNCTION SonElementosIguales(elemento1: TElemento; elemento2: TElemento): boolean;
	FUNCTION EsMayorElemento(elemento1: TElemento; elemento2: TElemento): boolean;
	PROCEDURE MostrarElemento(elemento: TElemento);
IMPLEMENTATION
	PROCEDURE CopiarElemento(VAR destino: TElemento; origen: TElemento);
	BEGIN
		destino := origen;
	END;

	FUNCTION EsMenorElemento(elemento1: TElemento; elemento2: TElemento): boolean;
	BEGIN
		EsMenorElemento := elemento1 < elemento2;
	END;

	FUNCTION EsMenorOIgualElemento(elemento1: TElemento; elemento2: TElemento): boolean;
	BEGIN
		EsMenorOIgualElemento := elemento1 <= elemento2;
	END;

	FUNCTION SonElementosIguales(elemento1: TElemento; elemento2: TElemento): boolean;
	BEGIN
		SonElementosIguales := elemento1 = elemento2;
	END;

	FUNCTION EsMayorElemento(elemento1: TElemento; elemento2: TElemento): boolean;
	BEGIN
		EsMayorElemento := elemento1 > elemento2;
	END;

	PROCEDURE MostrarElemento(elemento: TElemento);
	BEGIN
		write(elemento);
	END;
END.
