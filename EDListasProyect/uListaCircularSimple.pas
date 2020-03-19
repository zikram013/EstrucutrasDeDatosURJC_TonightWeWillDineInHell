UNIT uListaCircularSimple;
INTERFACE
	USES uElemento;
	TYPE
		tLista = ^tNodo;
		tNodo = RECORD
			elemento: tElemento;
			siguiente: tLista;
		END;
	PROCEDURE CrearListaVacia(VAR lista:tLista);
	PROCEDURE Construir (VAR lista:tLista; elem:tElemento);
	PROCEDURE Primero (lista:tLista; VAR elem:tElemento);
	PROCEDURE Resto (lista:tLista; VAR res:tLista);
	FUNCTION EsListaVacia (lista:tLista):boolean;
	FUNCTION Longitud(lista:tLista):integer;
	PROCEDURE Ultimo(lista: tLista; VAR elemento: tElemento);
	FUNCTION Pertenece(lista: tLista; elemento: tElemento):boolean;
	FUNCTION SonListasIguales(l1,l2:tLista):boolean;
	PROCEDURE BorrarElemento(VAR lista:tLista; elemento: tElemento);
	PROCEDURE InsertarFinal( VAR lista: tLista; elemento: tElemento);
	PROCEDURE CopiarLista (origen:tLista; VAR destino:tLista);
	PROCEDURE Concatenar(l1,l2:tLista; VAR res:tLista);
IMPLEMENTATION
PROCEDURE CrearListaVacia (VAR lista:tLista);
	BEGIN
		lista:= nil;
	END;
PROCEDURE Construir (VAR lista:tLista; elem:tElemento);
VAR
	pNuevo: tLista;
BEGIN
	new(pNuevo);
	AsignarElemento(pNuevo^.elemento,elem);
	IF(EsListaVacia(lista)) THEN
		lista:=pNuevo
	ELSE 
		pNuevo^.siguiente:=lista^.siguiente;
	lista^.siguiente:= pNuevo;
END;
PROCEDURE Primero(lista:tLista; VAR elem:tElemento);
BEGIN
	IF NOT EsListaVacia(lista)THEN
		AsignarElemento(elem,lista^.siguiente^.elemento);
END;
PROCEDURE Resto(lista:tLista;VAR res:tLista);
VAR
	pAux:tLista;
BEGIN
	IF Not EsListaVacia(lista) THEN BEGIN	//se puede hacer con copiar lista, primero y borrar Elemento
		CopiarLista(lista,res);
		pAux:=res^.siguiente;
		IF pAux = res THEN
			res:= NIL
		ELSE 
			res^.siguiente:= pAux^.siguiente;
		dispose(pAux);
	END;
END;
FUNCTION EsListaVacia(lista:tLista): boolean;
BEGIN
	EsListaVacia:= lista = NIL;
END;
FUNCTION Longitud(lista:tLista):integer;
VAR
	contador:integer;
	pAux:tLista;
BEGIN
	contador:= 0;
	IF NOT EsListaVacia(lista) THEN BEGIN
		pAux:= lista^.siguiente;
		REPEAT 
			contador:= contador + 1;
			pAux:= pAux^.siguiente;
		UNTIL pAux = lista^.siguiente;
	END;
	Longitud:= contador; 
END;
PROCEDURE Ultimo(lista: tLista; VAR elemento:tElemento);
BEGIN
	IF NOT EsListaVacia(lista) THEN
		AsignarElemento(elemento,lista^.elemento);
END;
FUNCTION Pertenece(lista: tLista; elemento: tElemento): boolean;
VAR
	encontrado:boolean;
	pAux:tLista;
BEGIN
	encontrado:= FALSE;
	IF NOT EsListaVacia(lista) THEN BEGIN
		pAux:= lista^.siguiente;
		REPEAT
			encontrado:= SonElementosIguales(elemento,pAux^.elemento);
			IF NOT encontrado THEN
				pAux:= pAux^.siguiente;
		UNTIL (encontrado) OR (pAux = lista^.siguiente);
	END;
	Pertenece:= encontrado;
