UNIT UListaSimpleEstatica;
INTERFACE
	USES uElemento;
	CONST
		INI = 1;
		FIN = 10;
	TYPE 
		tRangoAlmacen = INI..FIN;
		tAlmacen = ARRAY [tRangoAlmacen] of tElemento;
		tRangoTope = 0..FIN;
		tLista = RECORD
			almacen: tAlmacen;
			tope:tRangoTope;
		END;
PROCEDURE CrearListaVacia(VAR lista:tLista);
PROCEDURE Construir(VAR lista:tLista;elem:tElemento);
PROCEDURE PrimeroLista( lista:tLista; VAR elem:tElemento);
PROCEDURE Resto(VAR lista:tLista);
FUNCTION EsListaVacia(lista:tLista):boolean;
FUNCTION Longitud(lista:tLista):integer;
PROCEDURE Ultimo(lista:tLista; VAR elem:tElemento);
FUNCTION Pertenece(lista:tLista; elem:tElemento):boolean;
PROCEDURE BorrarElemento(VAR lista:tLista;elem:tElemento);
PROCEDURE InsertarFinal(VAR lista:tLista;elem:tElemento);
PROCEDURE DestruirLista(VAR lista:tLista);
FUNCTION EsListaLlena(VAR lista:tLista):boolean;	//es trata de una operacion auxiliar

IMPLEMENTATION
FUNCTION EsListaLlena(VAR lista:tLista):boolean;
BEGIN
	EsListaLlena:= lista.tope = FIN;
END;

PROCEDURE CrearListaVacia(VAR lista:tLista);
BEGIN
	lista.tope := 0;
END;

PROCEDURE Construir(VAR lista:tLista;elem:tElemento);
VAR 
	i:integer;
BEGIN
	IF NOT EsListaLlena(lista) THEN BEGIN
		FOR i:= lista.tope DOWNTO INI DO 
			Asignar(lista.almacen[i],lista.almacen[i+1]);
		Asignar(elem,lista.almacen[INI]);
		lista.tope:= lista.tope+1;
	END;
END;
PROCEDURE PrimeroLista( lista:tLista; VAR elem:tElemento);
BEGIN
	Asignar(lista.almacen[INI],elem);
END;
PROCEDURE Resto(VAR lista:tLista);
VAR
	i:integer;
BEGIN
	FOR i:= INI TO lista.tope-1 DO
		Asignar(lista.almacen[i+1],lista.almacen[i]);
	lista.tope:= lista.tope-1;
END;
FUNCTION EsListaVacia(lista:tLista):boolean;
BEGIN
	EsListaVacia := lista.tope = 0;
END;
FUNCTION Longitud(lista:tLista):integer;
BEGIN
	Longitud:=lista.tope;
END;
PROCEDURE Ultimo(lista:tLista; VAR elem:tElemento);
BEGIN
	Asignar(lista.almacen[lista.tope],elem);
END;
FUNCTION Pertenece(lista:tLista; elem:tElemento):boolean;
VAR
	i:integer;
	encontrado:boolean;
BEGIN
	encontrado:= FALSE;
	i:= INI;
	WHILE (NOT encontrado ) AND (ini <= lista.tope) DO BEGIN
		encontrado:= EsIgual(elem,lista.almacen[i]);
		IF NOT encontrado THEN
			i:= i+1;
	END;
	Pertenece:= encontrado;
END;
PROCEDURE BorrarElemento(VAR lista:tLista;elem:tElemento);
VAR
	encontrado:boolean;
	i,iExpl:integer;
BEGIN
	encontrado:=FALSE;
	iExpl:= INI;
	WHILE (NOT encontrado) AND (iExpl <= lista.tope) DO BEGIN
		encontrado:= EsIgual(elem,lista.almacen[iExpl]);
		IF NOT encontrado THEN
			iExpl:= iExpl+ 1;
	END;
	
	IF encontrado THEN BEGIN
		FOR i:= iExpl TO lista.tope-1 DO 
			Asignar(lista.almacen[i+1],lista.almacen[i]);
		lista.tope:= lista.tope-1;
	END;
END;
PROCEDURE InsertarFinal(VAR lista:tLista;elem:tElemento);
BEGIN
	IF NOT EsListaLlena(lista)THEN BEGIN
		lista.tope:= lista.tope+1;
		Asignar(elem,lista.almacen[lista.tope]);
	END;
END;
PROCEDURE DestruirLista(VAR lista:tLista);
BEGIN
	lista.tope:= 0;
END;
END.
