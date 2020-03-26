UNIT uPila;
INTERFACE
	USES uElemento;
	TYPE 
		tPila= ^tNodo;
		tNodo = RECORD
			elemento:tElemento;
			siguiente:tPila;
		END;
PROCEDURE CrearPilaVacia( pila: tPila);
PROCEDURE Apilar ( pila:tPila; Elemento: tElemento);
PROCEDURE Cima(pila:tPila; VAR elemento: tElemento);
PROCEDURE DesApilar(pila:tPila);
FUNCTION EsPilaVacia ( pila:tPila):boolean;
PROCEDURE CopiarPila (VAR destino:tPila; origen:tPila);
PROCEDURE DestruirPila( VAR pila:tPila);
IMPLEMENTATION
PROCEDURE CrearPilaVacia(pila:tPila);
BEGIN
	pila:= NIL;
END;
PROCEDURE Apilar(pila:tPila; elemento:tElemento);
VAR
	pNuevo: tPila;
BEGIN
	new (pNuevo);
	AsignarElemento(pNuevo^.elemento, elemento);
	pNuevo^.siguiente:= pila;
	pila:= pNuevo;
END;
PROCEDURE Cima(pila:tPila; VAR elemento: tElemento);
BEGIN
	IF NOT EsPilaVacia (pila) THEN
		AsignarElemento(elemento,pila^.elemento);
END;
PROCEDURE DesApilar(pila:tPila);
VAR
	pAux:tPila;
BEGIN
	IF NOT EsPilaVacia(pila) THEN BEGIN
		pAux:= pila;
		pila:= pila^.siguiente;
		dispose(pAux);
	END;
END;
FUNCTION EsPilaVacia(pila:tPila):boolean;
BEGIN
	EsPilaVacia := pila = NIL;
END;
PROCEDURE CopiarPila (VAR destino:tPila; origen:tPila);
VAR
	pOrigen, pDestino: tPila;
	pNuevo:tPila;
BEGIN
	CrearPilaVacia(destino);
	pOrigen:= origen;
	WHILE (pOrigen<>NIL) DO BEGIN
		new(pNuevo);
		AsignarElemento(pNuevo^.elemento, pOrigen^.elemento);
		pNuevo^.siguiente:= NIL;
		IF EsPilaVacia(destino)THEN BEGIN
			destino:= pNuevo;
			pDestino:= destino;
		END
		ELSE BEGIN
			pDestino^.siguiente:= pNuevo;
			pDestino:= pNuevo;
		END;
		pOrigen:= pOrigen^.siguiente;
	END;
END;
PROCEDURE DestruirPila( VAR pila:tPila);
BEGIN
	WHILE NOT EsPilaVacia(pila) DO
		Desapilar(pila);
END;
END.