END;
FUNCTION SonListasIguales(l1,l2:tLista):boolean;
VAR
	sonIguales:boolean;
	pAux1,pAux2:tLista;
BEGIN
	IF(NOT EsListaVacia(l1)) AND (NOT EsListaVacia (l2)) THEN BEGIN
		sonIguales := TRUE;
		pAux1:= l1^.siguiente;
		pAux2:= l2^.siguiente;
		REPEAT
			sonIguales := SonElementosIguales (pAux1^.elemento, pAux2^.elemento);
			pAux1:= pAux1^.siguiente;
			pAux2:= pAux2^.siguiente;
		UNTIL ( NOT sonIguales) OR ( pAux1 = l1^.siguiente) OR ( pAux2 = l2^.siguiente);
	END
	ELSE
		sonIguales:= FALSE;
	SonListasIguales:= sonIguales;
END;
PROCEDURE BorrarElemento(VAR lista:tLista; elemento:tElemento);
VAR
	pAnt,pExplorador:tLista;
	encontrado:boolean;
BEGIN
	encontrado:= FALSE;
	IF NOT EsListaVacia(lista) THEN BEGIN
		pAnt:= NIL;
		pExplorador:= lista^.siguiente;
		WHILE (NOT encontrado) AND (pAnt <>lista) DO BEGIN
			encontrado:= sonElementosIguales (elemento, pExplorador ^.elemento);
			IF NOT encontrado THEN BEGIN
				pAnt:= pExplorador;
				pExplorador:= pExplorador^.siguiente;
			END;
		END;
		IF encontrado THEN BEGIN
			IF pAnt = NIL THEN
				IF pExplorador = lista THEN
					lista:= NIL
				ELSE
					lista^.siguiente := pExplorador^.siguiente
			ELSE BEGIN
				pAnt^.siguiente := pExplorador^.siguiente;
				IF pExplorador = lista THEN
					lista:= pAnt;
				END;
			dispose(pExplorador);
		END;
	END;
END;
PROCEDURE InsertarFinal(VAR lista: tLista; elemento:tElemento);
VAR
	pNuevo:tLista;
BEGIN
	IF EsListaVacia( lista) THEN
		Construir(lista, elemento)
	ELSE BEGIN
		new (pNuevo);
		AsignarElemento(pNuevo^.elemento,elemento);
		pNuevo^.siguiente:=lista^.siguiente;
		lista^.siguiente:= pNuevo;
		lista:= pNuevo;
	END;
END;
PROCEDURE CopiarLista(origen:tLista; VAR destino:tLista);
VAR
	pOrigen, pDestino:tLista;
	pNuevo: tLista;
BEGIN
	CrearListaVacia(destino);
	pDestino:= NIL;
	IF NOT EsListaVacia (origen) THEN BEGIN
		pOrigen:= origen^.siguiente;
		REPEAT 
			IF EsListaVacia(destino) THEN BEGIN
				Construir(destino,pOrigen^.elemento);
				pDestino:= pDestino^.siguiente;
			END
			ELSE BEGIN
				new(pNuevo);
				AsignarElemento(pNuevo^.elemento,pOrigen^.elemento);
				pNuevo^.siguiente:= destino^.siguiente;
				pDestino^.siguiente:=pNuevo;
				destino:= pNuevo;
				pDestino:= pDestino^.siguiente;
			END;
			
			pOrigen:= pOrigen^.siguiente;
		UNTIL pOrigen = pOrigen^.siguiente;
	END;
END;
PROCEDURE Concatenar(l1,l2:tLista; VAR res:tLista);
VAR
	pAux:tLista;
BEGIN
	CopiarLista(l1,res);
	IF NOT EsListaVacia(l2) THEN
		pAux:= l2^.siguiente;
		REPEAT
			InsertarFinal(res,pAux^.elemento);
		UNTIL pAux=l2^.siguiente;
	
END;
END.
	
	
